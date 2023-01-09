module Types = Raylib_fixed_types
module Constants = Raygui_fixed_types

module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  (* State modification functions *)
  (*  Enable gui controls (global state) *)
  let enable = foreign "GuiEnable" (void @-> returning void)

  (*  Disable gui controls (global state) *)
  let disable = foreign "GuiDisable" (void @-> returning void)

  (*  Lock gui controls (global state) *)
  let lock = foreign "GuiLock" (void @-> returning void)

  (*  Unlock gui controls (global state) *)
  let unlock = foreign "GuiUnlock" (void @-> returning void)

  (*  Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f *)
  let fade = foreign "GuiFade" (float @-> returning void)

  (*  Set gui state (global state) *)
  let set_state =
    foreign "GuiSetState" (Constants.ControlState.t @-> returning void)

  (*  Get gui state (global state) *)
  let get_state =
    foreign "GuiGetState" (void @-> returning Constants.ControlState.t)

  (* Font set/get functions *)
  (*  Set gui custom font (global state) *)
  let _set_font = foreign "GuiSetFont" (Types.Font.t @-> returning void)

  (*  Get gui custom font (global state) *)
  let _get_font = foreign "GuiGetFont" (void @-> returning Types.Font.t)

  (* Style set/get functions *)
  (*  Set one style property *)
  let _set_style =
    foreign "GuiSetStyle"
      (Constants.Wrapped_Control.t @-> int @-> int @-> returning void)

  (*  Get one style property *)
  let _get_style =
    foreign "GuiGetStyle" (Constants.Wrapped_Control.t @-> int @-> returning int)

  (* Container/separator controls, useful for controls organization *)
  (*  Window Box control, shows a window that can be closed *)
  let _window_box =
    foreign "GuiWindowBox" (Types.Rectangle.t @-> string @-> returning bool)

  (*  Group Box control with text name *)
  let _group_box =
    foreign "GuiGroupBox" (Types.Rectangle.t @-> string @-> returning void)

  (*  Line separator control, could contain text *)
  let _line = foreign "GuiLine" (Types.Rectangle.t @-> string @-> returning void)

  (*  Panel control, useful to group controls *)
  let _panel = foreign "GuiPanel" (Types.Rectangle.t @-> returning void)

  (*  Scroll Panel control *)
  let _scroll_panel =
    foreign "GuiScrollPanel"
      (Types.Rectangle.t @-> Types.Rectangle.t @-> ptr Types.Vector2.t
      @-> returning Types.Rectangle.t)

  (* Basic controls set *)
  (*  Label control, shows text *)
  let _label =
    foreign "GuiLabel" (Types.Rectangle.t @-> string @-> returning void)

  (*  Button control, returns true when clicked *)
  let _button =
    foreign "GuiButton" (Types.Rectangle.t @-> string @-> returning bool)

  (*  Label button control, show true when clicked *)
  let _label_button =
    foreign "GuiLabelButton" (Types.Rectangle.t @-> string @-> returning bool)

  (*  Toggle Button control, returns true when active *)
  let _toggle =
    foreign "GuiToggle"
      (Types.Rectangle.t @-> string @-> bool @-> returning bool)

  (*  Toggle Group control, returns active toggle index *)
  let _toggle_group =
    foreign "GuiToggleGroup"
      (Types.Rectangle.t @-> string @-> int @-> returning int)

  (*  Check Box control, returns true when active *)
  let _check_box =
    foreign "GuiCheckBox"
      (Types.Rectangle.t @-> string @-> bool @-> returning bool)

  (*  Combo Box control, returns selected item index *)
  let _combo_box =
    foreign "GuiComboBox"
      (Types.Rectangle.t @-> string @-> int @-> returning int)

  (*  Dropdown Box control, returns selected item *)
  let _dropdown_box =
    foreign "GuiDropdownBox"
      (Types.Rectangle.t @-> string @-> ptr int @-> bool @-> returning bool)

  (*  Spinner control, returns selected value *)
  let _spinner =
    foreign "GuiSpinner"
      (Types.Rectangle.t @-> string @-> ptr int @-> int @-> int @-> bool
     @-> returning bool)

  (*  Value Box control, updates input text with numbers *)
  let _value_box =
    foreign "GuiValueBox"
      (Types.Rectangle.t @-> string @-> ptr int @-> int @-> int @-> bool
     @-> returning bool)

  (*  Text Box control, updates input text *)
  let _text_box =
    foreign "GuiTextBox"
      (Types.Rectangle.t @-> ptr char @-> int @-> bool @-> returning bool)

  (*  Text Box control with multiple lines *)
  let _text_box_multi =
    foreign "GuiTextBoxMulti"
      (Types.Rectangle.t @-> ptr char @-> int @-> bool @-> returning bool)

  (*  Slider control, returns selected value *)
  let _slider =
    foreign "GuiSlider"
      (Types.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Slider Bar control, returns selected value *)
  let _slider_bar =
    foreign "GuiSliderBar"
      (Types.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Progress Bar control, shows current progress value *)
  let _progress_bar =
    foreign "GuiProgressBar"
      (Types.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Status Bar control, shows info text *)
  let _status_bar =
    foreign "GuiStatusBar" (Types.Rectangle.t @-> string @-> returning void)

  (*  Dummy control for placeholders *)
  let _dummy_rec =
    foreign "GuiDummyRec" (Types.Rectangle.t @-> string @-> returning void)

  (*  Scroll Bar control *)
  let _scroll_bar =
    foreign "GuiScrollBar"
      (Types.Rectangle.t @-> int @-> int @-> int @-> returning int)

  (*  Grid control *)
  let _grid =
    foreign "GuiGrid"
      (Types.Rectangle.t @-> float @-> int @-> returning Types.Vector2.t)

  (* Advance controls set *)
  (*  List View control, returns selected list item index *)
  let _list_view =
    foreign "GuiListView"
      (Types.Rectangle.t @-> string @-> ptr int @-> int @-> returning int)

  (*  List View with extended parameters *)
  let _list_view_ex =
    foreign "GuiListViewEx"
      (Types.Rectangle.t @-> ptr string @-> int @-> ptr int @-> ptr int @-> int
     @-> returning int)

  (*  Message Box control, displays a message *)
  let _message_box =
    foreign "GuiMessageBox"
      (Types.Rectangle.t @-> string @-> string @-> string @-> returning int)

  (*  Text Input Box control, ask for text *)
  let _text_input_box =
    foreign "GuiTextInputBox"
      (Types.Rectangle.t @-> string @-> string @-> string @-> ptr char
     @-> returning int)

  (*  Color Picker control (multiple color controls) *)
  let _color_picker =
    foreign "GuiColorPicker"
      (Types.Rectangle.t @-> Types.Color.t @-> returning Types.Color.t)

  (*  Color Panel control *)
  let _color_panel =
    foreign "GuiColorPanel"
      (Types.Rectangle.t @-> Types.Color.t @-> returning Types.Color.t)

  (*  Color Bar Alpha control *)
  let _color_bar_alpha =
    foreign "GuiColorBarAlpha" (Types.Rectangle.t @-> float @-> returning float)

  (*  Color Bar Hue control *)
  let _color_bar_hue =
    foreign "GuiColorBarHue" (Types.Rectangle.t @-> float @-> returning float)

  (* Styles loading functions *)
  (*  Load style file (.rgs) *)
  let load_style = foreign "GuiLoadStyle" (string @-> returning void)

  (*  Load style default over global style *)
  let load_style_default =
    foreign "GuiLoadStyleDefault" (void @-> returning void)
end
