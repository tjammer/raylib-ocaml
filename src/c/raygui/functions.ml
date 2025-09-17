module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  module Constants = Fixed_types

  (* State modification functions *)
  (*  Enable gui controls (global state) *)
  let enable = foreign "GuiEnable" (void @-> returning void)

  (*  Disable gui controls (global state) *)
  let disable = foreign "GuiDisable" (void @-> returning void)

  (*  Lock gui controls (global state) *)
  let lock = foreign "GuiLock" (void @-> returning void)

  (*  Unlock gui controls (global state) *)
  let unlock = foreign "GuiUnlock" (void @-> returning void)

  (*  Get gui is locked (global state) *)
  let is_locked = foreign "GuiIsLocked" (void @-> returning bool)

  (*  Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f *)
  let fade = foreign "GuiFade" (float @-> returning void)

  (*  Set gui state (global state) *)
  let set_state =
    foreign "GuiSetState" (Constants.State.t @-> returning void)

  (*  Get gui state (global state) *)
  let get_state =
    foreign "GuiGetState" (void @-> returning Constants.State.t)

  (* Font set/get functions *)
  (*  Set gui custom font (global state) *)
  let _set_font = foreign "GuiSetFont" (Raylib.Font.t @-> returning void)

  (*  Get gui custom font (global state) *)
  let _get_font = foreign "GuiGetFont" (void @-> returning Raylib.Font.t)

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
    foreign "GuiWindowBox" (Raylib.Rectangle.t @-> string @-> returning bool)

  (*  Group Box control with text name *)
  let _group_box =
    foreign "GuiGroupBox" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Line separator control, could contain text *)
  let _line =
    foreign "GuiLine" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Panel control, useful to group controls *)
  let _panel = foreign "GuiPanel" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Tab bar control *)
  let _tab_bar = foreign "GuiTabBar" (Raylib.Rectangle.t @-> ptr string @-> int @-> ptr int @-> returning int)

  (*  Scroll Panel control *)
  let _scroll_panel =
    foreign "GuiScrollPanel"
      (Raylib.Rectangle.t @-> string @-> Raylib.Rectangle.t @-> ptr Raylib.Vector2.t
      @-> returning Raylib.Rectangle.t)

  (* Basic controls set *)
  (*  Label control, shows text *)
  let _label =
    foreign "GuiLabel" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Button control, returns true when clicked *)
  let _button =
    foreign "GuiButton" (Raylib.Rectangle.t @-> string @-> returning bool)

  (*  Label button control, show true when clicked *)
  let _label_button =
    foreign "GuiLabelButton" (Raylib.Rectangle.t @-> string @-> returning bool)

  (*  Toggle Button control, returns true when active *)
  let _toggle =
    foreign "GuiToggle"
      (Raylib.Rectangle.t @-> string @-> bool @-> returning bool)

  (*  Toggle Group control, returns active toggle index *)
  let _toggle_group =
    foreign "GuiToggleGroup"
      (Raylib.Rectangle.t @-> string @-> int @-> returning int)

  (*  Check Box control, returns true when active *)
  let _check_box =
    foreign "GuiCheckBox"
      (Raylib.Rectangle.t @-> string @-> bool @-> returning bool)

  (*  Combo Box control, returns selected item index *)
  let _combo_box =
    foreign "GuiComboBox"
      (Raylib.Rectangle.t @-> string @-> int @-> returning int)

  (*  Dropdown Box control, returns selected item *)
  let _dropdown_box =
    foreign "GuiDropdownBox"
      (Raylib.Rectangle.t @-> string @-> ptr int @-> bool @-> returning bool)

  (*  Spinner control, returns selected value *)
  let _spinner =
    foreign "GuiSpinner"
      (Raylib.Rectangle.t @-> string @-> ptr int @-> int @-> int @-> bool
     @-> returning bool)

  (*  Value Box control, updates input text with numbers *)
  let _value_box =
    foreign "GuiValueBox"
      (Raylib.Rectangle.t @-> string @-> ptr int @-> int @-> int @-> bool
     @-> returning bool)

  (*  Text Box control, updates input text *)
  let _text_box =
    foreign "GuiTextBox"
      (Raylib.Rectangle.t @-> ptr char @-> int @-> bool @-> returning bool)

  (*  Slider control, returns selected value *)
  let _slider =
    foreign "GuiSlider"
      (Raylib.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Slider Bar control, returns selected value *)
  let _slider_bar =
    foreign "GuiSliderBar"
      (Raylib.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Progress Bar control, shows current progress value *)
  let _progress_bar =
    foreign "GuiProgressBar"
      (Raylib.Rectangle.t @-> string @-> string @-> float @-> float @-> float
     @-> returning float)

  (*  Status Bar control, shows info text *)
  let _status_bar =
    foreign "GuiStatusBar" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Dummy control for placeholders *)
  let _dummy_rec =
    foreign "GuiDummyRec" (Raylib.Rectangle.t @-> string @-> returning void)

  (*  Scroll Bar control *)
  let _scroll_bar =
    foreign "GuiScrollBar"
      (Raylib.Rectangle.t @-> int @-> int @-> int @-> returning int)

  (*  Grid control *)
  let _grid =
    foreign "GuiGrid"
      (Raylib.Rectangle.t @-> string @-> float @-> int @-> returning Raylib.Vector2.t)

  (* Advance controls set *)
  (*  List View control, returns selected list item index *)
  let _list_view =
    foreign "GuiListView"
      (Raylib.Rectangle.t @-> string @-> ptr int @-> int @-> returning int)

  (*  List View with extended parameters *)
  let _list_view_ex =
    foreign "GuiListViewEx"
      (Raylib.Rectangle.t @-> ptr string @-> int @-> ptr int @-> ptr int @-> int
     @-> returning int)

  (*  Message Box control, displays a message *)
  let _message_box =
    foreign "GuiMessageBox"
      (Raylib.Rectangle.t @-> string @-> string @-> string @-> returning int)

  (*  Text Input Box control, ask for text *)
  let _text_input_box =
    foreign "GuiTextInputBox"
      (Raylib.Rectangle.t @-> string @-> string @-> string @-> ptr char @-> int @-> ptr int
     @-> returning int)

  (*  Color Picker control (multiple color controls) *)
  let _color_picker =
    foreign "GuiColorPicker"
      (Raylib.Rectangle.t @-> string @-> Raylib.Color.t @-> returning Raylib.Color.t)

  (*  Color Panel control *)
  let _color_panel =
    foreign "GuiColorPanel"
      (Raylib.Rectangle.t @-> string @-> Raylib.Color.t @-> returning Raylib.Color.t)

  (*  Color Bar Alpha control *)
  let _color_bar_alpha =
    foreign "GuiColorBarAlpha" (Raylib.Rectangle.t @-> string @-> float @-> returning float)

  (*  Color Bar Hue control *)
  let _color_bar_hue =
    foreign "GuiColorBarHue" (Raylib.Rectangle.t @-> string @-> float @-> returning float)

  (* Styles loading functions *)
  (*  Load style file (.rgs) *)
  let load_style = foreign "GuiLoadStyle" (string @-> returning void)

  (*  Load style default over global style *)
  let load_style_default =
    foreign "GuiLoadStyleDefault" (void @-> returning void)

  (* Tooltips management functions *)
  (*  Enable tooltip (global state) *)
  let enable_tooltip = foreign "GuiEnableTooltip" (void @-> returning void)

  (*  Disable tooltip (global state) *)
  let disable_tooltip = foreign "GuiDisableTooltip" (void @-> returning void)

  (*  Set tooltip (global state) *)
  let set_tooltip = foreign "GuiSetTooltip" (string @-> returning void)

  (* Icons functionality *)
  let icon_text = foreign "GuiIconText" (int @-> string @-> returning string)

  (* Set icon scale (global state) *)
  let set_icon_scale = foreign "GuiSetIconScale" (int @-> returning void)

(*  let _get_icons = foreign "GuiGetIcons" (void @-> returning (ptr uint)) *)

(*  let _load_icons = foreign "GuiLoadIcons" (string @-> bool @-> returning (ptr @@ ptr char)) *)

  let _draw_icon = foreign "GuiDrawIcon" (int @-> int @-> int @-> int @-> Raylib.Color.t @-> returning void)

end
