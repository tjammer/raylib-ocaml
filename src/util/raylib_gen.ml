open Containers

(* json notes:
 * escape quotes for file endings
 * forward decls *)

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
      | "GamepadAxis" | "GamepadButton" | "MouseCursor" | "MaterialMapIndex"
      | "ShaderLocationIndex" | "ShaderUniformDataType" | "TextureFilter"
      | "TextureWrap" | "CubemapLayout" | "MouseButton"
      | "ShaderAttributeDataType" ->
          strip_2nd cname |> def
      | "NPatchType" ->
          strip_1st cname |> def
          |> String.replace ~sub:"3" ~by:"Three_"
          |> String.replace ~sub:"9" ~by:"Nine_"
      | _ -> strip_1st cname |> def
    in

    { name; cname }

  let name_of_cname cname =
    let bitmask =
      match cname with "ConfigFlags" | "Gesture" -> true | _ -> false
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
      (* "  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)\n" *)
      (* ^ "  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))\n\ *)
         (*    end\n\n" *)
      "  end\n\n"
    in

    Printf.sprintf "module %s = struct\n" enum.name.name
    ^ "  type t =\n"
    ^ (List.map
         (fun (value : name) -> Printf.sprintf "    | %s\n" value.name)
         enum.values
      |> String.concat "")
    ^ "\n  let vals =\n    [\n"
    ^ (List.map
         (fun (value : name) ->
           Printf.sprintf "      (%s, constant \"%s\" int64_t);\n" value.name
             value.cname)
         enum.values
      |> String.concat "")
    ^ "    ]\n\n"
    ^ Printf.sprintf "  let t = enum \"%s\" ~typedef:true vals\n\n"
        enum.name.cname
    ^ lower

  let impl enum =
    let nm = enum.name.name in
    Printf.sprintf "module %s = struct\n  include %s\n\n" nm nm
    ^ (if enum.bitmask then
       Printf.sprintf
         "  let t_bitmask = build_enum_bitmask \"%s\" Ctypes.int64_t \
          ~typedef:true vals\n\n"
         nm
      else "")
    ^ "  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)\n"
    ^ "  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))\n\
       end\n\n"

  let itf enum =
    let lower =
      "\n  val to_int : t -> int\n\n" ^ "  val of_int : int -> t\n" ^ "end\n\n"
    in
    Printf.sprintf "module %s : sig\n" enum.name.name
    ^ "  type t =\n"
    ^ (List.map
         (fun (value : name) -> Printf.sprintf "    | %s\n" value.name)
         enum.values
      |> String.concat "")
    ^ lower
end

module Naming = struct
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
    (* true, b/c we want to start lowercase without '_' *)
    aux true [] (String.to_list s)
end

module Typing = struct
  module StrTbl = Hashtbl.Make (String)

  type t =
    | C of string
    | Ray of string
    | Forw_decl of name
    | Array of int * string
    | Ptr of t

  let is_builtin = function
    | "int" | "uint" | "char" | "uchar" | "float" | "bool" | "void" | "short"
    | "ushort" ->
        true
    | "const char" -> true
    | _ -> false

  let array_eq (asize, atyp) (bsize, btyp) =
    String.equal atyp btyp && asize = bsize

  let type_tbl = StrTbl.create 1

  (* special treatment for typedefs *)
  let () =
    StrTbl.replace_seq type_tbl
      (Seq.of_list
         [
           ("Texture2D", "Texture");
           ("Quaternion", "Vector4");
           ("RenderTexture2D", "RenderTexture");
           ("TextureCubemap", "Texture");
           ("Camera", "Camera3D");
         ])

  let of_cname cname arr =
    let convert a =
      if is_builtin a then C a
      else
        match StrTbl.find_opt type_tbl a with
        | Some name -> Ray name
        | None -> Forw_decl { name = Naming.to_snake_case a; cname = a }
    in

    let rec aux acc = function
      | "const" :: tl -> aux (acc ^ "const ") tl
      | "unsigned" :: tl -> aux (acc ^ "u") tl
      | "\\*" :: _ | "\\*\\*" :: _ -> failwith "Something after pointer"
      | [ "*" ] -> Ptr (convert acc)
      | [ "**" ] -> Ptr (Ptr (convert acc))
      | str :: tl -> aux (acc ^ str) tl
      | [] -> convert acc
    in
    match (arr, aux "" @@ String.split_on_char ' ' cname) with
    | Some count, C typ | Some count, Ray typ -> Array (count, typ)
    | None, ret -> ret
    | Some _, _ -> failwith "Array with wrong type"

  let rec name_type ?(ptr = "") = function
    | C "const char" -> "string"
    | C name -> name ^ ptr
    | Ray name -> name ^ ".t" ^ ptr
    | Forw_decl name -> name.name ^ ptr
    | Array (size, name) -> Printf.sprintf "%s_array_%i" name size ^ ptr
    | Ptr typ -> name_type ~ptr:(" ptr" ^ ptr) typ

  let rec name_type_ctypes ?(acc = "") = function
    | Ptr (C "const char") -> "string"
    | C "const char" when String.(acc = "(ptr ") -> "string"
    | C name -> acc ^ name
    | Ray name -> acc ^ name ^ ".t"
    | Forw_decl name -> acc ^ name.name
    | Array (size, name) -> acc ^ Printf.sprintf "%s_array_%i" name size
    | Ptr typ -> name_type_ctypes ~acc:(acc ^ "(ptr ") typ ^ ")"
end

module Type = struct
  type field = { name : name; typ : Typing.t; desc : string option }
  type t = { name : name; fields : field list }

  let strip_array name =
    match String.index_opt name '[' with
    | None -> (name, None)
    | Some start ->
        let end_ = String.index name ']' in
        let size = String.sub name (start + 1) (end_ - start - 1) in
        (String.take start name, Some (int_of_string size))

  let special_names = function "type" -> "typ" | name -> name

  let field_of_json field =
    let open Yojson.Basic.Util in
    let cname = member "name" field |> to_string in
    let name = Naming.to_snake_case cname |> special_names in

    (* field *)
    let ctyp, arr = member "type" field |> to_string |> strip_array in
    let typ = Typing.of_cname ctyp arr in
    let name = { name; cname } in

    let desc =
      member "description" field |> to_string |> fun s ->
      if String.is_empty s then None else Some s
    in

    { name; typ; desc }

  let name_of_cname cname = { name = cname; cname }

  let of_json json =
    let open Yojson.Basic.Util in
    let name = json |> member "name" |> to_string |> name_of_cname in
    Typing.(StrTbl.add type_tbl name.cname name.name);
    (* hardcode matrix *)
    match name.name with
    | "Matrix" ->
        let fields =
          List.init 16 (fun i ->
              let cname = Printf.sprintf "m%i" i in
              { name = { name = cname; cname }; typ = C "float"; desc = None })
        in
        { name; fields }
    | _ ->
        let fields =
          json |> member "fields" |> to_list |> List.map field_of_json
        in

        { name; fields }

  let stub_of_field { name; typ; desc = _ } =
    Printf.sprintf "  let %s = field t \"%s\" %s\n" name.name name.cname
      (Typing.name_type_ctypes typ)

  let ctor_fields typ f =
    if
      List.for_all
        (fun field ->
          match field.typ with
          | C "int" | C "float" -> true
          | Ptr _ | Array _ | Forw_decl _ | C _ -> false
          | _ -> true)
        typ.fields
    then Some (List.map f typ.fields)
    else None

  let ctor_types typ = ctor_fields typ (fun field -> Typing.name_type field.typ)

  let ctor_itf typ =
    match ctor_types typ with
    | Some names ->
        List.fold_left (fun acc s -> acc ^ s ^ " -> ") "  val create : " names
        ^ "t\n" ^ "  (** [create "
        ^ (List.map (fun (f : field) -> f.name.name) typ.fields
          |> String.concat " ")
        ^ "] *)\n\n"
    | None -> ""

  let getter_itf has_count (field : field) =
    let open Option.Infix in
    let start = Printf.sprintf "  val %s : t -> " field.name.name in
    if String.mem ~sub:"_count" field.name.name then None
    else
      let* getter =
        match field.typ with
        | Ptr (Forw_decl _) | Ptr (C _) -> None
        | Ptr typ when has_count field.name.name |> Option.is_some ->
            Some (start ^ Typing.name_type typ ^ " CArray.t\n")
        | C _ | Ray _ | Ptr _ -> Some (start ^ Typing.name_type field.typ ^ "\n")
        | Forw_decl _ -> None
        | Array (size, typ) ->
            (* arbitrary cutoff at 10 *)
            if size > 10 then None
            else Some (start ^ typ ^ " Ctypes_static.carray\n")
      in
      match field.desc with
      | Some desc -> getter ^ "  (** " ^ desc ^ " *)\n" |> Option.pure
      | None -> getter ^ "" |> Option.pure

  let setter_itf has_count (field : field) =
    let start = Printf.sprintf "  val set_%s : t -> " field.name.name in
    let end_ = " -> unit\n" in
    if String.mem ~sub:"_count" field.name.name then None
    else
      match field.typ with
      | Ptr (Forw_decl _) | Ptr (C _) -> None
      | Ptr typ when has_count field.name.name |> Option.is_some ->
          Some (start ^ Typing.name_type typ ^ " CArray.t" ^ end_)
      | C _ | Ray _ | Ptr _ -> Some (start ^ Typing.name_type field.typ ^ end_)
      | Forw_decl _ -> None
      | Array (size, typ) ->
          if size > 10 then None
          else
            Some
              (start
              ^ String.concat " -> " (List.init size (fun _ -> typ))
              ^ end_)

  let has_count fields plural =
    match
      List.find_opt
        (fun (f : field) ->
          match String.(find ~sub:"_count" f.name.name) with
          | -1 -> false
          | idx -> String.(mem ~sub:(take idx f.name.name) plural))
        fields
    with
    | Some field -> Some field.name.name
    | None -> None

  let itf typ =
    Printf.sprintf "module %s : sig\n" typ.name.name
    ^ "  type t'\n\n" ^ "  type t = t' ctyp\n\n  val t : t Ctypes.typ\n\n"
    ^ ctor_itf typ
    (* getters *)
    ^ (List.filter_map (getter_itf @@ has_count typ.fields) typ.fields
      |> String.concat "\n")
    (* setters *)
    ^ "\n"
    ^ (List.filter_map (setter_itf @@ has_count typ.fields) typ.fields
      |> String.concat "\n")
    ^ "end\n\n"

  let ctor_names typ = ctor_fields typ (fun field -> field.name.name)

  let ctor_impl typ =
    match ctor_names typ with
    | Some names ->
        let typ_nm = String.lowercase_ascii typ.name.cname in
        "  let create " ^ String.concat " " names ^ " =\n"
        ^ Printf.sprintf "    let %s = make t in\n" typ_nm
        ^ (List.map
             (fun name ->
               Printf.sprintf "    setf %s Types.%s.%s %s;" typ_nm typ.name.name
                 name name)
             names
          |> String.concat "\n")
        ^ "\n    " ^ typ_nm ^ "\n\n"
    | None -> ""

  let getter_impl typ has_count (field : field) =
    let typ_nm = String.lowercase_ascii typ.name.name in
    let start = Printf.sprintf "  let %s %s = " field.name.name typ_nm in
    let def =
      start
      ^ Printf.sprintf "\n    getf %s Types.%s.%s\n" typ_nm typ.name.name
          field.name.name
    in
    if String.mem ~sub:"_count" field.name.name then None
    else
      match (field.typ, has_count field.name.name) with
      | Ptr (Forw_decl _), _ | Ptr (C _), _ -> None
      | Ptr _, Some count ->
          Some
            (start
            ^ Printf.sprintf "\n    let count = getf %s Types.%s.%s in\n" typ_nm
                typ.name.name count
            ^ Printf.sprintf "    CArray.from_ptr (getf %s Types.%s.%s) count\n"
                typ_nm typ.name.name field.name.name)
      | C _, _ | Ray _, _ | Ptr _, _ -> Some def
      | Forw_decl _, _ -> None
      | Array (size, _), _ ->
          (* arbitrary cutoff at 10 *)
          if size > 10 then None else Some def

  let setter_impl typ has_count (field : field) =
    let typ_nm = String.lowercase_ascii typ.name.name in
    let start =
      Printf.sprintf "  let set_%s %s %s =\n" field.name.name typ_nm
        field.name.name
    in
    if String.mem ~sub:"_count" field.name.name then None
    else
      match field.typ with
      | Ptr (Forw_decl _) | Ptr (C _) -> None
      | Ptr _ when has_count field.name.name |> Option.is_some ->
          Some
            (start
            ^ Printf.sprintf "    setf %s Types.%s.%s (CArray.start %s)\n"
                typ_nm typ.name.name field.name.name field.name.name)
      | C _ | Ray _ | Ptr _ ->
          Some
            (start
            ^ Printf.sprintf "    setf %s Types.%s.%s %s\n" typ_nm typ.name.name
                field.name.name field.name.name)
      | Forw_decl _ -> None
      | Array (size, _) ->
          if size > 10 then None
          else
            let vals = List.init size (fun i -> "v" ^ string_of_int i) in

            Printf.sprintf "  let set_%s %s " field.name.name typ_nm
            ^ String.concat " " vals ^ " = \n"
            ^ Printf.sprintf "    let arr = %s %s in\n    " field.name.name
                typ_nm
            ^ (List.mapi
                 (fun i s -> "CArray.set arr " ^ string_of_int i ^ " " ^ s)
                 vals
              |> String.concat ";\n    ")
            ^ "\n"
            |> Option.pure

  let impl typ =
    let nm = typ.name.name in
    Printf.sprintf "module %s = struct\n" nm
    ^ "  type t' = Types." ^ nm ^ ".t\n\n" ^ "  type t = t' ctyp\n\n"
    ^ Printf.sprintf "  let t = Types.%s.t\n\n" nm
    ^ ctor_impl typ
    (* getters *)
    ^ (List.filter_map (getter_impl typ @@ has_count typ.fields) typ.fields
      |> String.concat "\n")
    (* setters *)
    ^ "\n"
    ^ (List.filter_map (setter_impl typ @@ has_count typ.fields) typ.fields
      |> String.concat "\n")
    ^ "end\n\n"

  let stub typ =
    Printf.sprintf "module %s = struct\n" typ.name.name
    (* arrays *)
    ^ (List.filter_map
         (fun field ->
           match field.typ with
           | Typing.Array (size, typ) -> Some (size, typ)
           | _ -> None)
         typ.fields
      |> List.uniq ~eq:Typing.array_eq
      |> List.fold_left
           (fun acc (size, typ) ->
             acc
             ^ Printf.sprintf "  let %s_array_%i = array %i %s\n\n" typ size
                 size typ)
           "")
    (* forward decls *)
    ^ (List.filter_map
         (fun field ->
           match field.typ with
           | Typing.Forw_decl name | Ptr (Forw_decl name) -> Some name
           | _ -> None)
         typ.fields
      |> List.fold_left
           (fun acc { name; cname } ->
             acc ^ Printf.sprintf "  let %s = structure \"%s\"\n\n" name cname)
           "")
    ^ "  type t\n  let t : t Ctypes.structure typ = structure \""
    ^ typ.name.cname ^ "\"\n"
    ^ (List.map stub_of_field typ.fields |> String.concat "")
    ^ "  let () = seal t\n" ^ "end\n\n"
end

module Function = struct
  type param = { name : name; typ : Typing.t }

  type t = {
    name : name;
    desc : string option;
    return : Typing.t;
    params : param list;
  }

  let to_name cname = { name = Naming.to_snake_case cname; cname }

  let to_param cname typ =
    { name = to_name cname; typ = Typing.of_cname typ None }

  let of_json json =
    let open Yojson.Basic.Util in
    let name = json |> member "name" |> to_string |> to_name in

    let desc =
      json |> member "description" |> to_string |> fun s ->
      if String.is_empty s then None else Some s
    in
    let return =
      json |> member "returnType" |> to_string |> fun cname ->
      Typing.of_cname cname None
    in
    let params =
      ( (json |> member "params" |> function
         | `Null -> []
         | `List l -> l
         | _ -> failwith "Expected list")
      |> fun l -> (filter_member "name" l, filter_member "type" l) )
      |> fun (a, b) ->
      List.combine a b
      |> List.map (fun (cname, typ) ->
             to_param (to_string cname) (to_string typ))
    in
    { name; desc; return; params }

  let stub func =
    "  let " ^ func.name.name ^ " =\n    foreign \"" ^ func.name.cname ^ "\" ("
    ^ (match func.params with
      | [] -> "void"
      | l ->
          List.map (fun p -> Typing.name_type_ctypes p.typ) l
          |> String.concat " @-> ")
    ^ " @-> returning "
    ^ Typing.name_type_ctypes func.return
    ^ ")\n\n"

  let itf func =
    "val " ^ func.name.name ^ " : "
    ^ (match func.params with
      | [] -> "unit"
      | l ->
          List.map (fun p -> Typing.name_type p.typ) l |> String.concat " -> ")
    ^ " -> "
    ^ String.replace ~sub:"void" ~by:"unit"
    @@ Typing.name_type func.return
    ^ "\n(** [" ^ func.name.name ^ " "
    ^ (match func.params with
      | [] -> "()"
      | l -> List.map (fun (p : param) -> p.name.name) l |> String.concat " ")
    ^ "] "
    ^ (match func.desc with None -> "" | Some d -> d)
    ^ "*)\n"
end

let () =
  let api = Yojson.Basic.from_file "src/util/raylib_api.json" in
  let open Yojson.Basic.Util in
  let enums =
    api |> member "enums" |> to_list |> List.filter_map Enum.of_json
  in
  (* TODO type and constants in one functor *)
  let stubs =
    "module Types (F : Ctypes.TYPE) = struct\nopen F\n"
    ^ (enums |> List.map Enum.stubs |> String.concat "")
    ^ "end\n"
    ^ "let max_material_maps = [%c constant \"MAX_MATERIAL_MAPS\" camlint]\n\n"
    ^ "let max_shader_locations = [%c constant \"MAX_SHADER_LOCATIONS\" \
       camlint]"
  in
  (* print_string stubs; *)
  ignore stubs;
  let impl = enums |> List.map Enum.impl |> String.concat "" in
  (* print_string impl; *)
  ignore impl;
  let itf =
    "(** {1 Constants} *)\n\n"
    ^ (enums |> List.map Enum.itf |> String.concat "")
    ^ "val max_material_maps : int\n\n" ^ "val max_shader_locations : int\n\n"
  in
  (* print_string itf; *)
  ignore itf;

  let types = api |> member "structs" |> to_list |> List.map Type.of_json in
  let stubs = types |> List.map Type.stub |> String.concat "" in
  (* print_string stubs; *)
  ignore stubs;
  let itf = types |> List.map Type.itf |> String.concat "" in
  (* print_string itf; *)
  ignore itf;
  let impl = types |> List.map Type.impl |> String.concat "" in
  (* print_string impl; *)
  ignore impl;

  let funcs =
    api |> member "functions" |> to_list |> List.map Function.of_json
  in
  let stubs = funcs |> List.map Function.stub |> String.concat "" in
  print_string stubs;
  ignore stubs;
  let itf = funcs |> List.map Function.itf |> String.concat "\n" in
  (* print_string itf; *)
  ignore itf;
  ()
