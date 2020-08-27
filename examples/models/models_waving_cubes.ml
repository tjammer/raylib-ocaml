let width = 800

let height = 450

let num_blocks = 15

let setup () =
  let open Raylib in
  init_window width height "raylib [models] example - waving cubes";
  let camera =
    Camera3D.create
      Vector3.(create 30.0 20.0 30.0)
      Vector3.(create 0.0 0.0 0.0)
      Vector3.(create 0.0 1.0 0.0)
      70.0 CameraType.Perspective
  in
  set_target_fps 60;
  camera

let rec loop camera =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let time = get_time () in
      let scale = 0.7 *. (2.0 +. sin time) in
      let camera_time = time *. 0.3 in
      let cam_pos = Camera3D.position camera in
      Vector3.set_x cam_pos (cos camera_time *. 40.0);
      Vector3.set_z cam_pos (sin camera_time *. 40.0);

      begin_drawing ();
      clear_background Color.raywhite;
      begin_mode_3d camera;

      draw_grid 10 5.0;

      for x = 0 to num_blocks do
        for y = 0 to num_blocks do
          for z = 0 to num_blocks do
            let block_scale = Float.of_int (x + y + z) /. 30.0 in
            let scatter = sin ((block_scale *. 20.0) +. (time *. 4.0)) in
            let cube_pos =
              Vector3.create
                ( (Float.of_int (x - (num_blocks / 2)) *. scale *. 3.0)
                +. scatter )
                ( (Float.of_int (y - (num_blocks / 2)) *. scale *. 2.0)
                +. scatter )
                ( (Float.of_int (z - (num_blocks / 2)) *. scale *. 3.0)
                +. scatter )
            in
            let color =
              color_from_hsv
                (Vector3.create
                   (Float.of_int ((x + y + z) * 18 mod 360))
                   0.75 0.9)
            in
            let size = (2.4 -. scale) *. block_scale in
            draw_cube cube_pos size size size color
          done
        done
      done;

      end_mode_3d ();
      draw_fps 10 10;
      end_drawing ();
      loop camera

let () = setup () |> loop
