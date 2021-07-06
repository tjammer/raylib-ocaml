let width = 800

let height = 450

type column_t = {
  height : float;
  position : Raylib.Vector3.t;
  color : Raylib.Color.t;
}

let cube_pos = Raylib.Vector3.create 0.0 1.0 0.0

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - 3d camera mode";
  let camera =
    Camera.create
      (Vector3.create 10.0 10.0 10.0) (* position *)
      (Vector3.create 0.0 0.0 0.0) (* target *)
      (Vector3.create 0.0 1.0 0.0) (* up *)
      45.0 (* FOV *) CameraProjection.Perspective
  in
  set_camera_mode camera CameraMode.Free;
  set_target_fps 60;
  camera

let draw_all camera collision ray =
  let open Raylib in
  begin_drawing ();
  clear_background Color.raywhite;
  begin_mode_3d camera;
  if collision then (
    draw_cube cube_pos 2.0 2.0 2.0 Color.red;
    draw_cube_wires cube_pos 2.0 2.0 2.0 Color.maroon;
    draw_cube_wires cube_pos 2.2 2.2 2.2 Color.green)
  else (
    draw_cube cube_pos 2.0 2.0 2.0 Color.gray;
    draw_cube_wires cube_pos 2.0 2.0 2.0 Color.darkgray);
  (match ray with None -> () | Some r -> draw_ray r Color.red);
  draw_grid 10 1.0;
  end_mode_3d ();

  draw_text "Try selecting the box with mouse!" 240 10 20 Color.darkgray;
  if collision then
    draw_text "BOX SELECTED"
      ((width - measure_text "BOX SELECTED" 30) / 2)
      (height / 10) 30 Color.green;
  draw_fps 10 10;
  end_drawing ()

let rec loop camera collision ray =
  let open Raylib in
  if window_should_close () then close_window ()
  else (
    update_camera (addr camera);
    let collision, ray =
      match (is_mouse_button_pressed MouseButton.Left, collision) with
      | true, true -> (false, None)
      | true, false ->
          let r = get_mouse_ray (get_mouse_position ()) camera in
          let collision =
            check_collision_ray_box r
              (BoundingBox.create
                 Vector3.(
                   create
                     (x cube_pos -. 1.0)
                     (y cube_pos -. 1.0)
                     (z cube_pos -. 1.0))
                 Vector3.(
                   create
                     (x cube_pos +. 1.0)
                     (y cube_pos +. 1.0)
                     (z cube_pos +. 1.0)))
          in
          (collision, Some r)
      | false, _ -> (collision, ray)
    in
    draw_all camera collision ray;
    loop camera collision ray)

let () =
  let camera = setup () in
  loop camera false None
