let () =
  Cstubs.write_ml Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_c_function_descriptions.Description);
