let setup () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let loop () =
  let open Raylib in
  while not (window_should_close ()) do
    begin_drawing ();
    clear_background Color.raywhite;
    draw_text "Congrats! You created your first window!" 190 200 20
      Color.lightgray;
    end_drawing ()
  done;
  close_window ()

let () = setup () |> loop
