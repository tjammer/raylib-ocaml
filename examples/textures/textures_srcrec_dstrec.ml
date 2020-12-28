let width = 800

let height = 450

let setup () =
  let open Raylib in
  init_window width height
    "raylib [textures] example - texture source and destination rectangles";
  let scarfy = load_texture "resources/scarfy.png" in
  let frame_width = Texture.width scarfy / 6 in
  let frame_height = Texture.height scarfy in
  let source_rec =
    Rectangle.create 0.0 0.0 (Float.of_int frame_width)
      (Float.of_int frame_height)
  in
  let dest_rec =
    Rectangle.create
      (Float.of_int width /. 2.0)
      (Float.of_int height /. 2.0)
      (Float.of_int frame_width *. 2.0)
      (Float.of_int frame_height *. 2.0)
  in
  let origin =
    Vector2.create (Float.of_int frame_width) (Float.of_int frame_height)
  in
  set_target_fps 60;
  (scarfy, source_rec, dest_rec, origin)

let rec loop rotation (scarfy, source_rec, dest_rec, origin) =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      begin_drawing ();
      clear_background Color.raywhite;

      draw_texture_pro scarfy source_rec dest_rec origin rotation Color.white;

      draw_line
        (Int.of_float (Rectangle.x dest_rec))
        0
        (Int.of_float (Rectangle.x dest_rec))
        height Color.gray;
      draw_line 0
        (Int.of_float (Rectangle.y dest_rec))
        width
        (Int.of_float (Rectangle.y dest_rec))
        Color.gray;

      draw_text "(c) Scarfy sprite by Eiden Marsal" (width - 200) (height - 20)
        10 Color.gray;

      end_drawing ();
      loop (rotation +. 1.0) (scarfy, source_rec, dest_rec, origin)

let () = setup () |> loop 0.0
