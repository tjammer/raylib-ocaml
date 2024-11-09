let screen_width = 800
let screen_height = 450

module Line = struct
  type action = Move_start_point | Move_end_point

  type t = {
    start_point : Raylib.Vector2.t;
    end_point : Raylib.Vector2.t;
    action : action option;
  }

  let make ~start_point ~end_point = { start_point; end_point; action = None }

  let step ~mouse_pos { start_point; end_point; action } =
    let open Raylib in
    let action =
      if is_mouse_button_down MouseButton.Left then
        if check_collision_point_circle mouse_pos start_point 10. then
          Some Move_start_point
        else if check_collision_point_circle mouse_pos end_point 10. then
          Some Move_end_point
        else action
      else action
    in
    match action with
    | Some Move_start_point ->
        let action =
          if is_mouse_button_released MouseButton.Left then None else action
        in
        { start_point = mouse_pos; end_point; action }
    | Some Move_end_point ->
        let action =
          if is_mouse_button_released MouseButton.Left then None else action
        in
        { start_point; end_point = mouse_pos; action }
    | None -> { start_point; end_point; action }

  let draw ~mouse_pos { start_point; end_point; action } =
    let open Raylib in
    draw_line_bezier start_point end_point 4. Color.blue;
    let start_point_color, end_point_color =
      match action with
      | None -> (Color.blue, Color.blue)
      | Some Move_start_point -> (Color.red, Color.blue)
      | Some Move_end_point -> (Color.blue, Color.red)
    in
    draw_circle_v start_point
      (if check_collision_point_circle mouse_pos start_point 10. then 14.
       else 8.)
      start_point_color;
    draw_circle_v end_point
      (if check_collision_point_circle mouse_pos end_point 10. then 14. else 8.)
      end_point_color
end

module State = struct
  type t = { line : Line.t; mouse_pos : Raylib.Vector2.t }

  let draw { line; mouse_pos } =
    let open Raylib in
    begin_drawing ();
    clear_background Color.raywhite;
    draw_text "MOVE START-END POINTS WITH MOUSE" 15 20 20 Color.gray;
    Line.draw ~mouse_pos line;
    (* Draw line Cubic Bezier, in-out interpolation (easing), no control points *)
    end_drawing ()
end

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlags.Msaa_4x_hint ];
  init_window screen_width screen_height
    "raylib [shapes] example - cubic-bezier lines";
  let line =
    let start_point = Vector2.create 30. 30. in
    let end_point =
      Vector2.create
        (Float.of_int screen_width -. 30.)
        (Float.of_int screen_height -. 30.)
    in
    Line.make ~start_point ~end_point
  in
  let mouse_pos = Vector2.zero () in
  set_target_fps 60;
  { State.line; mouse_pos }

let rec loop state =
  let open Raylib in
  match window_should_close () with
  | true -> close_window ()
  | false ->
      let { State.line; mouse_pos = _ } = state in
      let mouse_pos = get_mouse_position () in
      let line = Line.step ~mouse_pos line in
      let state = { State.line; mouse_pos } in
      State.draw state;
      loop state

let () = setup () |> loop
