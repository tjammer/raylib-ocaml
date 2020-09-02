let width = 800

let height = 450

let setup () =
  Raylib.init_window width height "raylib [core] example - keyboard input";
  Raylib.set_target_fps 60

let rec loop ball =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let ball =
        if is_key_down KeyboardKey.Right then
          Vector2.(create (x ball +. 2.0) (y ball))
        else ball
      in
      let ball =
        if is_key_down KeyboardKey.Left then
          Vector2.(create (x ball -. 2.0) (y ball))
        else ball
      in
      let ball =
        if is_key_down KeyboardKey.Up then
          Vector2.(create (x ball) (y ball -. 2.0))
        else ball
      in
      let ball =
        if is_key_down KeyboardKey.Down then
          Vector2.(create (x ball) (y ball +. 2.0))
        else ball
      in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_text "move the ball with arrow keys" 10 10 20 Color.darkgray;
      draw_circle_v ball 50.0 Color.maroon;
      end_drawing ();
      loop ball

let () =
  setup ();
  loop
    (Raylib.Vector2.create
       (Float.of_int width /. 2.0)
       (Float.of_int height /. 2.0))
