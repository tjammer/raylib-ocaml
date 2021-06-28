let clamp_value (x, y) (mi_x, mi_y) (ma_x, ma_y) =
  Float.(max mi_x (min ma_x x), max mi_y (min ma_y y))

let game_width = 640.0

let game_height = 480.0

let origin = Raylib.Vector2.create 0.0 0.0

let init_colors () =
  let open Raylib in
  Array.init 10 (fun _ ->
      Color.create (get_random_value 100 250) (get_random_value 50 150)
        (get_random_value 10 100) 255)

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Window_resizable; ConfigFlag.Vsync_hint ];

  init_window 800 450 "raylib [core] example - window scale letterbox";
  set_window_min_size 320 240;

  let target =
    load_render_texture (Int.of_float game_width) (Int.of_float game_height)
  in
  set_texture_filter (RenderTexture.texture target) TextureFilterMode.Bilinear;

  set_target_fps 60;

  let colors = init_colors () in
  (target, colors)

let draw (target, colors) =
  let open Raylib in
  let sx, sy =
    (Float.of_int (get_screen_width ()), Float.of_int (get_screen_height ()))
  in
  let scale = Float.min (sx /. game_width) (sy /. game_height) in
  let mouse_x, mouse_y =
    let mouse = get_mouse_position () in
    Vector2.(x mouse, y mouse)
  in
  let dx, dy =
    ((sx -. (game_width *. scale)) *. 0.5, (sy -. (game_height *. scale)) *. 0.5)
  in
  let vmouse_x, vmouse_y =
    clamp_value
      ((mouse_x -. dx) /. scale, (mouse_y -. dy) /. scale)
      (0.0, 0.0) (game_width, game_height)
  in
  begin_drawing ();
  clear_background Color.black;

  begin_texture_mode target;

  clear_background Color.raywhite;

  Array.iteri
    (fun i col ->
      draw_rectangle 0
        (Int.of_float game_height / 10 * i)
        (Int.of_float game_width)
        (Int.of_float game_height / 10)
        col)
    colors;

  draw_text
    "If executed inside a window\n\
     you can resize the window\n\
     and see the screen scaling!" 10 25 20 Color.white;

  draw_text
    (Printf.sprintf "Default Mouse: [%i , %i]" (Int.of_float mouse_x)
       (Int.of_float mouse_y))
    350 25 20 Color.green;
  draw_text
    (Printf.sprintf "Virtual Mouse: [%i , %i]" (Int.of_float vmouse_x)
       (Int.of_float vmouse_y))
    350 55 20 Color.yellow;

  end_texture_mode ();

  let tex = RenderTexture.texture target in
  draw_texture_pro tex
    (Rectangle.create 0.0 0.0
       (Float.of_int (Texture2D.width tex))
       (Float.of_int (-Texture2D.height tex)))
    (Rectangle.create dx dy (game_width *. scale) (game_height *. scale))
    origin 0.0 Color.white;

  end_drawing ();
  (target, colors)

let update (target, colors) =
  let open Raylib in
  let colors = if is_key_pressed Key.Space then init_colors () else colors in
  (target, colors)

let rec loop (target, colors) =
  match Raylib.window_should_close () with
  | true ->
      Raylib.unload_render_texture target;
      Raylib.close_window ()
  | false -> (target, colors) |> draw |> update |> loop

let () = setup () |> loop
