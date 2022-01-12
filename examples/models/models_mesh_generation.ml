open Raylib

let get f i a = Raylib.CArray.get (f a) i
let ( %. ) = Fun.flip

let make_mesh () =
  let of_list l = CArray.of_list Ctypes.float l in
  let mesh = Mesh.create () in
  Mesh.set_triangle_count mesh 1;
  Mesh.set_vertex_count mesh 3;

  Mesh.set_vertices mesh
    (of_list [ 0.0; 0.0; 0.0; 1.0; 0.0; 2.0; 2.0; 0.0; 0.0 ]);
  Mesh.set_normals mesh
    (of_list [ 0.0; 1.0; 0.0; 0.0; 1.0; 0.0; 0.0; 1.0; 0.0 ]);
  Mesh.set_texcoords mesh (of_list [ 0.0; 0.0; 0.5; 1.0; 1.0; 0.0 ]);

  upload_mesh (addr mesh) false;
  mesh

let setup () =
  init_window 800 450 "raylib [models] expamle - mesh generation";
  let checked = gen_image_checked 2 2 1 1 Color.red Color.green in
  let texture = load_texture_from_image checked in
  unload_image checked;
  let models =
    [|
      load_model_from_mesh (gen_mesh_plane 2.0 2.0 5 5);
      load_model_from_mesh (gen_mesh_cube 2.0 1.0 2.0);
      load_model_from_mesh (gen_mesh_sphere 2.0 32 32);
      load_model_from_mesh (gen_mesh_hemi_sphere 2.0 16 16);
      load_model_from_mesh (gen_mesh_cylinder 1.0 2.0 16);
      load_model_from_mesh (gen_mesh_torus 0.25 4.0 16 32);
      load_model_from_mesh (gen_mesh_knot 1.0 2.0 16 128);
      load_model_from_mesh (gen_mesh_poly 5 2.0);
      load_model_from_mesh (make_mesh ());
    |]
  in

  Array.iter
    (fun model ->
      model |> get Model.materials 0
      |> get Material.maps MaterialMapIndex.(to_int Albedo)
      |> MaterialMap.set_texture %. texture)
    models;

  let camera =
    Camera.create
      (Vector3.create 5.0 5.0 5.0)
      (Vector3.create 0.0 0.0 0.0)
      (Vector3.create 0.0 1.0 0.0)
      45.0 CameraProjection.Perspective
  in
  let position = Vector3.create 0.0 0.0 0.0 in

  set_camera_mode camera CameraMode.Orbital;
  set_target_fps 60;
  (texture, models, camera, position, ref 0)

let rec loop ((texture, models, camera, position, curr_model) as args) =
  if window_should_close () then (
    unload_texture texture;
    Array.iter unload_model models;
    close_window ())
  else (
    update_camera (addr camera);

    if is_mouse_button_pressed MouseButton.Left || is_key_pressed Key.Right then
      curr_model := (!curr_model + 1) mod Array.length models;

    if is_key_pressed Key.Left then
      curr_model :=
        if !curr_model < 1 then Array.length models - 1 else !curr_model - 1;

    begin_drawing ();

    clear_background Color.raywhite;

    begin_mode_3d camera;

    draw_model models.(!curr_model) position 1.0 Color.white;
    draw_grid 10 1.0;

    end_mode_3d ();

    draw_rectangle 30 400 310 30 (fade Color.skyblue 0.5);
    draw_rectangle_lines 30 400 310 30 (fade Color.darkblue 0.5);
    draw_text "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS" 40 410 10
      Color.blue;

    (match !curr_model with
    | 0 -> draw_text "PLANE" 680 10 20 Color.darkblue
    | 1 -> draw_text "CUBE" 680 10 20 Color.darkblue
    | 2 -> draw_text "SPHERE" 680 10 20 Color.darkblue
    | 3 -> draw_text "HEMISPHERE" 680 10 20 Color.darkblue
    | 4 -> draw_text "CYLINDER" 680 10 20 Color.darkblue
    | 5 -> draw_text "TORUS" 680 10 20 Color.darkblue
    | 6 -> draw_text "KNOT" 680 10 20 Color.darkblue
    | 7 -> draw_text "POLY" 680 10 20 Color.darkblue
    | 8 -> draw_text "Parametric(custom)" 580 10 20 Color.darkblue
    | _ -> ());

    end_drawing ();

    loop args)

let () = setup () |> loop
