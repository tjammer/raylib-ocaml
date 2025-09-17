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
  type t = [ `Width_combobox | `Spacing_combobox ]
end

module DropdownBox = struct
  type t = [ `Arrow_padding | `Dropdown_items_spacing ]
end

module TextBox = struct
  type t =
    [ `Text_inner_padding
    | `Text_lines_spacing
    | `Text_alignment_vertical
    | `Text_multiline
    | `Text_wrap_mode ]
end

module Spinner = struct
  type t = [ `Width_spinner | `Spacing_spinner ]
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
    | `List_items_spacing
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
    | ProgressBar of [ prop | ProgressBar.t ]
    | CheckBox of [ prop | CheckBox.t ]
    | ComboBox of [ prop | ComboBox.t ]
    | DropdownBox of [ prop | DropdownBox.t ]
    | TextBox of [ prop | TextBox.t ]
    | Valuebox of prop
    | Spinner of [ prop | Spinner.t ]
    | ListView of [ prop | ListView.t ]
    | ColorPicker of [ prop | ColorPicker.t ]
    | ScrollBar of [ prop | ScrollBar.t ]
    | StatusBar of prop
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
  | `Spacing_combobox -> ComboBoxProperty.(to_int Spacing)
  | `Arrow_padding -> DropdownBoxProperty.(to_int Arrow_padding)
  | `Dropdown_items_spacing ->
      DropdownBoxProperty.(to_int Dropdown_items_spacing)
  | `Text_inner_padding -> TextBoxProperty.(to_int Text_inner_padding)
  | `Text_lines_spacing -> TextBoxProperty.(to_int Text_lines_spacing)
  | `Text_alignment_vertical -> TextBoxProperty.(to_int Text_alignment_vertical)
  | `Text_multiline -> TextBoxProperty.(to_int Text_multiline)
  | `Text_wrap_mode -> TextBoxProperty.(to_int Text_wrap_mode)
  | `Width_spinner -> SpinnerProperty.(to_int Width)
  | `Spacing_spinner -> SpinnerProperty.(to_int Spacing)
  | `Arrows_size -> ScrollBarProperty.(to_int Arrows_size)
  | `Arrows_visible -> ScrollBarProperty.(to_int Arrows_visible)
  | `Scroll_slider_padding -> ScrollBarProperty.(to_int Scroll_slider_padding)
  | `Scroll_slider_size -> ScrollBarProperty.(to_int Scroll_slider_size)
  | `Scroll_padding -> ScrollBarProperty.(to_int Scroll_padding)
  | `Scroll_speed -> ScrollBarProperty.(to_int Scroll_speed)
  | `List_items_height -> ListViewProperty.(to_int List_items_height)
  | `List_items_spacing -> ListViewProperty.(to_int List_items_spacing)
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
  | ProgressBar prop -> _get_style Progressbar (prop_to_int prop)
  | CheckBox prop -> _get_style Checkbox (prop_to_int prop)
  | ComboBox prop -> _get_style Combobox (prop_to_int prop)
  | DropdownBox prop -> _get_style Dropdownbox (prop_to_int prop)
  | TextBox prop -> _get_style Textbox (prop_to_int prop)
  | Valuebox prop -> _get_style Valuebox (prop_to_int prop)
  | Spinner prop -> _get_style Spinner (prop_to_int prop)
  | ScrollBar prop -> _get_style Scrollbar (prop_to_int prop)
  | ListView prop -> _get_style Listview (prop_to_int prop)
  | ColorPicker prop -> _get_style Colorpicker (prop_to_int prop)
  | StatusBar prop -> _get_style Statusbar (prop_to_int prop)

let set_style ctl value =
  match ctl with
  | Control.Default prop ->
      _set_style Wrapped_Control.Default (prop_to_int prop) value
  | Label prop -> _set_style Label (prop_to_int prop) value
  | Button prop -> _set_style Button (prop_to_int prop) value
  | Toggle prop -> _set_style Toggle (prop_to_int prop) value
  | Slider prop -> _set_style Slider (prop_to_int prop) value
  | ProgressBar prop -> _set_style Progressbar (prop_to_int prop) value
  | CheckBox prop -> _set_style Checkbox (prop_to_int prop) value
  | ComboBox prop -> _set_style Combobox (prop_to_int prop) value
  | DropdownBox prop -> _set_style Dropdownbox (prop_to_int prop) value
  | TextBox prop -> _set_style Textbox (prop_to_int prop) value
  | Valuebox prop -> _set_style Valuebox (prop_to_int prop) value
  | Spinner prop -> _set_style Spinner (prop_to_int prop) value
  | ScrollBar prop -> _set_style Scrollbar (prop_to_int prop) value
  | ListView prop -> _set_style Listview (prop_to_int prop) value
  | ColorPicker prop -> _set_style Colorpicker (prop_to_int prop) value
  | StatusBar prop -> _set_style Statusbar (prop_to_int prop) value
