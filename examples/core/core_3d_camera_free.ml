let width = 800
let height = 450

type column_t = {height: float;
                 position: Raylib.Vector3.t;
                 color: Raylib.Color.t}

let cube_pos = Raylib.Vector3.create 0.0 0.0 0.0

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - 3d camera free";
  let camera =
    Camera.create
      (Vector3.create 10.0 10.0 10.0) (* position *)
      (Vector3.create 0.0 0.0 0.0) (* target *)
      (Vector3.create 0.0 1.0 0.0) (* up *)
      45.0 (* FOV *)
      CameraType.Perspective
  in
  set_camera_mode camera CameraMode.Free;
  set_target_fps 60;
  camera

let draw_all camera =
  let open Raylib in
  begin_drawing ();
  clear_background Color.raywhite;
  begin_mode_3d camera;
  draw_cube cube_pos 2.0 2.0 2.0 Color.red;
  draw_cube_wires cube_pos 2.0 2.0 2.0 Color.maroon;
  draw_grid 10 1.0;
  end_mode_3d ();
  draw_rectangle 10 10 320 133 (fade Color.skyblue 0.5);
  draw_rectangle_lines 10 10 320 133 Color.blue;
  draw_text "Free camera default controls:" 20 20 10 Color.black;
  draw_text "- Mouse Wheel to Zoom in-out" 40 40 10 Color.darkgray;
  draw_text "- Mouse Wheel Pressed to Pan" 40 60 10 Color.darkgray;
  draw_text "- Alt + Mouse Wheel Pressed to Rotate" 40 80 10 Color.darkgray;
  draw_text "- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom" 40 100 10 Color.darkgray;
  draw_text "- Z to zoom to (0 0 0)" 40 120 10 Color.darkgray;
  end_drawing ()

let rec loop camera =
  let open Raylib in
  if window_should_close ()
  then close_window ()
  else
    let camera =
      if is_key_down Key.Z
      then 
        Camera.(create
                  (position camera)
                  (Vector3.create 0.0 0.0 0.0) (* target *)
                  (up camera)
                  45.0 (* FOV *)
                  CameraType.Perspective)
      else camera
    in
    update_camera (addr camera);
    draw_all camera;
    loop camera

let () =
  setup () |> loop
