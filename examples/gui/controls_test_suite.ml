let width = 690

let height = 560

type state = {
  force_squared_check : bool;
  spinner1_val : int;
  spinner_edit_mode : bool;
}

let setup () =
  Raylib.init_window width height "raygui - controls test suite";
  { force_squared_check = false; spinner1_val = 0; spinner_edit_mode = false }

module Rect = struct
  let t = Raylib_generated_types.Rectangle.t

  let create x y width height =
    let rc = Ctypes.make t in
    Ctypes.setf rc Raylib_generated_types.Rectangle.x x;
    Ctypes.setf rc Raylib_generated_types.Rectangle.y y;
    Ctypes.setf rc Raylib_generated_types.Rectangle.width width;
    Ctypes.setf rc Raylib_generated_types.Rectangle.height height;
    rc
end

let rec loop s =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let col =
        Raygui.(get_style (Control.Default `Background_color)) |> get_color
      in
      begin_drawing ();
      clear_background col;

      let force_squared_check =
        Raygui.(
          check_box
            (Rect.create 25.0 108.0 15.0 15.0)
            "FORCE CHECK!" s.force_squared_check)
      in

      Raygui.(set_style (Textbox `Text_alignment) TextAlignment.(to_int Center));

      draw_text "Congrats! You created your first window!" 190 200 20
        Color.lightgray;
      end_drawing ();
      loop { s with force_squared_check }

let () = setup () |> loop
