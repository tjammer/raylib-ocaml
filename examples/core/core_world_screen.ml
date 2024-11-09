let screen_width = 800
let screen_height = 450

module Cube = struct
  type t = { position : Raylib.Vector3.t; screen_position : Raylib.Vector2.t }

  let init () =
    let open Raylib in
    let position = Vector3.create 0. 0. 0. in
    let screen_position = Vector2.create 0. 0. in
    { position; screen_position }
end

module State = struct
  type t = { camera : Raylib.Camera.t; cube : Cube.t }

  let init () =
    let open Raylib in
    let camera =
      let position = Vector3.create 10. 10. 10. in
      let target = Vector3.create 0. 0. 0. in
      let up = Vector3.create 0. 1. 0. in
      let fovy = 45. in
      let projection = CameraProjection.Perspective in
      Camera.create position target up fovy projection
    in
    let cube = Cube.init () in
    { camera; cube }

  let draw { camera; cube } =
    let open Raylib in
    begin_drawing ();

    clear_background Color.raywhite;

    begin_mode_3d camera;
    draw_cube cube.position 2.0 2.0 2.0 Color.red;
    draw_cube_wires cube.position 2.0 2.0 2.0 Color.maroon;
    draw_grid 10 1.0;
    end_mode_3d ();

    draw_text "Enemy: 100 / 100"
      ((Int.of_float @@ Vector2.x cube.screen_position)
      - (measure_text "Enemy: 100/100" 20 / 2))
      (Int.of_float @@ Vector2.y cube.screen_position)
      20 Color.black;
    draw_text
      (Format.sprintf "Cube position in screen space coordinates: [%i, %i]"
         (Int.of_float @@ Vector2.x cube.screen_position)
         (Int.of_float @@ Vector2.y cube.screen_position))
      10 10 20 Color.lime;
    draw_text "Text 2d should be always on top of the cube" 10 40 20 Color.gray;

    end_drawing ()
end

let setup () =
  let open Raylib in
  init_window screen_width screen_height
    "raylib [core] example - core world screen";
  (* Limit cursor to relative movement inside the window *)
  disable_cursor ();
  set_target_fps 60;
  State.init ()

let rec loop state =
  let open Raylib in
  match window_should_close () with
  | true -> close_window ()
  | false ->
      let { State.camera; cube } = state in
      update_camera (addr camera) CameraMode.Third_person;
      (* Calculate cube screen space position (with a little offset to be in top) *)
      let cube =
        let screen_position =
          let position = cube.position in
          let x, y, z = Vector3.(x position, y position, z position) in
          get_world_to_screen (Vector3.create x (y +. 2.5) z) camera
        in
        { cube with screen_position }
      in
      let state = { state with cube } in
      State.draw state;
      loop state

let () = setup () |> loop
