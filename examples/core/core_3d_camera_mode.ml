let width = 800
let height = 450

type column_t = {
  height : float;
  position : Raylib.Vector3.t;
  color : Raylib.Color.t;
}

let cube_pos = Raylib.Vector3.create 0.0 0.0 0.0

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - 3d camera mode";
  let camera =
    Camera.create
      (Vector3.create 0.0 10.0 10.0) (* position *)
      (Vector3.create 0.0 0.0 0.0) (* target *)
      (Vector3.create 0.0 1.0 0.0) (* up *)
      45.0 (* FOV *) CameraProjection.Perspective
  in

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
  draw_text "Welcome to the third dimension!" 10 40 20 Color.darkgray;
  draw_fps 10 10;
  end_drawing ()

let rec loop camera =
  if Raylib.window_should_close () then Raylib.close_window ()
  else (
    draw_all camera;
    loop camera)

let () = setup () |> loop
