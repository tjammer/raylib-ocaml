let width = 690
let height = 560

type state = {
  force_squared_check : bool;
  spinner1_val : int;
  mutable spinner_edit_mode : bool;
  value_box_val : int;
  mutable value_box_edit_mode : bool;
  text_box_text : string;
  mutable text_box_edit_mode : bool;
  show_text_input_box : bool;
  text_input_text : string;
  combo_box_active : int;
  dropdown1_active : int;
  mutable dropdown1_edit_mode : bool;
  dropdown0_active : int;
  mutable dropdown0_edit_mode : bool;
  mutable list_view_scroll_index : int;
  list_view_active : int;
  list_view_ex_active : int;
  mutable list_view_ex_focus : int;
  mutable list_view_ex_scroll_index : int;
  toggle_group_active : int;
  multi_text_box_text : string;
  mutable multi_text_box_edit_mode : bool;
  color_picker_val : Raylib.Color.t;
  slider_val : float;
  slider_bar_val : float;
  progress_val : float;
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
    text_input_text = "";
    combo_box_active = 0;
    dropdown1_active = 0;
    dropdown1_edit_mode = false;
    dropdown0_active = 0;
    dropdown0_edit_mode = false;
    list_view_scroll_index = 0;
    list_view_active = 0;
    list_view_ex_active = 0;
    list_view_ex_focus = 0;
    list_view_ex_scroll_index = 0;
    toggle_group_active = 0;
    multi_text_box_text = "Multi text box";
    multi_text_box_edit_mode = false;
    color_picker_val = Raylib.Color.raywhite;
    slider_val = 0.0;
    slider_bar_val = 50.0;
    progress_val = 0.5;
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

      if s.show_text_input_box then Raygui.lock ();

      let rect = Rectangle.create 25.0 108.0 15.0 15.0 in
      let force_squared_check =
        Raygui.(check_box rect "FORCE CHECK!" s.force_squared_check)
      in

      Raygui.(set_style (TextBox `Text_alignment) TextAlignment.(to_int Center));

      let rect = Rectangle.create 25.0 135.0 125.0 30.0 in
      let spinner1_val =
        match
          Raygui.spinner rect "" s.spinner1_val ~min:0 ~max:100
            s.spinner_edit_mode
        with
        | vl, true ->
            s.spinner_edit_mode <- not s.spinner_edit_mode;
            vl
        | vl, false -> vl
      in

      let rect = Rectangle.create 25.0 175.0 125.0 30.0 in
      let value_box_val =
        match
          Raygui.value_box rect "" s.value_box_val ~min:0 ~max:100
            s.value_box_edit_mode
        with
        | vl, true ->
            s.value_box_edit_mode <- not s.value_box_edit_mode;
            vl
        | vl, false -> vl
      in

      Raygui.(set_style (TextBox `Text_alignment) TextAlignment.(to_int Left));

      let rect = Rectangle.create 25.0 215.0 125.0 30.0 in
      let text_box_text =
        match Raygui.text_box rect s.text_box_text s.text_box_edit_mode with
        | vl, true ->
            s.text_box_edit_mode <- not s.text_box_edit_mode;
            vl
        | vl, false -> vl
      in

      Raygui.(set_style (TextBox `Text_alignment) TextAlignment.(to_int Center));

      let rect = Rectangle.create 25.0 255.0 125.0 30.0 in
      let show_text_input_box =
        if Raygui.button rect "Save File" then true else s.show_text_input_box
      in

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
      if not s.show_text_input_box then Raygui.unlock ();

      let rect = Rectangle.create 25.0 470.0 125.0 30.0 in
      let combo_box_active =
        Raygui.combo_box rect "ONE;TWO;THREE;FOUR" s.combo_box_active
      in

      (* NOTE: GuiDropdownBox must draw after any other control that can be covered on unfolding *)
      Raygui.(
        set_style (DropdownBox `Text_alignment) TextAlignment.(to_int Left));
      let rect = Rectangle.create 25.0 65.0 125.0 30.0 in
      let dropdown1_active, dropdown1_edit_mode =
        match
          Raygui.dropdown_box rect "ONE;TWO;THREE;FOUR" s.dropdown1_active
            s.dropdown1_edit_mode
        with
        | vl, true -> (vl, not s.dropdown1_edit_mode)
        | vl, false -> (vl, s.dropdown1_edit_mode)
      in

      Raygui.(
        set_style (DropdownBox `Text_alignment) TextAlignment.(to_int Center));
      let rect = Rectangle.create 25.0 25.0 125.0 30.0 in
      let dropdown0_active, dropdown0_edit_mode =
        match
          Raygui.dropdown_box rect "ONE;TWO;THREE" s.dropdown0_active
            s.dropdown0_edit_mode
        with
        | vl, true -> (vl, not s.dropdown0_edit_mode)
        | vl, false -> (vl, s.dropdown0_edit_mode)
      in

      (* second column *)
      let rect = Rectangle.create 165.0 25.0 140.0 140.0 in
      let list_view_active, list_view_scroll_index =
        Raygui.(
          list_view rect
            "Charmander;Bulbasaur;#18#Squirtel;Pikachu;Eevee;Pidgey"
            s.list_view_scroll_index s.list_view_active)
      in

      let rect = Rectangle.create 165.0 180.0 140.0 200.0 in
      let list_view_ex_active, list_view_ex_focus, list_view_ex_scroll_index =
        Raygui.(
          list_view_ex rect
            [
              "This";
              "is";
              "a";
              "list view";
              "with";
              "disable";
              "elements";
              "amazing!";
            ]
            s.list_view_ex_focus s.list_view_ex_scroll_index
            s.list_view_ex_active)
      in

      let rect = Rectangle.create 165.5 400.0 140.0 25.0 in
      let toggle_group_active =
        Raygui.(
          toggle_group rect "#1#ONE\n#3#TWO\n#8#THREE\n#23#"
            s.toggle_group_active)
      in

      (* third column *)
      let rect = Rectangle.create 320.0 25.0 225.0 140.0 in
      let multi_text_box_text =
        match
          Raygui.text_box_multi rect s.multi_text_box_text
            s.multi_text_box_edit_mode
        with
        | vl, true ->
            s.multi_text_box_edit_mode <- not s.multi_text_box_edit_mode;
            vl
        | vl, false -> vl
      in

      let rect = Rectangle.create 320.0 185.0 196.0 192.0 in
      let color_picker_val = Raygui.color_picker rect s.color_picker_val in

      let rect = Rectangle.create 355.0 400.0 165.0 20.0 in
      let slider_val =
        Raygui.slider rect "TEST"
          (Printf.sprintf "%2.2f" s.slider_val)
          s.slider_val ~min:(-50.0) ~max:100.0
      in

      let rect = Rectangle.create 320.0 430.0 200.0 20.0 in
      let slider_bar_val =
        Raygui.slider_bar rect ""
          (Printf.sprintf "%i" (int_of_float s.slider_bar_val))
          s.slider_bar_val ~min:0.0 ~max:100.0
      in

      let rect = Rectangle.create 320.0 460.0 200.0 20.0 in
      let progress_val =
        Raygui.progress_bar rect "" "" s.progress_val ~min:0.0 ~max:1.0
      in
      Raygui.unlock ();

      let text_input_text, show_text_input_box =
        if show_text_input_box then (
          draw_rectangle 0 0 (get_screen_width ()) (get_screen_height ())
            (fade Color.raywhite 0.8);

          let text_input_text, res =
            Raygui.text_input_box
              (Rectangle.create
                 ((float_of_int (get_screen_width ()) /. 2.0) -. 120.0)
                 ((float_of_int (get_screen_height ()) /. 2.0) -. 60.0)
                 240.0 140.0)
              "Save file as..." "Introduce a save file name" "Ok;Cancel"
              s.text_input_text
          in
          if res = 0 || res = 1 || res = 2 then (text_input_text, false)
          else (text_input_text, show_text_input_box))
        else (s.text_input_text, show_text_input_box)
      in

      end_drawing ();
      loop
        {
          s with
          force_squared_check;
          spinner1_val;
          value_box_val;
          text_box_text;
          show_text_input_box;
          text_input_text;
          combo_box_active;
          dropdown1_active;
          dropdown1_edit_mode;
          dropdown0_active;
          dropdown0_edit_mode;
          list_view_scroll_index;
          list_view_active;
          list_view_ex_active;
          list_view_ex_focus;
          list_view_ex_scroll_index;
          toggle_group_active;
          multi_text_box_text;
          color_picker_val;
          slider_val;
          slider_bar_val;
          progress_val;
        }

let () = setup () |> loop
