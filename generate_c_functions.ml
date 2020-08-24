let () =
  print_endline "#include <raylib.h>";

  Cstubs.write_c Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_c_function_descriptions.M)
