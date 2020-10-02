(* Data structures *)
type player_t = {position: Raylib.Vector2.t; speed: float; can_jump: bool}

type env_item_t = {box: Raylib.Rectangle.t; blocking: bool;
                   color: Raylib.Color.t}
type camera_mode_t = Center
                   | CenterInsideMap
                   | SmoothFollow
                   | EvenOutOnLanding of bool * float
                   | PlayerBoundsPush

type state_t = player_t * env_item_t Array.t * Raylib.Camera2D.t * camera_mode_t

(* Constants *)
let width = 800
let height = 450

let half_screen =
  Raylib.Vector2.create
    (Float.of_int width /. 2.)
    (Float.of_int height /. 2.)

let player_hor_speed = 200.
let player_jump_speed = 350.

let gravity = 400.

let evening_speed = 700.0

(* Helpers *)

type comparision_t = Higher | Lower | Equal

let compare a b =
  if a > b then Higher
  else if a < b then Lower
  else Equal

let player_rec player =
  let open Raylib in
  let x, y, w, h =
    (Vector2.x player.position -. 20., Vector2.y player.position -. 40., 40., 40.)
  in
  Rectangle.create x y w h

let camera_description = function
  | Center -> "Follow player center"
  | CenterInsideMap -> "Follow player center, but clamp to map edges"
  | SmoothFollow -> "Follow player center; smoothed"
  | EvenOutOnLanding _ ->
    "Follow player center horizontally; update player center vertically after landing"
  | PlayerBoundsPush ->
    "Player push camera on getting too close to screen edge"

let clamp_zoom z =
  if z > 3.0 then 3.0
  else if z < 0.25 then 0.25
  else z

let vy_of_float y =
  Raylib.Vector2.create 0.0 y

(* Game functions *)
let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Window_resizable ];
  init_window width height "raylib [core] example - 2d camera";
  let player = {position=half_screen; speed=0.0; can_jump=false} in
  let env_items = [|
    {box=(Rectangle.create 0.0 0.0 1000.0 500.0); blocking=false; color=Color.lightgray };
    {box=(Rectangle.create 0.0 400.0 1000.0 200.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 300.0 200.0 400.0 10.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 250.0 300.0 100.0 10.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 650.0 300.0 100.0 10.0); blocking=true; color=Color.gray }
  |]
  in
  let camera =
    Camera2D.create
      half_screen
      player.position
      0.0 1.0
  in
  set_target_fps 60;
  (player, env_items, camera, Center)

let update_player delta ({position; speed; can_jump}, env_items, c, m) =
  let open Raylib in
  let x, y =
    (Vector2.x position, Vector2.y position)
  in
  let x =
    match is_key_down Key.Left, is_key_down Key.Right with
    | true, false -> x -. (player_hor_speed *. delta)
    | false, true -> x +. (player_hor_speed *. delta)
    | _, _ -> x
  in
  let speed =
    if is_key_down Key.Space && can_jump
    then ~-.player_jump_speed
    else speed
  in
  let player_collide_with elem =
    elem.blocking
    && (Rectangle.x elem.box) <= x
    && (Rectangle.x elem.box) +. (Rectangle.width elem.box) >= x
    && (Rectangle.y elem.box) >= y
    && (Rectangle.y elem.box) <= y +. speed *. delta
  in
  let player =
    if is_key_pressed Key.R
    then {position=half_screen; speed=0.0; can_jump=true}
    else if Array.exists player_collide_with env_items
    then {position=(Vector2.create x y); speed=0.; can_jump=true}
    else {position=(Vector2.create x (y +. (speed *.  delta)));
          speed=speed +. gravity *. delta;
          can_jump=false}
  in
  (player, env_items, c, m)

let update_camera delta (player, env_items, camera, mode) =
  let open Raylib in
  let mode =
    if is_key_pressed Key.C
    then match mode with
      | Center -> CenterInsideMap
      | CenterInsideMap -> SmoothFollow
      | SmoothFollow -> EvenOutOnLanding (false, 0.0)
      | EvenOutOnLanding _ -> PlayerBoundsPush
      | PlayerBoundsPush -> Center
    else mode
  in
  let offset, target, mode =
    match mode with
    | Center -> (half_screen, player.position, mode)
    | CenterInsideMap ->
      let (minX, minY, maxX, maxY) =
        Array.fold_right
          (fun elem (minX, minY, maxX, maxY) ->
             Float.min minX (Rectangle.x elem.box),
             Float.min minY (Rectangle.y elem.box),
             Float.max
               maxX
               ((Rectangle.x elem.box) +. (Rectangle.width elem.box)),
             Float.max
               maxY
               ((Rectangle.y elem.box) +. (Rectangle.height elem.box)))
          env_items
          (1000.0, 1000.0, ~-.1000.0 , ~-.1000.0)
      in
      let vmin = get_world_to_screen_2d (Vector2.create minX minY) camera in
      let vmax = get_world_to_screen_2d (Vector2.create maxX maxY) camera in
      let clamp_cam get_coord maxi =
        let low, high = (get_coord vmin, get_coord vmax) in
        if low > 0.0 then ~-.low
        else if high < maxi then maxi -. high
        else 0.0
      in
      let shift =
        Vector2.create
          (clamp_cam Vector2.x (Float.of_int width))
          (clamp_cam Vector2.y (Float.of_int height))
      in
      let offset =
        if Vector2.length shift > 0.1
        then Vector2.add half_screen shift
        else half_screen
      in
      (* This is just very buggy unfortunalty *)
      ignore (offset, player.position, mode);
      (half_screen, player.position, mode)
    | SmoothFollow ->
      let target =
        let min_speed = 30.0 in
        let min_effect_length = 10.0 in
        let fraction_speed = 0.8 in
        let diff =
          Vector2.subtract player.position (Camera2D.target camera)
        in
        let length = Vector2.length diff in
        if length < min_effect_length
        then (Camera2D.target camera)
        else let speed =
               Float.max (fraction_speed *. length) min_speed
          in
          Vector2.add
            (Camera2D.target camera)
            (Vector2.scale diff (speed *. delta /. length))
      in
      (half_screen, target, mode)
    | EvenOutOnLanding (true, evening_target) ->
      let target_y = Vector2.y (Camera2D.target camera) in
      let target_y, evening_out, evening_target =
        match compare evening_target target_y with
        | Higher ->
          let target_y = target_y +. evening_speed *.  delta in
          if evening_target <= target_y
          (* if we overshoot we adjust and stop *)
          then (evening_target, false, 0.0)
          (* else we keep moving the camera *)
          else (target_y, true, evening_target)
        | Lower ->
          let target_y = target_y -. evening_speed *.  delta in
          if evening_target >= target_y
          then (evening_target, false, 0.0)
          else (target_y, true, evening_target)
        | Equal -> (target_y, false, 0.0)
      in
      (half_screen,
      Vector2.create (Vector2.x player.position) target_y,
      EvenOutOnLanding (evening_out, evening_target))
    | EvenOutOnLanding (false, _) ->
      let target = Camera2D.target camera in
      let start_moving =
        player.can_jump
        && player.speed == 0.0
        && (Vector2.y player.position) != Vector2.y target
      in
      (half_screen,
       target,
       EvenOutOnLanding (
         start_moving,
         if start_moving then Vector2.y player.position else 0.0))

    | PlayerBoundsPush -> (half_screen, player.position, mode)
  in
  let zoom =
    if is_key_pressed Key.R then 1.0
    else clamp_zoom
        (Camera2D.zoom camera
         +. 0.05 *. Float.of_int (get_mouse_wheel_move ()))
  in
  (player,
   env_items,
   Camera2D.create
     offset
     target
     (Camera2D.rotation camera)
     zoom,
   mode)

let draw_all (player, env_items, camera, mode) =
  let open Raylib in
  begin
    begin_drawing ();
    clear_background Color.raywhite;

    begin_mode_2d camera;
    (* Draw environment *)
    Array.iter
      (fun item -> draw_rectangle_rec item.box item.color)
      env_items;
    (* Draw player *)
    draw_rectangle_rec (player_rec player) Color.red;

    end_mode_2d ();

    draw_text "Controls:" 20 20 10 Color.black;
    draw_text "- Right/Left to move" 40 40 10 Color.darkgray;
    draw_text "- Space to jump" 40 60 10 Color.darkgray;
    draw_text "- Mouse Wheel to Zoom in-out" 40 80 10 Color.darkgray;
    draw_text "- C to change camera mode" 40 100 10 Color.darkgray;
    draw_text "Current camera mode:" 20 120 10 Color.black;
    draw_text (camera_description mode) 20 140 10 Color.darkgray;
    end_drawing ();
  end;
  (player, env_items, camera, mode)

let rec loop state =
  let delta = Raylib.get_frame_time () in
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false -> state
             |> update_player delta
             |> update_camera delta
             |> draw_all
             |> loop

let () = setup () |> loop
