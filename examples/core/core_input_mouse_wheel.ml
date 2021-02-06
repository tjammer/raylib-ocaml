let width = 800

let height = 450

let scroll_speed = 4

let setup () =
  Raylib.init_window width height "raylib [core] example - input mouse wheel";
  Raylib.set_target_fps 60

let rec loop box_position =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let box_position =
        (box_position - (get_mouse_wheel_move ()) * scroll_speed)
      in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_rectangle (width/2 - 40) box_position 80 80 Color.maroon;
      draw_text "Use mouse wheel to move the cube up and down!" 10 10 20
        Color.gray;
      draw_text (Printf.sprintf "Box position Y: %03i" box_position) 20 40 20
        Color.lightgray;
      end_drawing ();
      loop box_position

let () =
  setup ();
  loop
    (height/2)
