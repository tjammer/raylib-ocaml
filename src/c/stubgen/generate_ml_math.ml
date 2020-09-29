let () =
  Cstubs.write_ml Format.std_formatter ~prefix:Sys.argv.(1)
    (module Raylib_math.Description)
