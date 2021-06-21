open Containers

(* json notes:
 * escape quotes for file endings
 * *)

(* TODO add descriptions *)

type name = { name : string; cname : string }

module Enum = struct
  type t = { name : name; values : name list; bitmask : bool }

  let def s = String.(lowercase_ascii s |> capitalize_ascii)

  (* find first '_' to skip enum name *)
  let strip_1st cname =
    let start = String.index cname '_' in
    String.drop (start + 1) cname

  let strip_2nd cname = strip_1st cname |> strip_1st

  let rstrip_1st cname =
    let start = String.rindex cname '_' in
    String.take start cname

  let value_of_cname enum_name cname =
    let name =
      match enum_name with
      | "PixelFormat" -> def cname
      | "GamepadAxis" | "GamepadButton" | "MouseCursor" ->
          strip_2nd cname |> def
      | "MouseButton" -> strip_1st cname |> rstrip_1st |> def
      | "NPatchType" ->
          strip_1st cname |> def
          |> String.replace ~sub:"3" ~by:"Three_"
          |> String.replace ~sub:"9" ~by:"Nine_"
      | _ -> strip_1st cname |> def
    in

    { name; cname }

  let name_of_cname cname =
    let bitmask =
      match cname with "ConfigFlag" | "GestureType" -> true | _ -> false
    in
    let name = match cname with "KeyboardKey" -> "Key" | _ -> cname in
    ({ name; cname }, bitmask)

  let of_json json =
    let open Yojson.Basic.Util in
    let name, bitmask = json |> member "name" |> to_string |> name_of_cname in
    let values =
      json |> member "values" |> to_list
      |> List.map (fun value -> member "name" value |> to_string)
      |> List.map (value_of_cname name.name)
    in
    match values with [] -> None | _ -> Some { name; values; bitmask }

  let stubs enum =
    let lower =
      "  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)\n\n"
      ^ "  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))\n\
         end\n\n"
    in

    Printf.sprintf "module %s = struct\n" enum.name.name
    ^ "  type%c t =\n"
    ^ (List.map
         (fun (value : name) ->
           Printf.sprintf "    | %s [@cname \"%s\"]\n" value.name value.cname)
         enum.values
      |> List.fold_left ( ^ ) "")
    ^ Printf.sprintf "  [@@cname \"%s\"] [@@typedef]%s" enum.name.cname
        (if enum.bitmask then " [@@with_bitmask]\n\n" else "\n\n")
    ^ lower

  let mli enum =
    let lower =
      "\n  val to_int : t -> int\n\n" ^ "  val of_int : int -> t\n" ^ "end\n\n"
    in
    Printf.sprintf "module %s : sig\n" enum.name.name
    ^ "  type t =\n"
    ^ (List.map
         (fun (value : name) -> Printf.sprintf "    | %s\n" value.name)
         enum.values
      |> List.fold_left ( ^ ) "")
    ^ lower
end

module Type = struct
  module StrTbl = Hashtbl.Make (String)

  let type_tbl = StrTbl.create 1

  (* special treatment for typedefs *)
  let () = StrTbl.replace type_tbl "Texture2D" "Texture"

  let () = StrTbl.replace type_tbl "Quaternion" "Vector4"

  (* TODO add description *)

  type field = { name : name; typ : name }

  type array_t = { typ : string; size : string }

  let array_t_eq a b = String.equal a.typ b.typ && String.equal a.size b.size

  type t = {
    name : name;
    fields : field list;
    arr : array_t list;
    forward : name list;
  }

  (* let def s = String.(lowercase_ascii s |> capitalize_ascii) *)
  let is_uppercase = function 'A' .. 'Z' -> true | _ -> false

  let to_snake_case s =
    let rec aux first acc = function
      | hd :: _ as lst when is_uppercase hd && not first ->
          aux true ('_' :: acc) lst
      | hd :: tl when is_uppercase hd && first ->
          (* eg the p in getFPS *)
          aux first (Char.lowercase_ascii hd :: acc) tl
      | hd :: tl -> aux false (hd :: acc) tl
      | [] -> List.rev acc |> String.of_list
    in
    aux false [] (String.to_list s)

  let strip_array name =
    match String.index_opt name '[' with
    | None -> (name, None)
    | Some start ->
        let end_ = String.index name ']' in
        let size = String.sub name (start + 1) (end_ - start - 1) in
        (String.take start name, Some size)

  let special_names = function "type" -> "typ" | name -> name

  let special_types = function
    (* hardcoded for now, but we could detect *)
    | "rAudioBuffer ptr" ->
        ( "audio_buffer ptr",
          Some { name = "audio_buffer"; cname = "rAudioBuffer" } )
    | typ -> (typ, None)

  let type_name cname type_tbl =
    let raytype name =
      match StrTbl.find_opt type_tbl name with
      | Some name -> name ^ ".t"
      | None -> name
    in
    String.split_on_char ' ' cname
    |> List.map (function
         | "unsigned" -> "u"
         | "*" -> " ptr"
         | "**" -> " ptr ptr"
         | name -> raytype name)
    |> List.fold_left ( ^ ) ""

  let field_of_json type_tbl field =
    let open Yojson.Basic.Util in
    let cname, arr = member "name" field |> to_string |> strip_array in
    let name = to_snake_case cname |> special_names in

    (* field *)
    let ctyp = member "type" field |> to_string in
    let stubs_type, forw = type_name ctyp type_tbl |> special_types in
    let name, stubs_type, arr =
      match arr with
      | None -> (name, stubs_type, None)
      | Some size ->
          (name, stubs_type ^ "_array_" ^ size, Some { typ = stubs_type; size })
    in
    let name = { name; cname } in

    let ret = { name; typ = { name = stubs_type; cname = ctyp } } in
    match (arr, forw) with
    | None, None -> `Std ret
    | None, Some typname -> `Forw (typname, ret)
    | Some arr, None -> `Array (arr, ret)
    | Some _, Some _ -> failwith "Can`t deal with that"

  let name_of_cname cname = { name = cname; cname }

  let of_json json =
    let open Yojson.Basic.Util in
    let name = json |> member "name" |> to_string |> name_of_cname in
    StrTbl.add type_tbl name.cname name.name;
    (* hardcode matrix *)
    match name.name with
    | "Matrix" ->
        let fields =
          List.init 16 (fun i ->
              let cname = Printf.sprintf "m%i" i in
              {
                name = { name = cname; cname };
                typ = { name = "float"; cname = "float" };
              })
        in
        { name; fields; arr = []; forward = [] }
    | _ ->
        let (arr, forward), fields =
          json |> member "fields" |> to_list
          |> List.map (field_of_json type_tbl)
          |> List.fold_map
               (fun (arrs, forws) field ->
                 match field with
                 | `Std field -> ((arrs, forws), field)
                 | `Array (arr, field) -> ((arr :: arrs, forws), field)
                 | `Forw (typname, (field : field)) ->
                     ((arrs, typname :: forws), field))
               ([], [])
        in
        let arr = List.uniq ~eq:array_t_eq arr in
        { name; fields; arr; forward }

  let stubs types =
    Printf.sprintf "module %s = struct\n" types.name.name
    ^ List.fold_left
        (fun acc { typ; size } ->
          acc
          ^ Printf.sprintf "  let%%c %s_array_%s = array %s %s\n\n" typ size
              size typ)
        "" types.arr
    ^ List.fold_left
        (fun acc { name; cname } ->
          acc ^ Printf.sprintf "  let%%c %s = structure \"%s\"\n\n" name cname)
        "" types.forward
    ^ "  type%c t = {\n"
    ^ (List.map
         (fun (field : field) ->
           Printf.sprintf "    %s : %s;%s" field.name.name field.typ.name
             (if String.(field.name.name <> field.name.cname) then
              " [@cname \"" ^ field.name.cname ^ "\"]\n"
             else "\n"))
         types.fields
      |> List.fold_left ( ^ ) "")
    ^ "  }\n"
    ^ ("  [@@cname \"" ^ types.name.cname ^ "\"]\n")
    ^ "end\n\n"
end

let () =
  let api = Yojson.Basic.from_file "raylib_api.json" in
  let open Yojson.Basic.Util in
  (* let () = api |> member "structs" |> to_list |> List.iter (fun s ->
   *     s |> member "name" |> to_string |> print_endline
   *   ) in *)
  let enums =
    api |> member "enums" |> to_list |> List.filter_map Enum.of_json
  in
  let stubs =
    (* TODO split rlgl off *)
    "let%c () = header \"#include <raylib.h>\\n#include <rlgl.h>\"\n\n"
    ^ (enums |> List.map Enum.stubs |> List.fold_left ( ^ ) "")
    ^ "let max_material_maps = [%c constant \"MAX_MATERIAL_MAPS\" camlint]\n\n"
    ^ "let max_shader_locations = [%c constant \"MAX_SHADER_LOCATIONS\" \
       camlint]"
  in
  (* print_string stubs; *)
  ignore stubs;
  let mli =
    "(** {1 Constants} *)\n\n"
    ^ (enums |> List.map Enum.mli |> List.fold_left ( ^ ) "")
    ^ "val max_material_maps : int\n\n" ^ "val max_shader_locations : int\n\n"
  in
  (* print_string mli; *)
  ignore mli;

  let types = api |> member "structs" |> to_list |> List.map Type.of_json in
  let stubs =
    "let%c () = header \"#include <raylib.h>\"\n\n"
    ^ (types |> List.map Type.stubs |> List.fold_left ( ^ ) "")
  in

  print_string stubs;

  ()
(* IO.(with_in "input14.txt" read_lines_l)
 * |> List.map decode |> apply_p1 |> print_int *)
