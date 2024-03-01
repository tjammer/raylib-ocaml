type gui_state =
  { camera : Raylib.Camera3D.t
  ; cubicmap : Raylib.Texture2D.t
  ; model : Raylib.Model.t
  ; texture : Raylib.Texture2D.t
  ; map_pixels : Raylib.Color.t Raylib.CArray.t
  ; map_position : Raylib.Vector3.t
  }

let gui_init () =
  let open Raylib in
  init_window 800 600 "Reactive GUI";
  set_target_fps 60;
  let camera =
    Camera.create
      (* Position *)
      (Vector3.create 0.2 0.4 0.2)
      (* Target *)
      (Vector3.create 0.185 0.4 0.0)
      (* Rotation over X axis *)
      (Vector3.create 0.0 1.0 0.0)
      (* FOV aperture in Y, degrees *)
      45.0
      (* Projection (perspective/orthographic) *)
      CameraProjection.Perspective
  in
  (* Load cubicmap image (RAM) *)
  let map_image = load_image "resources/cubicmap.png" in
  let map_image_width = Image.width map_image in
  let map_image_height = Image.height map_image in
  (* Convert image to texture to display (VRAM) *)
  let cubicmap = load_texture_from_image map_image in
  let mesh = gen_mesh_cubicmap map_image (Vector3.create 1.0 1.0 1.0) in
  let model = load_model_from_mesh mesh in
  (* Load map texture *)
  let texture = load_texture "resources/cubicmap_atlas.png" in
  (* Set map diffuse texture *)
  set_material_texture
    (CArray.get (Model.materials model) 0 |> addr)
    MaterialMapIndex.Albedo
    texture;
  (* Get map image data to be used for collision detection *)
  let map_pixels_ptr = load_image_colors map_image in
  let map_pixels = CArray.from_ptr map_pixels_ptr (map_image_width * map_image_height) in
  (* Unload image from RAM *)
  unload_image map_image;
  (* Set model position *)
  let map_position = Vector3.create (-16.0) 0.0 (-8.0) in
  (* Limit cursor to relative movement inside the window *)
  disable_cursor ();
  (* Set our game to run at 60 frames-per-second *)
  set_target_fps 60;
  { camera; model; cubicmap; texture; map_pixels; map_position }
;;

let gui_destroy state =
  let open Raylib in
  unload_image_colors @@ CArray.start state.map_pixels;
  unload_texture state.cubicmap;
  unload_texture state.texture;
  Raylib.close_window ()
;;

let rec gui_main_loop state =
  (* Detect window close button or ESC key *)
  if Raylib.window_should_close ()
  then state
  else
    let open Raylib in
    let screen_width = get_screen_width () |> Float.of_int in
    let cubicmap_width = Texture.width state.cubicmap in
    let cubicmap_width_f = Float.of_int cubicmap_width in
    let cubicmap_height = Texture.height state.cubicmap in
    (* Store old camera position *)
    (* Some ugly field-to-field copying because we need *)
    (* to copy the value, not the reference.            *)
    let old_camera_pos =
      Vector3.create
        (Vector3.x @@ Camera.position state.camera)
        (Vector3.y @@ Camera.position state.camera)
        (Vector3.z @@ Camera.position state.camera)
    in
    update_camera (addr state.camera) CameraMode.First_person;
    (* Check player collision (we simplify to 2D collision detection) *)
    let camera_position = Camera.position state.camera in
    let player_pos =
      Vector2.create (Vector3.x camera_position) (Vector3.z camera_position)
    in
    (* Collision radius (player is modelled as a cilinder for collision) *)
    let player_radius = 0.1 in
    let player_cell_x =
      Vector2.x player_pos -. Vector3.x state.map_position +. 0.5 |> Int.of_float
    in
    let player_cell_y =
      Vector2.y player_pos -. Vector3.z state.map_position +. 0.5 |> Int.of_float
    in
    (* Out-of-limits security check *)
    let player_cell_x = Int.max player_cell_x 0 in
    let player_cell_x = Int.min player_cell_x (cubicmap_width - 1) in
    let player_cell_y = Int.max player_cell_y 0 in
    let player_cell_y = Int.min player_cell_y (cubicmap_height - 1) in
    (* Check map collisions using image data and player position            *)
    (* TODO: Improvement: Just check player surrounding cells for collision *)
    let map_position_x = Vector3.x state.map_position in
    let map_position_z = Vector3.z state.map_position in
    for y = 0 to cubicmap_height - 1 do
      for x = 0 to cubicmap_width - 1 do
        let open Ctypes in
        (* Collision: white pixel, only check R channel *)
        let r = Color.r @@ CArray.get state.map_pixels ((y * cubicmap_width) + x) in
        let rectangle =
          Rectangle.create
            (map_position_x -. 0.5 +. Float.of_int x)
            (map_position_z -. 0.5 +. Float.of_int y)
            1.0
            1.0
        in
        let is_in_rec = check_collision_circle_rec player_pos player_radius rectangle in
        if r = 255 && is_in_rec then Camera.set_position state.camera old_camera_pos
      done
    done;
    begin_drawing ();
    clear_background Color.raywhite;
    begin_mode_3d state.camera;
    draw_model state.model state.map_position 1.0 Color.white;
    end_mode_3d ();
    let v = Vector2.create (screen_width -. (cubicmap_width_f *. 4.0) -. 20.0) 20.0 in
    draw_texture_ex state.cubicmap v 0.0 4.0 Color.white;
    (* Draw player position radar *)
    draw_rectangle
      (get_screen_width () - (cubicmap_width * 4) - 20 + (player_cell_x * 4))
      (20 + (player_cell_y * 4))
      4
      4
      Color.red;
    end_drawing ();
    gui_main_loop state
;;

let () = gui_init () |> gui_main_loop |> gui_destroy
