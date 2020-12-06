let san_functions s =
  let re = Str.regexp "Raylib_c.Raylib_c_generated_functions\\.r[a-z]+" in
  Str.global_replace re "" s

let san_math_funs s =
  let re = Str.regexp "Raylib_c.Raylib_c_generated_math\\.r[a-z]+" in
  Str.global_replace re "" s

let delete_math s =
  let re = Str.regexp "^module Math :[^\"]*end\n..end" in
  Str.global_replace re "" s

let delete_val_ts s =
  let re = Str.regexp "val t :.*Ctypes.typ" in
  Str.global_replace re "" s

let delete_types_module s =
  Str.global_replace (Str.regexp "^module Types.*\n") "" s

let make_types_abstract s =
  let re = Str.regexp "type t' = Types.\\([A-Za-z0-9]+\\).t" in
  Str.global_replace re "type t'" s

let fix_abstract_wrapper s =
  let re1 = Str.regexp "\\(type 'a ctyp\\) = 'a.*\n" in
  let re2 = Str.regexp " -> ('a.*ured Ctypes.ptr" in
  Str.global_replace re1 "\\1\n" s
  |> Str.global_replace re2 " -> ('a ctyp) Ctypes.ptr"

let fixup_modules s =
  let rec inner s mn =
    let re = Str.regexp "^module \\(.*\\) :" in
    try
      let _ = Str.search_forward re s mn in
      let mn = Str.match_beginning () in
      let name = Str.matched_group 1 s in
      let _ = Str.search_forward (Str.regexp " end\n") s (Str.match_end ()) in
      let mx = Str.match_end () in

      let modle_orig = String.sub s mn (mx - mn) in

      let re = Printf.sprintf "(?Types.%s.*structured?" name |> Str.regexp in
      let modle = Str.global_replace re "t" modle_orig in

      let re = Str.regexp "(?Types.\\([A-Za-z0-9]+\\).*structured?" in
      let modle = Str.global_replace re "\\1.t" modle in

      let re = Str.regexp "Raylib_math.Types.\\([A-Za-z0-9]+\\).t.*structure" in
      let modle = Str.global_replace re "\\1.t" modle in

      let re =
        Str.regexp "Raylib_generated_types.\\([A-Za-z0-9]+\\).t.*structure"
      in
      let modle = Str.global_replace re "\\1.t" modle in

      let modle = Str.global_replace (Str.regexp "Raylib_math.") "" modle in

      let s =
        String.sub s 0 mn ^ modle ^ String.sub s mx (String.length s - mx)
      in
      inner s (mn + String.length name + 12)
    with Not_found -> s
  in

  inner s 0

let fixup_functions s =
  let types =
    Str.regexp "Raylib_functions.Types.\\([A-Za-z0-9]+\\).t.*structure"
  in
  let constants =
    Str.regexp "Raylib_functions.Constants.\\([A-Za-z0-9]+\\).t"
  in
  s |> Str.global_replace types "\\1.t" |> Str.global_replace constants "\\1.t"

let make_math_types_recursive s =
  s
  |> Str.global_replace (Str.regexp "^module Vector3") "module rec Vector3"
  |> Str.global_replace (Str.regexp "^module Vector4") "and Vector4"
  |> Str.global_replace (Str.regexp "^module Matrix") "and Matrix"

let () =
  let ch = open_in Sys.argv.(1) in
  really_input_string ch (in_channel_length ch)
  |> san_functions |> san_math_funs |> delete_math |> delete_val_ts
  |> fixup_functions |> fixup_modules |> make_math_types_recursive
  |> delete_types_module |> make_types_abstract |> fix_abstract_wrapper
  |> print_string
