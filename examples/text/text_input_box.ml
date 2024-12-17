let width = 800
let height = 450

let setup () =
  let open Raylib in
  init_window width height "raylib [text] example - input box";

  let text_box =
    Rectangle.create ((Float.of_int width /. 2.0) -. 100.0) 180.0 225.0 50.0
  in
  set_target_fps 10;

  let text = Bytes.create 9 in
  Bytes.fill text 0 9 '\000';
  (text_box, text, 0)

let max_input_chars = 9

let rec pop_keys key text len =
  let ikey = Uchar.to_int key in
  if ikey >= 32 && ikey <= 125 && len < max_input_chars then (
    Bytes.set text len (Uchar.to_char key);
    pop_keys (Raylib.get_char_pressed ()) text (len + 1))
  else len

let rec loop (text_box, text, len) =
  let open Raylib in
  if window_should_close () then close_window ()
  else
    let mouse_on_text =
      check_collision_point_rec (get_mouse_position ()) text_box
    in

    let len =
      if mouse_on_text then (
        set_mouse_cursor MouseCursor.Ibeam;

        let len = pop_keys (get_char_pressed ()) text len in
        if is_key_pressed Key.Backspace && len > 0 then (
          Bytes.set text (len - 1) '\000';
          len - 1)
        else len)
      else (
        set_mouse_cursor MouseCursor.Default;
        len)
    in

    begin_drawing ();
    clear_background Color.raywhite;

    draw_text "place mouse over input box!" 240 140 20 Color.gray;
    draw_rectangle_rec text_box Color.lightgray;
    let color = if mouse_on_text then Color.red else Color.darkgray in
    Rectangle.(
      draw_rectangle_lines
        (x text_box |> Int.of_float)
        (y text_box |> Int.of_float)
        (width text_box |> Int.of_float)
        (height text_box |> Int.of_float)
        color);

    draw_text (Bytes.to_string text)
      ((Rectangle.x text_box |> Int.of_float) + 5)
      ((Rectangle.y text_box |> Int.of_float) + 8)
      40 Color.maroon;

    draw_text
      (Printf.sprintf "input chars: %i/%i" len max_input_chars)
      315 250 20 Color.darkgray;

    if mouse_on_text then
      draw_text "press BACKSPACE to delete chars..." 230 300 20 Color.gray;

    end_drawing ();
    loop (text_box, text, len)

let () = setup () |> loop
