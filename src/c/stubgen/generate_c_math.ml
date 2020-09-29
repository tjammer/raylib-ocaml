let () =
  print_endline "#include <raymath.h>";

  Cstubs.write_c Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_math.Description)
