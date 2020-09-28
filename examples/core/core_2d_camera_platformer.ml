let width = 800
let height = 450

let half_width = Float.of_int width /. 2.
let half_height = Float.of_int height /. 2.

let max_buildings = 100

type player_t = {position: Raylib.Vector2.t; speed: float; can_jump: bool}
type env_item_t = {box: Raylib.Rectangle.t; blocking: bool;
                   color: Raylib.Color.t}
type camera_mode_t = Center
                   | CenterInsideMap 
                   | SmoothFollow 
                   | EvenOutOnLanding
                   | PlayerBoundsPush

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Window_resizable ];
  init_window width height "raylib [core] example - 2d camera";
  let player = {position=Vector2.create half_width half_height;
                speed=0.0;
                can_jump=false}
  in

  let env_items = [|
    {box=(Rectangle.create 0.0 0.0 1000.0 400.0); blocking=false; color=Color.lightgray };
    {box=(Rectangle.create 0.0 400.0 1000.0 200.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 300.0 200.0 400.0 10.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 250.0 300.0 100.0 10.0); blocking=true; color=Color.gray };
    {box=(Rectangle.create 650.0 300.0 100.0 10.0); blocking=true; color=Color.gray }
  |]
  in
  let camera =
    Camera2D.create
      (Vector2.create half_width half_height)
      (Vector2.create (Vector2.x player.position +. 20.0)
         (Vector2.y player.position +. 20.0))
      0.0 1.0
  in
  set_target_fps 60;
  (player, env_items, camera, Center)



let rec loop state =
  let open Raylib in
  let handle_input (player, env_items, c, m) =

    (player, env_items, c, m)
  in
  let update_player (player, env_items, c, m) =
    state
  in
  let update_camera delta (p, e, camera, mode) = let open Raylib in 
    (p, e, (
        match mode with
        | Center ->
          Camera2D.create (Vector2.create half_width half_height)
            player.position
            (Camera2D.rotation camera)
            (Camera2D.zoom camera)
        | CenterInsideMap ->
          camera
        | SmoothFollow ->
          let min_speed = 30.0 in
          let min_effect_length = 10.0 in
          let fraction_speed = 0.8 in
          Camera2D.create
            (Vector2.create half_width half_height)
            (let diff =
               Vector2.substract player.position (Camera2D.target camera)
             in
             if Vector2.length diff < min_effect_length
             then (Camera2D.target camera)
             else let speed =
                    Float.max (fraction_speed *. length) min_speed
               in
               Vector2.add
                 (Camera2D.target camera)
                 (Vector2.scale diff (speed *. delta /. length)))
            (Camera2D.rotation camera)
            (Camera2D.zoom camera)
        | EvenOutOnLanding ->
          camera
        | PlayerBoundsPush ->
          camera),
     mode)
  in
  let draw_all (player, env_items, camera, _) =
    begin
      begin_drawing ();
      clear_background Color.raywhite;
      begin_mode_2d camera;

      draw_rectangle (-6000) 320 13000 8000 Color.darkgray;
      Array.iter
        (fun item -> draw_rectangle_rec item.box item.color)
        env_items;

      draw_rectangle_v player.position (Vector2.create 20.0 20.0) Color.red;

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
    end;
    state
  in
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
    handle_input state
    |> update_player
    |> update_camera (get_frame_time ())
    |> draw_all
    |> loop

let () = setup () |> loop
