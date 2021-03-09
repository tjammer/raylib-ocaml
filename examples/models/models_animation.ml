let width = 800

let height = 450

let position = Raylib.Vector3.create 0.0 0.0 0.0

let setup () =
  let open Raylib in
  init_window width height "raylib [models] example - model animation";
  let camera =
    Camera.create
      (Vector3.create 10.0 10.0 10.0)
      (Vector3.create 0.0 0.0 0.0)
      (Vector3.create 0.0 1.0 0.0)
      45.0 CameraType.Perspective
  in
  let model = load_model "resources/guy/guy.iqm" in
  let texture = load_texture "resources/guy/guytex.png" in
  set_material_texture
    (CArray.get (Model.materials model) 0 |> addr)
    MaterialMapType.Albedo texture;

  let anims = load_model_animations "resources/guy/guyanim.iqm" in

  set_camera_mode camera CameraMode.Free;
  set_target_fps 60;
  (camera, model, anims)

let rec loop camera model anims frame_counter =
  match Raylib.window_should_close () with
  | true ->
      let open Raylib in
      CArray.iter (fun anim -> unload_model_animation anim) anims;
      unload_model model;
      close_window ()
  | false ->
      let open Raylib in
      update_camera (addr camera);
      let frame_counter =
        if is_key_down Key.Space then (
          let frame_counter = succ frame_counter in
          let anims0 = CArray.get anims 0 in
          update_model_animation model anims0 frame_counter;
          if frame_counter >= ModelAnimation.frame_count anims0 then 0
          else frame_counter)
        else frame_counter
      in

      begin_drawing ();
      clear_background Color.raywhite;
      begin_mode_3d camera;

      draw_model_ex model position
        (Vector3.create 1.0 0.0 0.0)
        (-90.0)
        (Vector3.create 1.0 1.0 1.0)
        Color.white;

      CArray.iter
        (fun bone ->
          draw_cube (Transform.translation bone) 0.2 0.2 0.2 Color.red)
        (ModelAnimation.frame_pose_at (CArray.get anims 0) frame_counter);
      draw_grid 10 1.0;

      end_mode_3d ();

      draw_text "PRESS SPACE to PLAY MODEL ANIMATION" 10 10 20 Color.maroon;
      draw_text "(c) Guy IQM 3D model by @culacant" (width - 200) (height - 20)
        10 Color.gray;
      end_drawing ();
      loop camera model anims frame_counter

let () =
  let camera, model, anims = setup () in
  loop camera model anims 0
