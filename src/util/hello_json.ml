open Containers

(* json notes:
 * escape quotes for file endings
 * *)

(* TODOS for enums
 * mousebutton *)
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

  let ctypes_mod enum =
    let lower =
      "  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)\n\n"
      ^ "  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))\n\
         end\n\n"
    in

    Printf.sprintf "module %s = struct\n" enum.name.name
    ^ "  type%c t =\n"
    ^ List.fold_left
        (fun acc (value : name) ->
          acc
          ^ Printf.sprintf "    | %s [@cname \"%s\"]\n" value.name value.cname)
        "" enum.values
    ^ Printf.sprintf "  [@@cname \"%s\"] [@@typedef]%s" enum.name.cname
        (if enum.bitmask then " [@@with_bitmask]\n\n" else "\n\n")
    ^ lower
end

(* enums can have empty values, see vector2
 * strip "Type" from enum? *)
let () =
  let api = Yojson.Basic.from_file "raylib_api.json" in
  let open Yojson.Basic.Util in
  (* let () = api |> member "structs" |> to_list |> List.iter (fun s ->
   *     s |> member "name" |> to_string |> print_endline
   *   ) in *)
  let constants =
    (* TODO split rlgl off *)
    "let%c () = header \"#include <raylib.h>\\n#include <rlgl.h>\"\n\n"
    ^ (api |> member "enums" |> to_list
      |> List.filter_map Enum.of_json
      |> List.map Enum.ctypes_mod |> List.fold_left ( ^ ) "")
    ^ "let max_material_maps = [%c constant \"MAX_MATERIAL_MAPS\" camlint]\n\n"
    ^ "let max_shader_locations = [%c constant \"MAX_SHADER_LOCATIONS\" \
       camlint]"
  in
  print_string constants;
  ()
(* IO.(with_in "input14.txt" read_lines_l)
 * |> List.map decode |> apply_p1 |> print_int *)
