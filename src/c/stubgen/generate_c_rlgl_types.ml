let () =
  print_endline "#include <raylib.h>\n#include <rlgl.h>";

  Cstubs_structs.write_c Format.std_formatter (module Rlgl_types.Types)
