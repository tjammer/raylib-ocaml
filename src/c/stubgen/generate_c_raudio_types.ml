let () =
  print_endline "#include <raylib.h>\n#include <config.h>";

  Cstubs_structs.write_c Format.std_formatter (module Raudio_types.Types)
