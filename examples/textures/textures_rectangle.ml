let width = 800

let height = 450

let position = Raylib.Vector2.create 350.0 280.0

let max_frame_speed = 14

let setup () =
  let open Raylib in
  init_window width height "raylib [textures] example - texture rectangle";
  let scarfy = load_texture "resources/scarfy.png" in
  let frame_rec =
    Rectangle.create 0.0 0.0
      (Float.of_int (Texture2D.width scarfy) /. 6.0)
      (Float.of_int (Texture2D.height scarfy))
  in
  set_target_fps 60;
  (scarfy, frame_rec)

let rec loop scarfy frame_rec counter frame frames_speed =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let module R = Raylib.Rectangle in
      let counter = succ counter in
      let counter, frame, frame_rec =
        if counter >= 60 / frames_speed then
          let frame = succ frame in
          let frame = if frame > 5 then 0 else frame in
          let frame_rec =
            R.(
              create
                ( Float.of_int frame
                *. (Float.of_int (Texture2D.width scarfy) /. 6.0) )
                (y frame_rec) (width frame_rec) (height frame_rec))
          in
          (0, frame, frame_rec)
        else (counter, frame, frame_rec)
      in
      let frames_speed =
        if is_key_pressed Key.Right then min max_frame_speed (succ frames_speed)
        else if is_key_pressed Key.Left then max 1 (pred frames_speed)
        else frames_speed
      in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_texture scarfy 15 40 Color.white;
      draw_rectangle_lines 15 40 (Texture2D.width scarfy)
        (Texture2D.height scarfy) Color.lime;
      draw_rectangle_lines
        (15 + Int.of_float (R.x frame_rec))
        (40 + Int.of_float (R.y frame_rec))
        (Int.of_float (R.width frame_rec))
        (Int.of_float (R.height frame_rec))
        Color.red;

      draw_text "FRAME SPEED: " 165 210 10 Color.darkgray;
      draw_text
        (Printf.sprintf "%02i FPS" frames_speed)
        575 210 10 Color.darkgray;
      draw_text "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!" 290 240 10
        Color.darkgray;

      draw_texture_rec scarfy frame_rec position Color.white;
      draw_text "(c) Scarfy sprite by Eiden Marsal" (width - 200) (height - 20)
        10 Color.gray;

      for cur = 0 to max_frame_speed do
        if cur < frames_speed then
          draw_rectangle (250 + (21 * cur)) 205 20 20 Color.red
        else draw_rectangle_lines (250 + (21 * cur)) 205 20 20 Color.maroon
      done;

      end_drawing ();
      loop scarfy frame_rec counter frame frames_speed

let () =
  let scarfy, frame_rec = setup () in
  loop scarfy frame_rec 0 0 8
