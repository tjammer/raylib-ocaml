let () =
  print_endline "#include <rlgl.h>";

  Cstubs.write_c Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_rlgl.Description)
