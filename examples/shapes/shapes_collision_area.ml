let width = 800

let height = 450

let screen_upper_limit = 40.0

let setup () =
  let open Raylib in
  init_window width height "raylib [shapes] example - collision area";
  let box_a =
    Rectangle.create 10.0
      (Float.of_int ((get_screen_height () / 2) - 50))
      200.0 100.0
  in
  let box_a_speed_x = 4.0 in
  let box_b =
    Rectangle.create
      (Float.of_int ((get_screen_width () / 2) - 30))
      (Float.of_int ((get_screen_height () / 2) - 30))
      60.0 60.0
  in
  let box_collision = Rectangle.create 0.0 0.0 0.0 0.0 in
  set_target_fps 60;
  (false, box_a, box_a_speed_x, box_b, box_collision)

let rec loop (pause, box_a, box_a_speed_x, box_b, box_collision) =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      (* Move box if not paused *)
      (if not pause then Rectangle.(set_x box_a (x box_a +. box_a_speed_x)));

      (* Bounce box on x screen limits *)
      let box_a_speed_x =
        if
          Rectangle.(
            x box_a +. width box_a >= Float.of_int (get_screen_width ())
            || x box_a <= 0.0)
        then box_a_speed_x *. -1.0
        else box_a_speed_x
      in

      (* Update player-controlled-box (box02) *)
      Rectangle.(
        set_x box_b (Float.of_int (get_mouse_x ()) -. (width box_b /. 2.0)));
      Rectangle.(
        set_y box_b (Float.of_int (get_mouse_y ()) -. (height box_b /. 2.0)));

      (* Make sure Box B does not go out of move area limits *)
      ( if
        Rectangle.(x box_b +. width box_b >= Float.of_int (get_screen_width ()))
      then
        Rectangle.(
          set_x box_b (Float.of_int (get_screen_width ()) -. width box_b))
      else if Rectangle.(x box_b <= 0.0) then Rectangle.(set_x box_b 0.0) );
      ( if
        Rectangle.(
          y box_b +. height box_b >= Float.of_int (get_screen_height ()))
      then
        Rectangle.(
          set_y box_b (Float.of_int (get_screen_height ()) -. height box_b))
      else if Rectangle.(y box_b <= screen_upper_limit) then
        Rectangle.(set_y box_b screen_upper_limit) );

      (* Check boxes collision *)
      let collision = check_collision_recs box_a box_b in
      let box_collision =
        if collision then get_collision_rec box_a box_b else box_collision
      in

      (* Pause Box A movement *)
      let pause = if is_key_pressed Key.Space then not pause else pause in

      begin_drawing ();
      clear_background Color.raywhite;

      draw_rectangle 0 0 width
        (Int.of_float screen_upper_limit)
        (if collision then Color.red else Color.black);

      draw_rectangle_rec box_a Color.gold;
      draw_rectangle_rec box_b Color.blue;

      if collision then (
        draw_rectangle_rec box_collision Color.lime;
        draw_text "COLLISION!"
          ((get_screen_width () / 2) - (measure_text "COLLISION!" 20 / 2))
          ((Int.of_float screen_upper_limit / 2) - 10)
          20 Color.black;
        draw_text
          (Printf.sprintf "Collision Area %i"
             (Int.of_float
                Rectangle.(width box_collision *. height box_collision)))
          ((get_screen_width () / 2) - 100)
          (Int.of_float screen_upper_limit + 10)
          20 Color.black );

      draw_fps 10 10;

      end_drawing ();

      loop (pause, box_a, box_a_speed_x, box_b, box_collision)

let () = setup () |> loop
