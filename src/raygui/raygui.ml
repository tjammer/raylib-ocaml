include Functions

module Default = struct
  type t = [ `Text_size | `Text_spacing | `Line_color | `Background_color ]
end

module Toggle = struct
  type t = [ `Padding_toggle ]
end

module Slider = struct
  type t = [ `Width_slider | `Padding_slider ]
end

module ProgressBar = struct
  type t = [ `Padding_progressbar ]
end

module CheckBox = struct
  type t = [ `Padding_checkbox ]
end

module ComboBox = struct
  type t = [ `Width_combobox | `Padding_combobox ]
end

module DropdownBox = struct
  type t = [ `Arrow_padding | `Dropdown_items_padding ]
end

module TextBox = struct
  type t =
    [ `Text_inner_padding
    | `Text_lines_padding
    | `Color_selected_fg
    | `Color_selected_bg ]
end

module Spinner = struct
  type t = [ `Width_spinner | `Padding_spinner ]
end

module ScrollBar = struct
  type t =
    [ `Arrows_size
    | `Arrows_visible
    | `Scroll_slider_padding
    | `Scroll_slider_size
    | `Scroll_padding
    | `Scroll_speed ]
end

(* TODO check how scrollbarside works *)

module ListView = struct
  type t =
    [ `List_items_height
    | `List_items_padding
    | `Scrollbar_width
    | `Scrollbar_side ]
end

module ColorPicker = struct
  type t =
    [ `Color_selector_size
    | `Huebar_width
    | `Huebar_padding
    | `Huebar_selector_height
    | `Huebar_selector_overflow ]
end

module Control = struct
  type prop =
    [ `Border_color_normal
    | `Base_color_normal
    | `Text_color_normal
    | `Border_color_focused
    | `Base_color_focused
    | `Text_color_focused
    | `Border_color_pressed
    | `Base_color_pressed
    | `Text_color_pressed
    | `Border_color_disabled
    | `Base_color_disabled
    | `Text_color_disabled
    | `Border_width
    | `Text_padding
    | `Text_alignment ]

  type t =
    | Default of [ prop | Default.t ]
    | Label of prop
    | Button of prop
    | Toggle of [ prop | Toggle.t ]
    | Slider of [ prop | Slider.t ]
    | Progressbar of [ prop | ProgressBar.t ]
    | Checkbox of [ prop | CheckBox.t ]
    | Combobox of [ prop | ComboBox.t ]
    | DropdownBox of [ prop | DropdownBox.t ]
    | Textbox of [ prop | TextBox.t ]
    | Valuebox of prop
    | Spinner of [ prop | Spinner.t ]
    | Listview of [ prop | ListView.t ]
    | Colorpicker of [ prop | ColorPicker.t ]
    | Scrollbar of [ prop | ScrollBar.t ]
    | Statusbar of prop
end

let prop_to_int = function
  | `Border_color_normal -> ControlProperty.(to_int Border_color_normal)
  | `Base_color_normal -> ControlProperty.(to_int Base_color_normal)
  | `Text_color_normal -> ControlProperty.(to_int Text_color_normal)
  | `Border_color_focused -> ControlProperty.(to_int Border_color_focused)
  | `Base_color_focused -> ControlProperty.(to_int Base_color_focused)
  | `Text_color_focused -> ControlProperty.(to_int Text_color_focused)
  | `Border_color_pressed -> ControlProperty.(to_int Border_color_pressed)
  | `Base_color_pressed -> ControlProperty.(to_int Base_color_pressed)
  | `Text_color_pressed -> ControlProperty.(to_int Text_color_pressed)
  | `Border_color_disabled -> ControlProperty.(to_int Border_color_disabled)
  | `Base_color_disabled -> ControlProperty.(to_int Base_color_disabled)
  | `Text_color_disabled -> ControlProperty.(to_int Text_color_disabled)
  | `Border_width -> ControlProperty.(to_int Border_width)
  | `Text_padding -> ControlProperty.(to_int Text_padding)
  | `Text_alignment -> ControlProperty.(to_int Text_alignment)
  | `Text_size -> DefaultProperty.(to_int Text_size)
  | `Text_spacing -> DefaultProperty.(to_int Text_spacing)
  | `Line_color -> DefaultProperty.(to_int Line_color)
  | `Background_color -> DefaultProperty.(to_int Background_color)
  | `Padding_toggle -> ToggleProperty.(to_int Padding)
  | `Width_slider -> SliderProperty.(to_int Width)
  | `Padding_slider -> SliderProperty.(to_int Padding)
  | `Padding_progressbar -> ProgressBarProperty.(to_int Padding)
  | `Padding_checkbox -> CheckBoxProperty.(to_int Padding)
  | `Width_combobox -> ComboBoxProperty.(to_int Width)
  | `Padding_combobox -> ComboBoxProperty.(to_int Padding)
  | `Arrow_padding -> DropdownBoxProperty.(to_int Arrow_padding)
  | `Dropdown_items_padding ->
      DropdownBoxProperty.(to_int Dropdown_items_padding)
  | `Text_inner_padding -> TextBoxProperty.(to_int Text_inner_padding)
  | `Text_lines_padding -> TextBoxProperty.(to_int Text_lines_padding)
  | `Color_selected_fg -> TextBoxProperty.(to_int Color_selected_fg)
  | `Color_selected_bg -> TextBoxProperty.(to_int Color_selected_bg)
  | `Width_spinner -> SpinnerProperty.(to_int Width)
  | `Padding_spinner -> SpinnerProperty.(to_int Padding)
  | `Arrows_size -> ScrollBarProperty.(to_int Arrows_size)
  | `Arrows_visible -> ScrollBarProperty.(to_int Arrows_visible)
  | `Scroll_slider_padding -> ScrollBarProperty.(to_int Scroll_slider_padding)
  | `Scroll_slider_size -> ScrollBarProperty.(to_int Scroll_slider_size)
  | `Scroll_padding -> ScrollBarProperty.(to_int Scroll_padding)
  | `Scroll_speed -> ScrollBarProperty.(to_int Scroll_speed)
  | `List_items_height -> ListViewProperty.(to_int List_items_height)
  | `List_items_padding -> ListViewProperty.(to_int List_items_padding)
  | `Scrollbar_width -> ListViewProperty.(to_int Scrollbar_width)
  | `Scrollbar_side -> ListViewProperty.(to_int Scrollbar_side)
  | `Color_selector_size -> ColorPickerProperty.(to_int Color_selector_size)
  | `Huebar_width -> ColorPickerProperty.(to_int Huebar_width)
  | `Huebar_padding -> ColorPickerProperty.(to_int Huebar_padding)
  | `Huebar_selector_height ->
      ColorPickerProperty.(to_int Huebar_selector_height)
  | `Huebar_selector_overflow ->
      ColorPickerProperty.(to_int Huebar_selector_overflow)

let get_style = function
  | Control.Default prop ->
      _get_style Wrapped_Control.Default (prop_to_int prop)
  | Label prop -> _get_style Label (prop_to_int prop)
  | Button prop -> _get_style Button (prop_to_int prop)
  | Toggle prop -> _get_style Toggle (prop_to_int prop)
  | Slider prop -> _get_style Slider (prop_to_int prop)
  | Progressbar prop -> _get_style Progressbar (prop_to_int prop)
  | Checkbox prop -> _get_style Checkbox (prop_to_int prop)
  | Combobox prop -> _get_style Combobox (prop_to_int prop)
  | DropdownBox prop -> _get_style Dropdownbox (prop_to_int prop)
  | Textbox prop -> _get_style Textbox (prop_to_int prop)
  | Valuebox prop -> _get_style Valuebox (prop_to_int prop)
  | Spinner prop -> _get_style Spinner (prop_to_int prop)
  | Scrollbar prop -> _get_style Scrollbar (prop_to_int prop)
  | Listview prop -> _get_style Listview (prop_to_int prop)
  | Colorpicker prop -> _get_style Colorpicker (prop_to_int prop)
  | Statusbar prop -> _get_style Statusbar (prop_to_int prop)

let set_style ctl value =
  match ctl with
  | Control.Default prop ->
      _set_style Wrapped_Control.Default (prop_to_int prop) value
  | Label prop -> _set_style Label (prop_to_int prop) value
  | Button prop -> _set_style Button (prop_to_int prop) value
  | Toggle prop -> _set_style Toggle (prop_to_int prop) value
  | Slider prop -> _set_style Slider (prop_to_int prop) value
  | Progressbar prop -> _set_style Progressbar (prop_to_int prop) value
  | Checkbox prop -> _set_style Checkbox (prop_to_int prop) value
  | Combobox prop -> _set_style Combobox (prop_to_int prop) value
  | DropdownBox prop -> _set_style Dropdownbox (prop_to_int prop) value
  | Textbox prop -> _set_style Textbox (prop_to_int prop) value
  | Valuebox prop -> _set_style Valuebox (prop_to_int prop) value
  | Spinner prop -> _set_style Spinner (prop_to_int prop) value
  | Scrollbar prop -> _set_style Scrollbar (prop_to_int prop) value
  | Listview prop -> _set_style Listview (prop_to_int prop) value
  | Colorpicker prop -> _set_style Colorpicker (prop_to_int prop) value
  | Statusbar prop -> _set_style Statusbar (prop_to_int prop) value
