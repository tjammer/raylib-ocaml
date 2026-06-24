module Raylib = Raylib_core

(* The flag to int casting serves as a (manual) smoketest *)

let setup () =
  let flag = Raylib.ConfigFlags.(to_int window_resizable) in
  Raylib.set_config_flags Raylib.ConfigFlags.(of_int flag);
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let loop () =
  while
    not
      (Raylib.window_should_close ()
      ||
      let key = Raylib.Key.to_int Left in
      Raylib.is_key_down Raylib.Key.(of_int key))
  do
    let open Raylib in
    begin_drawing ();
    clear_background Color.raywhite;
    Raylib_text.draw_text "Congrats! You created your first window!" 190 200 20
      Color.lightgray;
    end_drawing ()
  done;
  Raylib.close_window ()

let () = setup () |> loop
