let () =
  print_endline "#include <raygui.h>";

  Cstubs_structs.write_c Format.std_formatter (module Raygui_types.Types)
