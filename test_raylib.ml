(* let () = Raylibml.M.raylib_stub_1_InitWindow(400, 500, "test") *)
module Raylib =
  Raylib_c_function_descriptions.M (Raylibml.Raylib_c_generated_functions.M)

let rec loop () =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      begin_drawing ();
      draw_fps 10 10;
      clear_background Raylib.Color.white;
      draw_text "Congrats! You created your first window!" 190 200 20
        Raylib.Color.lightgray;
      end_drawing ();
      loop ()

let () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let () = loop ()
