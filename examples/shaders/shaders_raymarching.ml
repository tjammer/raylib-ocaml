let width = 800

let height = 450

type locations = {
  view_eye : int;
  view_center : int;
  runtime : int;
  resolution : int;
}

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlag.Window_resizable ];
  init_window width height "raylib [shaders] example - raymarching shapes";

  let position = Vector3.create 2.5 2.5 3.0 in
  let target = Vector3.create 0.0 0.0 0.7 in
  let up = Vector3.create 0.0 1.0 0.0 in
  let camera = Camera.create position target up 65.0 CameraType.Perspective in

  set_camera_mode camera CameraMode.Free;

  let shader = load_shader "" "resources/raymarching.fs" in

  let locations =
    {
      view_eye = get_shader_location shader "viewEye";
      view_center = get_shader_location shader "viewCenter";
      runtime = get_shader_location shader "runTime";
      resolution = get_shader_location shader "resolution";
    }
  in

  let resolution = Vector2.create (Float.of_int width) (Float.of_int height) in
  set_shader_value shader locations.resolution
    (to_voidp (addr resolution))
    ShaderUniformDataType.Vec2;

  set_target_fps 60;

  (shader, locations, camera)

let rec loop width height shader locations camera runtime =
  match Raylib.window_should_close () with
  | true ->
      Raylib.unload_shader shader;
      Raylib.close_window ()
  | false ->
      let open Raylib in
      let width, height =
        if is_window_resized () then (
          let width = get_screen_width () in
          let height = get_screen_height () in
          let resolution =
            Vector2.create (Float.of_int width) (Float.of_int height)
          in
          set_shader_value shader locations.resolution
            (to_voidp (addr resolution))
            ShaderUniformDataType.Vec2;
          (width, height))
        else (width, height)
      in

      update_camera (addr camera);

      let delta_time = get_frame_time () in
      let runtime = runtime +. delta_time in
      let runtime_v = Vector2.create runtime 0.0 in

      set_shader_value shader locations.view_eye
        (to_voidp (addr (Camera.position camera)))
        ShaderUniformDataType.Vec3;

      set_shader_value shader locations.view_center
        (Camera.target camera |> addr |> to_voidp)
        ShaderUniformDataType.Vec3;

      set_shader_value shader locations.runtime
        (to_voidp (addr runtime_v))
        ShaderUniformDataType.Float;

      begin_drawing ();

      clear_background Color.raywhite;

      begin_shader_mode shader;
      draw_rectangle 0 0 width height Color.white;
      end_shader_mode ();

      draw_text "(c) Raymarching shader by Iñigo Quilez. MIT License."
        (width - 280) (height - 20) 10 Color.black;

      draw_fps 10 10;
      end_drawing ();

      loop width height shader locations camera runtime

let () =
  let shader, locations, camera = setup () in
  loop width height shader locations camera 0.0
