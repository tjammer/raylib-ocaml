let setup () =
  Raylib.init_window 800 450 "raylib [core] example - generate random values";
  Raylib.set_target_fps 60

let rec loop frame_counter rval =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let rval, frame_counter =
        if (frame_counter / 120) mod 2 == 1
        then (get_random_value (-8) 5, 0)
        else (rval, frame_counter)
      in 
      begin_drawing ();
      clear_background Color.raywhite;
      draw_text "Every 2 seconds a new random value is generated:" 130 100 20
        Color.maroon;
      draw_text (Printf.sprintf "%i" rval) 360 180 80 Color.lightgray;
      end_drawing ();
      loop (1 + frame_counter) rval

let () = setup (); loop 0 0
