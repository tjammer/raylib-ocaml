let width = 800
let height = 450

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlags.Msaa_4x_hint ];
  init_window width height "raylib [core] example - vr simulator";

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
  let config = load_vr_stereo_config hmd in
  let distortion = load_shader "" "resources/distortion330.fs" in

  let set (config : 'a Ctypes_static.carray) str typ =
    set_shader_value distortion
      (get_shader_location distortion str)
      (config.astart |> to_voidp)
      typ
  in

  let open ShaderUniformDataType in
  set (VrStereoConfig.left_lens_center config) "leftLensCenter" Vec2;
  set (VrStereoConfig.right_lens_center config) "rightLensCenter" Vec2;
  set (VrStereoConfig.left_screen_center config) "leftScreenCenter" Vec2;
  set (VrStereoConfig.right_screen_center config) "rightScreenCenter" Vec2;

  set (VrStereoConfig.scale config) "scale" Vec2;
  set (VrStereoConfig.scale_in config) "scaleIn" Vec2;
  set (VrDeviceInfo.lens_distortion_values hmd) "deviceWarpParam" Vec4;
  set (VrDeviceInfo.chroma_ab_correction hmd) "chromaAbParam" Vec4;

  let camera =
    Camera.create
      (Vector3.create 5.0 2.0 5.0)
      (Vector3.create 0.0 2.0 0.0)
      (Vector3.create 0.0 1.0 0.0)
      60.0 CameraProjection.Perspective
  in

  let cube_position = Vector3.create 0.0 0.0 0.0 in

  let target = load_render_texture width height in

  disable_cursor ();
  set_target_fps 90;

  (distortion, cube_position, camera, config, target)

let rec loop (distortion, cube_position, camera, config, target) =
  match Raylib.window_should_close () with
  | true ->
      let open Raylib in
      unload_shader distortion;
      unload_vr_stereo_config config;
      close_window ()
  | false ->
      let open Raylib in
      update_camera (addr camera) CameraMode.First_person;

      begin_texture_mode target;

      clear_background Color.raywhite;
      begin_vr_stereo_mode config;

      begin_mode_3d camera;

      draw_cube cube_position 2.0 2.0 2.0 Color.red;
      draw_cube_wires cube_position 2.0 2.0 2.0 Color.maroon;
      draw_grid 40 1.0;

      end_mode_3d ();

      end_vr_stereo_mode ();

      end_texture_mode ();

      begin_drawing ();

      clear_background Color.raywhite;
      begin_shader_mode distortion;

      draw_texture_rec
        (RenderTexture.texture target)
        (Rectangle.create 0.0 0.0
           (RenderTexture.texture target |> Texture.width |> float_of_int)
           (RenderTexture.texture target
           |> Texture.height |> float_of_int |> Float.neg))
        (Vector2.zero ()) Color.white;
      end_shader_mode ();
      draw_fps 10 10;

      end_drawing ();

      loop (distortion, cube_position, camera, config, target)

let () = setup () |> loop
