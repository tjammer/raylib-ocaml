let screen_width = 800
let screen_height = 450

(* Grid data *)
let count = 5
let spacing = 4

module Player = struct
  type t = { camera : Raylib.Camera3D.t; screen : Raylib.RenderTexture.t }

  let create ~pos:(pos_x, pos_y, pos_z) ~target:(tar_x, tar_y, tar_z) =
    let open Raylib in
    let position = Vector3.create pos_x pos_y pos_z in
    let target = Vector3.create tar_x tar_y tar_z in
    let up = Vector3.create 0. 1. 0. in
    let fovy = 45. in
    let projection = CameraProjection.Perspective in
    let camera = Camera3D.create position target up fovy projection in
    let screen = load_render_texture (screen_width / 2) screen_height in
    { camera; screen }

  let destroy t = Raylib.unload_render_texture t.screen

  let handle_movements t ~key_up ~key_down vector =
    (* If anyone moves this frame, how far will they move based on the time since the last frame
       this moves thigns at 10 world units per second, regardless of the actual FPS *)
    let open Raylib in
    (* Move Player forward and backwards (no turning) *)
    if is_key_down key_up then (
      Camera3D.set_position t.camera
        (Vector3.add vector @@ Camera3D.position t.camera);
      Camera3D.set_target t.camera
        (Vector3.add vector @@ Camera3D.target t.camera))
    else if is_key_down key_down then (
      Camera3D.set_position t.camera
        (Vector3.subtract (Camera3D.position t.camera) vector);
      Camera3D.set_target t.camera
        (Vector3.subtract (Camera3D.target t.camera) vector))
end

type t = {
  player_1 : Player.t;
  player_2 : Player.t;
  split_screen_rect : Raylib.Rectangle.t;
}

let setup () =
  let open Raylib in
  init_window screen_width screen_height
    "raylib [core] example - 3d camera split screen";
  let player_1 = Player.create ~pos:(0., 1., -3.) ~target:(0., 1., 0.) in
  let player_2 = Player.create ~pos:(-3., 3., 0.) ~target:(0., 3., 0.) in
  (* Build a flipped rectangle the size of the split view to use for drawing later *)
  let split_screen_rect =
    Rectangle.create 0. 0.
      (Int.to_float @@ Texture2D.width @@ RenderTexture.texture player_1.screen)
      (Int.to_float
      @@ -(Texture2D.height @@ RenderTexture.texture player_1.screen))
  in
  set_target_fps 60;
  { player_1; player_2; split_screen_rect }

let draw_scene { player_1; player_2; split_screen_rect = _ } =
  let open Raylib in
  (* Draw scene: grid of cube trees on a plane to make a "world" *)
  draw_plane (Vector3.create 0. 0. 0.) (Vector2.create 50. 50.) Color.beige;
  for x = -count to count do
    let x = x * spacing in
    for z = -count to count do
      let z = z * spacing in
      draw_cube
        (Vector3.create (Int.to_float x) 1.5 (Int.to_float z))
        1. 1. 1. Color.lime;
      draw_cube
        (Vector3.create (Int.to_float x) 0.5 (Int.to_float z))
        0.25 1. 0.25 Color.brown
    done
  done;
  (* Draw a cube at each player's position *)
  draw_cube (Camera3D.position player_1.camera) 1. 1. 1. Color.red;
  draw_cube (Camera3D.position player_2.camera) 1. 1. 1. Color.blue

let rec loop ({ player_1; player_2; split_screen_rect } as t) =
  if Raylib.window_should_close () then (
    Player.destroy player_1;
    Player.destroy player_2;
    Raylib.close_window ())
  else
    let open Raylib in
    let offset_this_frame = 10. *. get_frame_time () in
    Player.handle_movements player_1 ~key_up:W ~key_down:S
      (Vector3.create 0. 0. offset_this_frame);
    Player.handle_movements player_2 ~key_up:Up ~key_down:Down
      (Vector3.create offset_this_frame 0. 0.);

    (* Draw Player1 view to the render texture *)
    begin_texture_mode player_1.screen;
    clear_background Color.skyblue;
    begin_mode_3d player_1.camera;
    draw_scene t;
    end_mode_3d ();
    draw_rectangle 0 0 (get_screen_width () / 2) 40 (fade Color.raywhite 0.8);
    draw_text "PLAYER1: W/S to move" 10 10 20 Color.maroon;
    end_texture_mode ();

    (* Draw Player2 view to the render texture *)
    begin_texture_mode player_2.screen;
    clear_background Color.skyblue;
    begin_mode_3d player_2.camera;
    draw_scene t;
    end_mode_3d ();
    draw_rectangle 0 0 (get_screen_width () / 2) 40 (fade Color.raywhite 0.8);
    draw_text "PLAYER2: UP/DOWN to move" 10 10 20 Color.darkblue;
    end_texture_mode ();

    (* Draw both views render textures to the screen side by side *)
    begin_drawing ();
    clear_background Color.black;
    draw_texture_rec
      (RenderTexture.texture player_1.screen)
      split_screen_rect (Vector2.create 0. 0.) Color.white;
    draw_texture_rec
      (RenderTexture.texture player_2.screen)
      split_screen_rect
      (Vector2.create (Int.to_float @@ (screen_width / 2)) 0.)
      Color.white;
    draw_rectangle
      ((get_screen_width () / 2) - 2)
      0 4 (get_screen_height ()) Color.lightgray;
    end_drawing ();
    loop t

let () = setup () |> loop
