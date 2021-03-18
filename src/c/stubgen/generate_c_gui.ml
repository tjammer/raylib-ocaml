let () =
  print_endline "#define RAYGUI_IMPLEMENTATION\n#define RAYGUI_SUPPORT_ICONS\n#include <raygui.h>";

  Cstubs.write_c Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raygui_functions.Description)
