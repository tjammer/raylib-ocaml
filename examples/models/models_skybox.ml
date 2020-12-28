let setup () =
  let open Raylib in
  init_window 800 450 "raylib [models] example - skybox loading and drawing";
  let camera =
    Camera3D.create
      Vector3.(create 1.0 1.0 1.0)
      Vector3.(create 4.0 1.0 4.0)
      Vector3.(create 0.0 1.0 0.0)
      45.0 CameraType.Perspective
  in
  let cube = gen_mesh_cube 1.0 1.0 1.0 in
  let skybox = load_model_from_mesh cube in

  let material0 = CArray.get (Model.materials skybox) 0 in
  load_shader "resources/shaders/glsl330/skybox.vs"
    "resources/shaders/glsl330/skybox.fs"
  |> Material.set_shader material0;

  let shader = Material.shader material0 in
  set_shader_value shader
    (get_shader_location shader "environmentMap")
    (void_ptr_of_int MaterialMapType.(to_int Cubemap))
    ShaderUniformDataType.Int;

  let shdr_cubemap =
    load_shader "resources/shaders/glsl330/cubemap.vs"
      "resources/shaders/glsl330/cubemap.fs"
  in
  let tex_hdr = load_texture "resources/dresden_square.hdr" in

  MaterialMap.set_texture
    (CArray.get (Material.maps material0) MaterialMapType.(to_int Cubemap))
    (gen_texture_cubemap shdr_cubemap tex_hdr 512
       PixelFormat.Uncompressed_R8G8B8A8);

  unload_texture tex_hdr;
  unload_shader shdr_cubemap;

  set_camera_mode camera CameraMode.First_person;
  set_target_fps 60;
  (camera, skybox)

let rec loop camera skybox =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      update_camera (addr camera);

      begin_drawing ();
      clear_background Color.raywhite;
      begin_mode_3d camera;

      draw_model skybox (Vector3.create 0.0 0.0 0.0) 1.0 Color.white;
      draw_grid 10 5.0;

      end_mode_3d ();
      draw_fps 10 10;
      end_drawing ();
      loop camera skybox

let () =
  let camera, skybox = setup () in
  loop camera skybox
