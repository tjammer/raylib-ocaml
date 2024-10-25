let screen_width = 800
let screen_height = 440

module R = struct
  let add_x r i =
    let open Raylib.Rectangle in
    set_x r (x r +. i)

  let add_y r i =
    let open Raylib.Rectangle in
    set_y r (y r +. i)
end

module Player = struct
  type t = {
    player : Raylib.Rectangle.t;
    camera : Raylib.Camera2D.t;
    screen_camera : Raylib.RenderTexture.t;
  }

  let size = 40

  let create ~x ~y =
    let open Raylib in
    let player = Rectangle.create x y (Int.to_float size) (Int.to_float size) in
    let camera =
      Camera2D.create
        (Vector2.create 200.0 200.0)
        (Vector2.create (Rectangle.x player) (Rectangle.y player))
        0. 1.
    in
    let screen_camera = load_render_texture (screen_width / 2) screen_height in
    { player; camera; screen_camera }

  let destroy t = Raylib.unload_render_texture t.screen_camera

  let set_camera_target t =
    let open Raylib in
    let x = Rectangle.x t.player in
    let y = Rectangle.y t.player in
    Camera2D.set_target t.camera (Vector2.create x y)

  let handle_movements t ~up ~down ~left ~right =
    let open Raylib in
    if is_key_down up then R.add_y t.player (-3.)
    else if is_key_down down then R.add_y t.player 3.;
    if is_key_down right then R.add_x t.player 3.
    else if is_key_down left then R.add_x t.player (-3.)
end

type t = {
  player_1 : Player.t;
  player_2 : Player.t;
  split_screen_rect : Raylib.Rectangle.t;
}

let setup () =
  let open Raylib in
  init_window screen_width screen_height
    "raylib [core] example - 2d camera split screen";
  let player_1 = Player.create ~x:200. ~y:200. in
  let player_2 = Player.create ~x:250. ~y:200. in
  (* Build a flipped rectangle the size of the split view to use for drawing later *)
  let split_screen_rect =
    Rectangle.create 0. 0.
      (RenderTexture.texture player_1.screen_camera
      |> Texture2D.width |> Int.to_float)
      ( RenderTexture.texture player_1.screen_camera |> Texture2D.height
      |> fun x -> -x |> Int.to_float )
  in
  set_target_fps 60;
  { player_1; player_2; split_screen_rect }

let draw_scene { player_1; player_2; split_screen_rect = _ } =
  let open Raylib in
  (* Draw full scene with first camera *)
  for i = 0 to screen_width / Player.size do
    draw_line_v
      (Vector2.create (Int.to_float @@ (Player.size * i)) 0.)
      (Vector2.create
         (Int.to_float @@ (Player.size * i))
         (Int.to_float screen_height))
      Color.lightgray
  done;
  for i = 0 to screen_height / Player.size do
    draw_line_v
      (Vector2.create 0. (Int.to_float @@ (Player.size * i)))
      (Vector2.create
         (Int.to_float screen_width)
         (Int.to_float @@ (Player.size * i)))
      Color.lightgray
  done;
  for i = 0 to (screen_width / Player.size) - 1 do
    for j = 0 to (screen_height / Player.size) - 1 do
      draw_text
        (Format.sprintf "[%i,%i]" i j)
        (10 + (Player.size * i))
        (15 + (Player.size * j))
        10 Color.lightgray
    done
  done;
  draw_rectangle_rec player_1.player Color.red;
  draw_rectangle_rec player_2.player Color.blue

let rec loop ({ player_1; player_2; split_screen_rect } as t) =
  if Raylib.window_should_close () then (
    Player.destroy player_1;
    Player.destroy player_2;
    Raylib.close_window ())
  else
    let open Raylib in
    Player.handle_movements player_1 ~up:W ~down:S ~left:A ~right:D;
    Player.handle_movements player_2 ~up:Up ~down:Down ~left:Left ~right:Right;

    Player.set_camera_target player_1;
    Player.set_camera_target player_2;

    (* Draw full scene with first camera *)
    begin_texture_mode player_1.screen_camera;
    clear_background Raylib.Color.raywhite;
    begin_mode_2d player_1.camera;
    draw_scene t;
    end_mode_2d ();
    draw_rectangle 0 0 (get_screen_width () / 2) 30 (fade Color.raywhite 0.6);
    draw_text "PLAYER1: W/S/A/D to move" 10 10 10 Color.maroon;
    end_texture_mode ();

    (* Draw full scene with second camera *)
    begin_texture_mode player_2.screen_camera;
    clear_background Color.raywhite;
    begin_mode_2d player_2.camera;
    draw_scene t;
    end_mode_2d ();
    draw_rectangle 0 0 (get_screen_width () / 2) 30 (fade Color.raywhite 0.6);
    draw_text "PLAYER2: UP/DOWN/LEFT/RIGHT to move" 10 10 10 Color.darkblue;
    end_texture_mode ();

    (* Draw both views render textures to the screen side by side *)
    begin_drawing ();
    clear_background Color.black;
    draw_texture_rec
      (RenderTexture.texture player_1.screen_camera)
      split_screen_rect (Vector2.create 0. 0.) Color.white;
    draw_texture_rec
      (RenderTexture.texture player_2.screen_camera)
      split_screen_rect
      (Vector2.create (Int.to_float @@ (screen_width / 2)) 0.)
      Color.white;
    draw_rectangle
      ((get_screen_width () / 2) - 2)
      0 4 (get_screen_height ()) Color.lightgray;
    end_drawing ();
    loop t

let () = setup () |> loop
