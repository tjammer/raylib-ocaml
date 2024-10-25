let screen_width = 800
let screen_height = 450
let clamp x mi ma = Float.(max mi (min ma x))

module Zoom_mode = struct
  type t =
    | Zero (*  Zoom based on mouse wheel *)
    | One (* Zoom based on mouse left click *)

  let get () =
    if Raylib.is_key_pressed Raylib.Key.One then Some Zero
    else if Raylib.is_key_pressed Raylib.Key.Two then Some One
    else None

  let set_offset_and_target camera =
    let mouse_pos = Raylib.get_mouse_position () in
    (* Get the world point that is under the mouse *)
    let mouse_world_pos = Raylib.get_screen_to_world_2d mouse_pos camera in
    (* Set the offset to where the mouse is *)
    Raylib.Camera2D.set_offset camera mouse_pos;
    (* Set the target to match, so that the camera maps the world space point
       under the cursor to the screen space point under the cursor at any zoom *)
    Raylib.Camera2D.set_target camera mouse_world_pos

  let update_camera camera = function
    | Zero ->
        let wheel = Raylib.get_mouse_wheel_move () in
        if not (Float.equal wheel 0.) then set_offset_and_target camera;
        (* Zoom increment *)
        let scale_factor = 1. +. (0.25 *. Float.abs wheel) in
        let scale_factor =
          if wheel < 0. then 1.0 /. scale_factor else scale_factor
        in
        Raylib.Camera2D.set_zoom camera
          (clamp (Raylib.Camera2D.zoom camera *. scale_factor) 0.125 64.)
    | One ->
        if Raylib.is_mouse_button_pressed Raylib.MouseButton.Left then
          set_offset_and_target camera;
        if Raylib.is_mouse_button_down Raylib.MouseButton.Left then
          (* Zoom increment *)
          let delta_x = Raylib.Vector2.x (Raylib.get_mouse_delta ()) in
          let scale_factor = 1. +. (0.01 *. Float.abs delta_x) in
          let scale_factor =
            if delta_x < 0. then 1.0 /. scale_factor else scale_factor
          in
          Raylib.Camera2D.set_zoom camera
            (clamp (Raylib.Camera2D.zoom camera *. scale_factor) 0.125 64.0)
end

type t = { zoom_mode : Zoom_mode.t; camera : Raylib.Camera2D.t }

let rec loop { zoom_mode; camera } =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let zoom_mode = Option.value ~default:zoom_mode @@ Zoom_mode.get () in

    (* Translate based on mouse right click *)
    (if Raylib.is_mouse_button_down Raylib.MouseButton.Right then
       let delta = Raylib.get_mouse_delta () in
       let delta =
         Raylib.Vector2.add_value delta (-1. /. Raylib.Camera2D.zoom camera)
       in
       Raylib.Camera2D.set_target camera
         (Raylib.Vector2.add (Raylib.Camera2D.target camera) delta));

    Zoom_mode.update_camera camera zoom_mode;

    Raylib.begin_drawing ();
    Raylib.clear_background Raylib.Color.raywhite;
    Raylib.begin_mode_2d camera;
    (* Draw the 3d grid, rotated 90 degrees and centered around 0,0
             just so we have something in the XY plane *)
    Raylib.Rlgl.push_matrix ();
    Raylib.Rlgl.translatef 0. (25. *. 50.) 0.;
    Raylib.Rlgl.rotatef 90. 1. 0. 0.;
    Raylib.draw_grid 100 50.;
    Raylib.Rlgl.pop_matrix ();

    (* Draw a reference circle *)
    Raylib.draw_circle
      (Raylib.get_screen_width () / 2)
      (Raylib.get_screen_height () / 2)
      50. Raylib.Color.maroon;

    Raylib.end_mode_2d ();

    Raylib.draw_text "[1][2] Select mouse zoom mode (Wheel or Move)" 20 20 20
      Raylib.Color.darkgray;
    (match zoom_mode with
    | Zero ->
        Raylib.draw_text "Mouse right button drag to move, mouse wheel to zoom"
          20 50 20 Raylib.Color.darkgray
    | One ->
        Raylib.draw_text
          "Mouse right button drag to move, mouse press and move to zoom" 20 50
          20 Raylib.Color.darkgray);
    Raylib.end_drawing ();
    loop { zoom_mode; camera }

let setup () =
  Raylib.init_window screen_width screen_height
    "raylib [core] example - 2d camera mouse zoom";
  let offset = Raylib.Vector2.zero () in
  let target = Raylib.Vector2.zero () in
  let rotation = 0. in
  let zoom = 1. in
  let camera = Raylib.Camera2D.create offset target rotation zoom in
  Raylib.set_target_fps 60;
  { zoom_mode = Zero; camera }

let () = setup () |> loop
