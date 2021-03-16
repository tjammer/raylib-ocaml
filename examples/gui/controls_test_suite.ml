let width = 690

let height = 560

type state = {
  force_squared_check : bool;
  spinner1_val : int;
  spinner_edit_mode : bool;
  value_box_val : int;
  value_box_edit_mode : bool;
  text_box_text : string;
  text_box_edit_mode : bool;
  show_text_input_box : bool;
  combo_box_active : int;
  dropdown1_active : int;
  dropdown1_edit_mode : bool;
}

let setup () =
  Raylib.init_window width height "raygui - controls test suite";
  Raylib.set_target_fps 60;
  {
    force_squared_check = false;
    spinner1_val = 0;
    spinner_edit_mode = false;
    value_box_edit_mode = false;
    value_box_val = 50;
    text_box_text = "Text box";
    text_box_edit_mode = false;
    show_text_input_box = false;
    combo_box_active = 0;
    dropdown1_active = 0;
    dropdown1_edit_mode = false;
  }

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

      let rect = Rectangle.create 25.0 108.0 15.0 15.0 in
      let force_squared_check =
        Raygui.(check_box rect "FORCE CHECK!" s.force_squared_check)
      in

      Raygui.(set_style (Textbox `Text_alignment) TextAlignment.(to_int Center));

      let rect = Rectangle.create 25.0 135.0 125.0 30.0 in
      let spinner1_val, spinner_edit_mode =
        match
          Raygui.spinner rect "" s.spinner1_val ~min:0 ~max:100
            s.spinner_edit_mode
        with
        | vl, true -> (vl, not s.spinner_edit_mode)
        | vl, false -> (vl, s.spinner_edit_mode)
      in

      let rect = Rectangle.create 25.0 175.0 125.0 30.0 in
      let value_box_val, value_box_edit_mode =
        match
          Raygui.value_box rect "" s.value_box_val ~min:0 ~max:100
            s.value_box_edit_mode
        with
        | vl, true -> (vl, not s.value_box_edit_mode)
        | vl, false -> (vl, s.value_box_edit_mode)
      in

      Raygui.(set_style (Textbox `Text_alignment) TextAlignment.(to_int Left));

      let rect = Rectangle.create 25.0 215.0 125.0 30.0 in
      let text_box_text, text_box_edit_mode =
        match Raygui.text_box rect s.text_box_text s.text_box_edit_mode with
        | vl, true -> (vl, not s.text_box_edit_mode)
        | vl, false -> (vl, s.text_box_edit_mode)
      in

      Raygui.(set_style (Textbox `Text_alignment) TextAlignment.(to_int Center));

      Raygui.set_tooltip "Save current file.";
      let rect = Rectangle.create 25.0 255.0 125.0 30.0 in
      let show_text_input_box =
        if Raygui.button rect "Save File" then true else s.show_text_input_box
      in
      Raygui.clear_tooltip ();

      Raygui.group_box (Rectangle.create 25.0 310.0 125.0 150.0) "STATES";
      Raygui.lock ();
      Raygui.(
        set_state ControlState.Normal;
        ignore (button (Rectangle.create 30.0 320.0 115.0 30.0) "NORMAL"));
      Raygui.(
        set_state ControlState.Focused;
        ignore (button (Rectangle.create 30.0 355.0 115.0 30.0) "FOCUSED"));
      Raygui.(
        set_state ControlState.Pressed;
        ignore (button (Rectangle.create 30.0 390.0 115.0 30.0) "#15#PRESSED"));
      Raygui.(
        set_state ControlState.Disabled;
        ignore (button (Rectangle.create 30.0 425.0 115.0 30.0) "DISABLED"));
      Raygui.set_state Raygui.ControlState.Normal;
      Raygui.unlock ();

      let rect = Rectangle.create 25.0 470.0 125.0 30.0 in
      let combo_box_active =
        Raygui.combo_box rect "ONE;TWO;THREE;FOUR" s.combo_box_active
      in

      (* NOTE: GuiDropdownBox must draw after any other control that can be covered on unfolding *)
      let rect = Rectangle.create 25.0 65.0 125.0 30.0 in
      let dropdown1_active, dropdown1_edit_mode =
        match
          Raygui.dropdown_box rect "ONE;TWO;THREE;FOUR" s.dropdown1_active
            s.dropdown1_edit_mode
        with
        | vl, true -> (vl, not s.dropdown1_edit_mode)
        | vl, false -> (vl, s.dropdown1_edit_mode)
      in

      end_drawing ();
      loop
        {
          force_squared_check;
          spinner_edit_mode;
          spinner1_val;
          value_box_val;
          value_box_edit_mode;
          text_box_text;
          text_box_edit_mode;
          show_text_input_box;
          combo_box_active;
          dropdown1_active;
          dropdown1_edit_mode;
        }

let () = setup () |> loop
