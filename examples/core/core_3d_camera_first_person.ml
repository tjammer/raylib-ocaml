(*
 * This example demonstrate Raylib internal facilities to manage 3D cameras
 * As a consequence, it cannot handle camera in a pure functional way and
 * instead changes it in place using Raylib.addr
 *
 *)
let width = 800
let height = 450

type column_t = {
  height : float;
  position : Raylib.Vector3.t;
  color : Raylib.Color.t;
}

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - 3d camera first person";
  let camera =
    Camera.create
      (Vector3.create 4.0 2.0 4.0) (* position *)
      (Vector3.create 0.0 1.8 0.0) (* target *)
      (Vector3.create 0.0 1.0 0.0) (* up *)
      60.0 (* FOV *) CameraProjection.Perspective
  in
  let columns =
    List.init 20 (fun _ ->
        let height = Float.of_int (get_random_value 1 12) in
        {
          height;
          position =
            Vector3.create
              (Float.of_int (get_random_value (-15) 15))
              (height /. 2.0)
              (Float.of_int (get_random_value (-15) 15));
          color =
            Color.create (get_random_value 20 255) (get_random_value 10 55) 30
              255;
        })
  in
  set_camera_mode camera CameraMode.First_person;
  set_target_fps 60;
  (camera, columns)

let draw_all camera columns =
  let open Raylib in
  begin_drawing ();
  clear_background Color.raywhite;
  begin_mode_3d camera;
  draw_plane
    (Vector3.create 0.0 0.0 0.0)
    (Vector2.create 32.0 32.0) Color.lightgray;
  draw_cube (Vector3.create ~-.16.0 2.5 0.0) 1.0 5.0 32.0 Color.blue;
  draw_cube (Vector3.create 16.0 2.5 0.0) 1.0 5.0 32.0 Color.lime;
  draw_cube (Vector3.create 0.0 2.5 16.0) 32.0 5.0 1.0 Color.gold;
  List.iter
    (fun { position; height; color } ->
      draw_cube position 2.0 height 2.0 color;
      draw_cube_wires position 2.0 height 2.0 Color.maroon)
    columns;
  end_mode_3d ();
  end_drawing ()

let rec loop (camera, columns) =
  let open Raylib in
  if window_should_close () then close_window ()
  else update_camera (addr camera);
  draw_all camera columns;
  loop (camera, columns)

let () = setup () |> loop
