let width = 800

let height = 450

let msg = "Loaded Font"

let setup () =
  let open Raylib in
  init_window 800 450 "raylib [text] example - font filters";
  let font = load_font_ex "resources/KAISG.ttf" 96 None in
  gen_texture_mipmaps (addr (Font.texture font));
  let font_size = Font.base_size font in
  let font_position =
    Vector2.create 40.0 ((Float.of_int height /. 2.0) -. 80.0)
  in
  set_texture_filter (Font.texture font) TextureFilter.Point;
  set_target_fps 60;
  (font, font_size, font_position)

let rec loop font font_size font_position filter =
  match Raylib.window_should_close () with
  | true ->
      let open Raylib in
      clear_dropped_files ();
      unload_font font;
      close_window ()
  | false ->
      let open Raylib in
      let font_size =
        font_size + (Int.of_float (get_mouse_wheel_move ()) * 4)
      in
      let filter =
        if is_key_pressed Key.One then (
          set_texture_filter (Font.texture font) TextureFilter.Point;
          `Point)
        else if is_key_pressed Key.Two then (
          set_texture_filter (Font.texture font) TextureFilter.Bilinear;
          `Bilinear)
        else if is_key_pressed Key.Three then (
          set_texture_filter (Font.texture font) TextureFilter.Trilinear;
          `Trilinear)
        else filter
      in
      let text_size = measure_text_ex font msg (Float.of_int font_size) 0.0 in

      (if is_key_down Key.Left then
       Vector2.(set_x font_position (x font_position -. 10.0))
      else if is_key_down Key.Right then
        Vector2.(set_x font_position (x font_position +. 10.0)));

      let font =
        if is_file_dropped () then (
          (* NOTE: We only support first ttf file dropped *)
          match get_dropped_files () with
          | [] -> font
          | file :: _ ->
              unload_font font;
              let font = load_font_ex file font_size None in
              clear_dropped_files ();
              font)
        else font
      in

      begin_drawing ();
      clear_background Color.raywhite;

      draw_text "Use mouse wheel to change font size" 20 20 10 Color.gray;
      draw_text "Use Key.Right and Key.Left to move text" 20 40 10 Color.gray;
      draw_text "Use 1, 2, 3 to change texture filter" 20 60 10 Color.gray;

      draw_text "Drop a new TTF font for dynamic loading" 20 80 10
        Color.darkgray;
      draw_text_ex font msg font_position (Float.of_int font_size) 0.0
        Color.black;

      draw_rectangle 0 (height - 80) width 80 Color.lightgray;
      draw_text
        (Printf.sprintf "Font size: %02d" font_size)
        20 (height - 50) 10 Color.darkgray;
      draw_text
        (Printf.sprintf "Text size: [%02.02f, %02.02f]" (Vector2.x text_size)
           (Vector2.y text_size))
        20 (height - 30) 10 Color.darkgray;

      (match filter with
      | `Point -> draw_text "POINT" 570 400 20 Color.black
      | `Bilinear -> draw_text "BILINEAR" 570 400 20 Color.black
      | `Trilinear -> draw_text "TRILINEAR" 570 400 20 Color.black);

      end_drawing ();
      loop font font_size font_position filter

let () =
  let font, font_size, font_position = setup () in
  loop font font_size font_position `Point
