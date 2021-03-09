let width = 800

let height = 450

let setup () =
  Raylib.init_window width height "raylib [core] example - mouse input";
  Raylib.set_target_fps 60

let rec loop ball_color =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let ball_pos = get_mouse_position () in
      let ball_color =
        if is_mouse_button_down MouseButton.Left then Color.maroon
        else if is_mouse_button_down MouseButton.Middle then Color.lime
        else if is_mouse_button_down MouseButton.Right then Color.darkblue
        else ball_color
      in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_text
        "move ball_pos with mouse and click mouse button to change color" 10 10
        20 Color.darkgray;
      draw_circle_v ball_pos 50.0 ball_color;
      end_drawing ();
      loop ball_color

let () =
  setup ();
  loop Raylib.Color.darkblue
