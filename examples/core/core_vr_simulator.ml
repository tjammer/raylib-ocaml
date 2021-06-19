let width = 800

let height = 450

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Msaa_4x_hint ];
  init_window width height "raylib [core] example - vr simulator";
  init_vr_simulator ();

  let hmd = VrDeviceInfo.create () in

  VrDeviceInfo.(
    set_h_resolution hmd 2160;
    set_v_resolution hmd 1200;
    set_h_screen_size hmd 0.133793;
    set_v_screen_size hmd 0.0669;
    set_v_screen_center hmd 0.0478;
    set_eye_to_screen_distance hmd 0.041;
    set_lens_separation_distance hmd 0.07;
    set_interpupillary_distance hmd 0.07;
    set_lens_distortion_values hmd 1.0 0.22 0.24 0.0;
    set_chroma_ab_correction hmd 0.994 (-0.004) 1.014 0.0);
  let distortion = load_shader "" "resources/distortion330.fs" in
  set_vr_configuration hmd distortion;

  let camera =
    Camera.create
      (Vector3.create 5.0 2.0 5.0)
      (Vector3.create 0.0 2.0 0.0)
      (Vector3.create 0.0 1.0 0.0)
      60.0 CameraType.Perspective
  in

  let cube_position = Vector3.create 0.0 0.0 0.0 in

  set_camera_mode camera CameraMode.First_person;
  set_target_fps 90;

  (distortion, cube_position, camera)

let rec loop (distortion, cube_position, camera) =
  match Raylib.window_should_close () with
  | true ->
      let open Raylib in
      unload_shader distortion;
      close_vr_simulator ();
      close_window ()
  | false ->
      let open Raylib in
      update_camera (addr camera);

      if is_key_pressed Key.Space then toggle_vr_mode ();

      begin_drawing ();

      clear_background Color.raywhite;

      begin_vr_drawing ();
      begin_mode_3d camera;
      draw_cube cube_position 2.0 2.0 2.0 Color.red;
      draw_cube_wires cube_position 2.0 2.0 2.0 Color.maroon;

      draw_grid 40 1.0;

      end_mode_3d ();

      end_vr_drawing ();

      draw_fps 10 10;

      end_drawing ();

      loop (distortion, cube_position, camera)

let () = setup () |> loop
