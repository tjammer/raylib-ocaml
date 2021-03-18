module ControlState : sig
  type t = Normal | Focused | Pressed | Disabled

  val to_int : t -> int
end

module TextAlignment : sig
  type t = Left | Center | Right

  val to_int : t -> int
end

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

(** {1 State modification functions } *)

val enable : unit -> unit
(** [enable ()] Enable gui controls (global state) *)

val disable : unit -> unit
(** [disable ()] Disable gui controls (global state) *)

val lock : unit -> unit
(** [lock ()] Lock gui controls (global state) *)

val unlock : unit -> unit
(** [unlock ()] Unlock gui controls (global state) *)

val fade : float -> unit
(** [fade alpha] Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f *)

val set_state : ControlState.t -> unit
(** [set_state state] Set gui state (global state) *)

val get_state : unit -> ControlState.t
(** [get_state ()] Get gui state (global state) *)

(** {1 Font set/get functions } *)

val set_font : Raylib.Font.t -> unit
(** [set_font font] Set gui custom font (global state) *)

val get_font : unit -> Raylib.Font.t
(** [get_font ()] Get gui custom font (global state) *)

(** {1 Style set/get functions } *)

val set_style : Control.t -> int -> unit
(** [set_style control value] Set one style property *)

val get_style : Control.t -> int
(** [get_style control] Get one style property *)

(** {1 Tooltips set functions } *)

val enable_tooltip : unit -> unit
(** [enable_tooltip ()] Enable gui tooltips *)

val disable_tooltip : unit -> unit
(** [disable_tooltip ()] Disable gui tooltips *)

val set_tooltip : string -> unit
(** [set_tooltip tooltip] Set current tooltip for display *)

val clear_tooltip : unit -> unit
(** [clear_tooltip ()] Clear any tooltip registered *)

(** {1 Container/separator controls, useful for controls organization } *)

val window_box : Raylib.Rectangle.t -> string -> bool
(** [window_box bounds title] Window Box control, shows a window that can be closed *)

val group_box : Raylib.Rectangle.t -> string -> unit
(** [group_box bounds text] Group Box control with text name *)

val line : Raylib.Rectangle.t -> string -> unit
(** [line bounds text] Line separator control, could contain text *)

val panel : Raylib.Rectangle.t -> unit
(** [panel bounds] Panel control, useful to group controls *)

val scroll_panel :
  Raylib.Rectangle.t ->
  Raylib.Rectangle.t ->
  Raylib.Vector2.t Raylib.ptr ->
  Raylib.Rectangle.t
(** [scroll_panel bounds content scroll] Scroll Panel control *)

(** {1 Basic controls set } *)

val label : Raylib.Rectangle.t -> string -> unit
(** [label bounds text] Label control, shows text *)

val button : Raylib.Rectangle.t -> string -> bool
(** [button bounds text] Button control, returns true when clicked *)

val label_button : Raylib.Rectangle.t -> string -> bool
(** [label_button bounds text] Label button control, show true when clicked *)

val image_button : Raylib.Rectangle.t -> string -> Raylib.Texture.t -> bool
(** [image_button bounds text texture] Image button control, returns true when clicked *)

val image_button_ex :
  Raylib.Rectangle.t -> string -> Raylib.Texture.t -> Raylib.Rectangle.t -> bool
(** [image_button_ex bounds text texture tex_source] Image button extended control, returns true when clicked *)

val toggle : Raylib.Rectangle.t -> string -> bool -> bool
(** [toggle bounds text active] Toggle Button control, returns true when active *)

val toggle_group : Raylib.Rectangle.t -> string -> int -> int
(** [toggle_group bounds text active] Toggle Group control, returns active toggle index *)

val check_box : Raylib.Rectangle.t -> string -> bool -> bool
(** [check_box bounds text checked] Check Box control, returns true when active *)

val combo_box : Raylib.Rectangle.t -> string -> int -> int
(** [combo_box bounds text active] Combo Box control, returns selected item index *)

val dropdown_box : Raylib.Rectangle.t -> string -> int -> bool -> int * bool
(** [dropdown_box bounds text active] Dropdown Box control, returns selected item, active *)

val spinner :
  Raylib.Rectangle.t ->
  string ->
  int ->
  min:int ->
  max:int ->
  bool ->
  int * bool
(** [spinner bounds text valute ~min ~max edit_mode] Spinner control, returns selected value, edit_mode *)

val value_box :
  Raylib.Rectangle.t ->
  string ->
  int ->
  min:int ->
  max:int ->
  bool ->
  int * bool
(** [value_box bounds text value ~min ~max edit_mode] Value Box control, updates input text with numbers, returns value, edit_mode *)

val text_box : Raylib.Rectangle.t -> string -> bool -> string * bool
(** [text_box bounds text text_size edit_mode] Text Box control, returns text, edit_mode *)

val text_box_multi : Raylib.Rectangle.t -> string -> bool -> string * bool
(** [text_box_multi bounds text text_size edit_mode] Text Box control with multiple lines,returns text, edit_mode *)

val slider :
  Raylib.Rectangle.t ->
  string ->
  string ->
  float ->
  min:float ->
  max:float ->
  float
(** [slider bounds text_left text_right value ~min ~max] Slider control, returns selected value *)

val slider_bar :
  Raylib.Rectangle.t ->
  string ->
  string ->
  float ->
  min:float ->
  max:float ->
  float
(** [slider_bar bounds text_left text_right value ~min ~max] Slider Bar control, returns selected value *)

val progress_bar :
  Raylib.Rectangle.t ->
  string ->
  string ->
  float ->
  min:float ->
  max:float ->
  float
(** [progress_bar bounds text_left text_right value ~min ~max] Progress Bar control, shows current progress value *)

val status_bar : Raylib.Rectangle.t -> string -> unit
(** [status_bar bounds text] Status Bar control, shows info text *)

val dummy_rec : Raylib.Rectangle.t -> string -> unit
(** [dummy_rec bounds text] Dummy control for placeholders *)

val scroll_bar : Raylib.Rectangle.t -> int -> min:int -> max:int -> int
(** [scroll_bar bounds value ~min ~max] Scroll Bar control *)

val grid : Raylib.Rectangle.t -> float -> int -> Raylib.Vector2.t
(** [grid bounds spacing subdivs] Grid control *)

(** {1 Advance controls set } *)

val list_view : Raylib.Rectangle.t -> string -> int -> int -> int * int
(** [list_view bounds text scross_index active] List View control, returns selected list item index, active *)

val list_view_ex :
  Raylib.Rectangle.t -> string list -> int -> int -> int -> int * int * int
(** [list_view_ex bounds text_list focus scroll_index active] List View with extended parameters, returns selected list item index, focus, active  *)

val message_box : Raylib.Rectangle.t -> string -> string -> string -> int
(** [message_box bounds title message buttons] Message Box control, displays a message *)

val text_input_box :
  Raylib.Rectangle.t -> string -> string -> string -> string -> string * int
(** [text_input_box bounds title message buttons text] Text Input Box control, returns text, state *)

val color_picker : Raylib.Rectangle.t -> Raylib.Color.t -> Raylib.Color.t
(** [color_picker bounds color] Color Picker control (multiple color controls) *)

val color_panel : Raylib.Rectangle.t -> Raylib.Color.t -> Raylib.Color.t
(** [color_panel bounds color] Color Panel control *)

val color_bar_alpha : Raylib.Rectangle.t -> float -> float
(** [color_bar_alpha bounds alpha] Color Bar Alpha control *)

val color_bar_hue : Raylib.Rectangle.t -> float -> float
(** [color_bar_hue bounds value] Color Bar Hue control *)

(** Styles loading functions *)
val load_style : string -> unit
(** [load_style filename] Load style file (.rgs) *)

val load_style_default : unit -> unit
(** [load_style_default ()] Load style default over global style *)
