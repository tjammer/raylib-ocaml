module ControlState = Raygui_generated_constants.ControlState
module TextAlignment = Raygui_generated_constants.TextAlignment
module Wrapped_Control = Raygui_generated_constants.Wrapped_Control
module ControlProperty = Raygui_generated_constants.ControlProperty
module DefaultProperty = Raygui_generated_constants.DefaultProperty
module ToggleProperty = Raygui_generated_constants.ToggleProperty
module SliderProperty = Raygui_generated_constants.SliderProperty
module ProgressBarProperty = Raygui_generated_constants.ProgressBarProperty
module CheckBoxProperty = Raygui_generated_constants.CheckBoxProperty
module ComboBoxProperty = Raygui_generated_constants.ComboBoxProperty
module DropdownBoxProperty = Raygui_generated_constants.DropdownBoxProperty
module TextBoxProperty = Raygui_generated_constants.TextBoxProperty
module SpinnerProperty = Raygui_generated_constants.SpinnerProperty
module ScrollBarProperty = Raygui_generated_constants.ScrollBarProperty
module ScrollBarSide = Raygui_generated_constants.ScrollBarSide
module ListViewProperty = Raygui_generated_constants.ListViewProperty
module ColorPickerProperty = Raygui_generated_constants.ColorPickerProperty
module StyleProp = Raygui_generated_constants.StyleProp

val enable : unit -> unit

val disable : unit -> unit

val lock : unit -> unit

val unlock : unit -> unit

val fade : float -> unit

val set_state : ControlState.t -> unit

val get_state : unit -> ControlState.t

val set_font : Raylib.Font.t -> unit

val get_font : unit -> Raylib.Font.t

val _set_style :
  Raygui_functions.Constants.Wrapped_Control.t -> int -> int -> unit

val _get_style : Raygui_functions.Constants.Wrapped_Control.t -> int -> int

val enable_tooltip : unit -> unit

val disable_tooltip : unit -> unit

val set_tooltip : string -> unit

val clear_tooltip : unit -> unit

val window_box : Raylib.Rectangle.t -> string -> bool

val group_box : Raylib.Rectangle.t -> string -> unit

val line : Raylib.Rectangle.t -> string -> unit

val panel : Raylib.Rectangle.t -> unit

val scroll_panel :
  Raylib.Rectangle.t ->
  Raylib.Rectangle.t ->
  Raylib.Vector2.t Raylib.ptr ->
  Raylib.Rectangle.t

val label : Raylib.Rectangle.t -> string -> unit

val button : Raylib.Rectangle.t -> string -> bool

val label_button : Raylib.Rectangle.t -> string -> bool

val image_button : Raylib.Rectangle.t -> string -> Raylib.Texture.t -> bool

val image_button_ex :
  Raylib.Rectangle.t -> string -> Raylib.Texture.t -> Raylib.Rectangle.t -> bool

val toggle : Raylib.Rectangle.t -> string -> bool -> bool

val toggle_group : Raylib.Rectangle.t -> string -> int -> int

val check_box : Raylib.Rectangle.t -> string -> bool -> bool

val combo_box : Raylib.Rectangle.t -> string -> int -> int

val dropdown_box : Raylib.Rectangle.t -> string -> int -> bool -> int * bool

val spinner :
  Raylib.Rectangle.t ->
  string ->
  int ->
  min:int ->
  max:int ->
  bool ->
  int * bool

val value_box :
  Raylib.Rectangle.t ->
  string ->
  int ->
  min:int ->
  max:int ->
  bool ->
  int * bool

val text_box : Raylib.Rectangle.t -> string -> bool -> string * bool

val text_box_multi :
  Raylib.Rectangle.t -> string Raylib.ptr -> int -> bool -> bool

val slider :
  Raylib.Rectangle.t -> string -> string -> float -> float -> float -> float

val slider_bar :
  Raylib.Rectangle.t -> string -> string -> float -> float -> float -> float

val progress_bar :
  Raylib.Rectangle.t -> string -> string -> float -> float -> float -> float

val status_bar : Raylib.Rectangle.t -> string -> unit

val dummy_rec : Raylib.Rectangle.t -> string -> unit

val scroll_bar : Raylib.Rectangle.t -> int -> int -> int -> int

val grid : Raylib.Rectangle.t -> float -> int -> Raylib.Vector2.t

val list_view :
  Raylib.Rectangle.t -> string -> int Ctypes_static.ptr -> int -> int

val list_view_ex :
  Raylib.Rectangle.t ->
  string Ctypes_static.ptr ->
  int ->
  int Ctypes_static.ptr ->
  int Ctypes_static.ptr ->
  int ->
  int

val message_box : Raylib.Rectangle.t -> string -> string -> string -> int

val text_input_box :
  Raylib.Rectangle.t -> string -> string -> string -> string -> int

val color_picker : Raylib.Rectangle.t -> Raylib.Color.t -> Raylib.Color.t

val color_panel : Raylib.Rectangle.t -> Raylib.Color.t -> Raylib.Color.t

val color_bar_alpha : Raylib.Rectangle.t -> float -> float

val color_bar_hue : Raylib.Rectangle.t -> float -> float

val load_style : string -> unit

val load_style_default : unit -> unit

module Default : sig
  type t = [ `Background_color | `Line_color | `Text_size | `Text_spacing ]
end

module Toggle : sig
  type t = [ `Padding_toggle ]
end

module Slider : sig
  type t = [ `Padding_slider | `Width_slider ]
end

module ProgressBar : sig
  type t = [ `Padding_progressbar ]
end

module CheckBox : sig
  type t = [ `Padding_checkbox ]
end

module ComboBox : sig
  type t = [ `Padding_combobox | `Width_combobox ]
end

module DropdownBox : sig
  type t = [ `Arrow_padding | `Dropdown_items_padding ]
end

module TextBox : sig
  type t =
    [ `Color_selected_bg
    | `Color_selected_fg
    | `Text_inner_padding
    | `Text_lines_padding ]
end

module Spinner : sig
  type t = [ `Padding_spinner | `Width_spinner ]
end

module ScrollBar : sig
  type t =
    [ `Arrows_size
    | `Arrows_visible
    | `Scroll_padding
    | `Scroll_slider_padding
    | `Scroll_slider_size
    | `Scroll_speed ]
end

module ListView : sig
  type t =
    [ `List_items_height
    | `List_items_padding
    | `Scrollbar_side
    | `Scrollbar_width ]
end

module ColorPicker : sig
  type t =
    [ `Color_selector_size
    | `Huebar_padding
    | `Huebar_selector_height
    | `Huebar_selector_overflow
    | `Huebar_width ]
end

module Control : sig
  type prop =
    [ `Base_color_disabled
    | `Base_color_focused
    | `Base_color_normal
    | `Base_color_pressed
    | `Border_color_disabled
    | `Border_color_focused
    | `Border_color_normal
    | `Border_color_pressed
    | `Border_width
    | `Text_alignment
    | `Text_color_disabled
    | `Text_color_focused
    | `Text_color_normal
    | `Text_color_pressed
    | `Text_padding ]

  type t =
    | Default of
        [ `Background_color
        | `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Line_color
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding
        | `Text_size
        | `Text_spacing ]
    | Label of prop
    | Button of prop
    | Toggle of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_toggle
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Slider of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_slider
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding
        | `Width_slider ]
    | Progressbar of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_progressbar
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Checkbox of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_checkbox
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Combobox of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_combobox
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding
        | `Width_combobox ]
    | Dropdownbox of
        [ `Arrow_padding
        | `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Dropdown_items_padding
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Textbox of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Color_selected_bg
        | `Color_selected_fg
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_inner_padding
        | `Text_lines_padding
        | `Text_padding ]
    | Valuebox of prop
    | Spinner of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Padding_spinner
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding
        | `Width_spinner ]
    | Listview of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `List_items_height
        | `List_items_padding
        | `Scrollbar_side
        | `Scrollbar_width
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Colorpicker of
        [ `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Color_selector_size
        | `Huebar_padding
        | `Huebar_selector_height
        | `Huebar_selector_overflow
        | `Huebar_width
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Scrollbar of
        [ `Arrows_size
        | `Arrows_visible
        | `Base_color_disabled
        | `Base_color_focused
        | `Base_color_normal
        | `Base_color_pressed
        | `Border_color_disabled
        | `Border_color_focused
        | `Border_color_normal
        | `Border_color_pressed
        | `Border_width
        | `Scroll_padding
        | `Scroll_slider_padding
        | `Scroll_slider_size
        | `Scroll_speed
        | `Text_alignment
        | `Text_color_disabled
        | `Text_color_focused
        | `Text_color_normal
        | `Text_color_pressed
        | `Text_padding ]
    | Statusbar of prop
end

val prop_to_int :
  [< `Arrow_padding
  | `Arrows_size
  | `Arrows_visible
  | `Background_color
  | `Base_color_disabled
  | `Base_color_focused
  | `Base_color_normal
  | `Base_color_pressed
  | `Border_color_disabled
  | `Border_color_focused
  | `Border_color_normal
  | `Border_color_pressed
  | `Border_width
  | `Color_selected_bg
  | `Color_selected_fg
  | `Color_selector_size
  | `Dropdown_items_padding
  | `Huebar_padding
  | `Huebar_selector_height
  | `Huebar_selector_overflow
  | `Huebar_width
  | `Line_color
  | `List_items_height
  | `List_items_padding
  | `Padding_checkbox
  | `Padding_combobox
  | `Padding_progressbar
  | `Padding_slider
  | `Padding_spinner
  | `Padding_toggle
  | `Scroll_padding
  | `Scroll_slider_padding
  | `Scroll_slider_size
  | `Scroll_speed
  | `Scrollbar_side
  | `Scrollbar_width
  | `Text_alignment
  | `Text_color_disabled
  | `Text_color_focused
  | `Text_color_normal
  | `Text_color_pressed
  | `Text_inner_padding
  | `Text_lines_padding
  | `Text_padding
  | `Text_size
  | `Text_spacing
  | `Width_combobox
  | `Width_slider
  | `Width_spinner ] ->
  int

val get_style : Control.t -> int

val set_style : Control.t -> int -> unit
