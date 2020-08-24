(* This file is part of Luv, released under the MIT license. See LICENSE.md for
   details, or visit https://github.com/aantron/luv/blob/master/LICENSE.md. *)

let () =
  print_endline "module M =";
  print_endline "struct";

  Cstubs.write_ml Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_c_function_descriptions.M);

  print_endline "end"
