let () =
  print_endline "#include <raylib.h>";

  Cstubs_structs.write_c Format.std_formatter
    (module Raylib_types.Descriptions)
