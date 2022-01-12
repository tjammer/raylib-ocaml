let width = 800
let height = 450

let setup () =
  let open Raylib in
  init_window width height "raylib [textures] example - image loading";
  set_target_fps 60;
  let image = load_image "resources/raylib_logo.png" in
  let texture = load_texture_from_image image in
  unload_image image;
  texture

let rec loop texture =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_texture texture
        ((width / 2) - (Texture.width texture / 2))
        ((height / 2) - (Texture.height texture / 2))
        Color.white;
      draw_text "this IS a texture loaded from an image!" 300 370 10 Color.gray;
      end_drawing ();
      loop texture

let () = setup () |> loop
