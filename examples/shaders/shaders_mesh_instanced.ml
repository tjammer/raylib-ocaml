open Raylib
open Rlights

let width = 800
let height = 450
let count = 10000

let main () =
  set_config_flags [ ConfigFlags.Msaa_4x_hint; ConfigFlags.Window_resizable ];
  init_window width height "raylib [shaders] example - rlgl mesh instanced";

  let position = Vector3.create 125.0 125.0 125.0 in
  let target = Vector3.create 0.0 0.0 0.0 in
  let up = Vector3.create 0.0 1.0 0.0 in
  let camera =
    Camera.create position target up 45.0 CameraProjection.Perspective
  in

  set_target_fps 60;

  let cube = gen_mesh_cube 1.0 1.0 1.0 in

  let rand_float lower upper = get_random_value lower upper |> float_of_int in
  let matrix_translation _ =
    Matrix.translate (rand_float (-50) 50) (rand_float (-50) 50)
      (rand_float (-50) 50)
  in
  let matrix_rotation _ =
    let axis =
      Vector3.create (rand_float 0 360) (rand_float 0 360) (rand_float 0 360)
      |> Vector3.normalize
    in
    let angle = rand_float 0 50 *. Float.pi /. 180.0 /. 1000.0 in
    Matrix.rotate axis angle
  in

  (* draw_mesh_instanced takes a ptr. CArrays can be instantly cast to/from ptrs *)
  let translations =
    CArray.from_ptr (Ctypes.allocate_n Matrix.t ~count) count
  in
  let rotations_inc = Array.init count matrix_rotation in
  let rotations = CArray.from_ptr (Ctypes.allocate_n Matrix.t ~count) count in
  for i = 0 to count - 1 do
    CArray.set translations i (matrix_translation i);
    CArray.set rotations i (matrix_rotation i)
  done;

  let shader =
    load_shader "resources/base_lighting_instanced.vs" "resources/lighting.fs"
  in
  if Shader.id shader = Unsigned.UInt.zero then
    failwith "Shader failed to compile";

  let mvp = get_shader_location shader "mvp" in
  let view_pos = get_shader_location shader "viewPos" in
  let instance = get_shader_location_attrib shader "instance" in
  let ambient = get_shader_location shader "ambient" in

  (* Get the locs array and assign the locations of the variables. This is necessary for the draw_mesh_instanced call.
   * Curiously, draw_mesh works without setting these. *)
  let locs = Shader.locs shader in
  CArray.set locs ShaderLocationIndex.(Matrix_mvp |> to_int) mvp;
  CArray.set locs ShaderLocationIndex.(Vector_view |> to_int) view_pos;
  CArray.set locs ShaderLocationIndex.(Matrix_model |> to_int) instance;

  let ambient_vec = Vector4.create 0.2 0.2 0.2 1.0 in
  set_shader_value shader ambient
    (to_voidp (addr ambient_vec))
    ShaderUniformDataType.Vec4;

  create_light Directional
    (Vector3.create 50.0 50.0 0.0)
    (Vector3.zero ()) Color.white shader
  |> ignore;

  let material = load_material_default () in
  Material.set_shader material shader;
  MaterialMap.set_color (CArray.get (Material.maps material) 0) Color.red;

  while not (Raylib.window_should_close ()) do
    update_camera (addr camera) CameraMode.Free;

    let cpos = Camera3D.position camera in
    let pos = Vector3.(create (x cpos) (y cpos) (z cpos)) in
    set_shader_value (Material.shader material) view_pos
      (pos |> addr |> to_voidp)
      ShaderUniformDataType.Vec3;

    for i = 0 to count - 1 do
      CArray.set rotations i
        Matrix.(multiply (CArray.get rotations i) rotations_inc.(i));
      CArray.set translations i
        Matrix.(multiply (CArray.get rotations i) (CArray.get translations i))
    done;

    begin_drawing ();

    clear_background Color.raywhite;

    begin_mode_3d camera;

    draw_mesh_instanced cube material (CArray.start translations) count;

    end_mode_3d ();

    draw_text "A CUBE OF DANCING CUBES!" 490 10 20 Color.maroon;

    draw_fps 10 10;
    end_drawing ()
  done;
  Raylib.close_window ();
  print_endline
    "Execute from the examples/shaders directory. The shaders are accessed via \
     relative paths."

let () = main ()
