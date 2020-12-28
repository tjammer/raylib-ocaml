let width = 800

let height = 450

let max_buildings = 100

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Window_resizable ];
  init_window width height "raylib [core] example - 2d camera";
  let player = Rectangle.create 400.0 280.0 40.0 40.0 in
  let spacing = ref 0 in
  let buildings =
    Array.init 100 (fun _ ->
        let bheight = get_random_value 100 800 in
        let rect =
          Rectangle.create
            (Float.of_int (-6000 + !spacing))
            (Float.of_int (height - 130 - bheight))
            (Float.of_int (get_random_value 50 200))
            (Float.of_int bheight)
        in
        spacing := !spacing + Int.of_float (Rectangle.width rect);
        rect)
  in
  let colors =
    Array.init 100 (fun _ ->
        Color.create (get_random_value 200 240) (get_random_value 200 240)
          (get_random_value 200 250) 255)
  in
  let camera =
    Camera2D.create
      (Vector2.create (Float.of_int width /. 2.0) (Float.of_int height /. 2.0))
      (Vector2.create (Rectangle.x player +. 20.0) (Rectangle.y player +. 20.0))
      0.0 1.0
  in
  Raylib.set_target_fps 60;
  (player, buildings, colors, camera)

let rec loop (player, buildings, colors, camera) =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      ( if is_key_down Key.Right then Rectangle.(set_x player (x player +. 2.0))
      else if is_key_down Key.Left then
        Rectangle.(set_x player (x player -. 2.0)) );

      Camera2D.set_target camera
        (Vector2.create
           (Rectangle.x player +. 20.0)
           (Rectangle.y player +. 20.0));

      ( if is_key_down Key.A then
        Camera2D.(
          set_rotation camera (Float.max (-40.0) (rotation camera -. 1.0)))
      else if is_key_down Key.S then
        Camera2D.(set_rotation camera (Float.min 40.0 (rotation camera +. 1.0)))
      );

      Camera2D.(
        set_zoom camera (zoom camera +. (get_mouse_wheel_move () *. 0.05)));

      ( if Camera2D.zoom camera > 3.0 then Camera2D.(set_zoom camera 3.0)
      else if Camera2D.zoom camera < 0.1 then Camera2D.(set_zoom camera 0.1) );

      if is_key_pressed Key.R then (
        Camera2D.(
          set_zoom camera 1.0;
          set_rotation camera 0.0) );

      begin_drawing ();
      clear_background Color.raywhite;
      begin_mode_2d camera;

      draw_rectangle (-6000) 320 13000 8000 Color.darkgray;
      Array.iter2
        (fun building color -> draw_rectangle_rec building color)
        buildings colors;

      draw_rectangle_rec player Color.red;

      let camx = Int.of_float (camera |> Camera2D.target |> Vector2.x) in
      let camy = Int.of_float (camera |> Camera2D.target |> Vector2.y) in
      draw_line camx (-height * 10) camx (height * 10) Color.green;
      draw_line (-width * 10) camy (width * 10) camy Color.green;

      end_mode_2d ();

      draw_text "SCREEN AREA" 640 10 20 Color.red;
      draw_rectangle 0 0 width 5 Color.red;
      draw_rectangle 0 5 5 (height - 10) Color.red;
      draw_rectangle (width - 5) 5 5 (height - 10) Color.red;
      draw_rectangle 0 (height - 5) width 5 Color.red;

      draw_rectangle 10 10 250 113 (fade Color.skyblue 0.5);
      draw_rectangle_lines 10 10 250 113 Color.blue;

      draw_text "Free 2d camera controls:" 20 20 10 Color.black;
      draw_text "- Right/Left to move Offset" 40 40 10 Color.darkgray;
      draw_text "- Mouse Wheel to Zoom in-out" 40 60 10 Color.darkgray;
      draw_text "- A / S to Rotate" 40 80 10 Color.darkgray;
      draw_text "- R to reset Zoom and Rotation" 40 100 10 Color.darkgray;
      end_drawing ();
      loop (player, buildings, colors, camera)

let () = setup () |> loop
