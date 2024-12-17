module Types (F : Ctypes.TYPE) = struct
  open F

  let typedef = true

  module ControlState = struct
    type t = Normal | Focused | Pressed | Disabled

    let vals =
      [
        (Normal, constant "GUI_STATE_NORMAL" int64_t);
        (Focused, constant "GUI_STATE_FOCUSED" int64_t);
        (Pressed, constant "GUI_STATE_PRESSED" int64_t);
        (Disabled, constant "GUI_STATE_DISABLED" int64_t);
      ]

    let t = enum "GuiControlState" ~typedef vals
  end

  module TextAlignment = struct
    type t = Left | Center | Right

    let vals =
      [
        (Left, constant "GUI_TEXT_ALIGN_LEFT" int64_t);
        (Center, constant "GUI_TEXT_ALIGN_CENTER" int64_t);
        (Right, constant "GUI_TEXT_ALIGN_RIGHT" int64_t);
      ]

    let t = enum "GuiTextAlignment" ~typedef vals
  end

  module Wrapped_Control = struct
    type t =
      | Default
      | Label
      | Button
      | Toggle
      | Slider
      | Progressbar
      | Checkbox
      | Combobox
      | Dropdownbox
      | Textbox
      | Valuebox
      | Spinner
      | Listview
      | Colorpicker
      | Scrollbar
      | Statusbar

    let vals =
      [
        (Default, constant "DEFAULT" int64_t);
        (Label, constant "LABEL" int64_t);
        (Button, constant "BUTTON" int64_t);
        (Toggle, constant "TOGGLE" int64_t);
        (Slider, constant "SLIDER" int64_t);
        (Progressbar, constant "PROGRESSBAR" int64_t);
        (Checkbox, constant "CHECKBOX" int64_t);
        (Combobox, constant "COMBOBOX" int64_t);
        (Dropdownbox, constant "DROPDOWNBOX" int64_t);
        (Textbox, constant "TEXTBOX" int64_t);
        (Valuebox, constant "VALUEBOX" int64_t);
        (Spinner, constant "SPINNER" int64_t);
        (Listview, constant "LISTVIEW" int64_t);
        (Colorpicker, constant "COLORPICKER" int64_t);
        (Scrollbar, constant "SCROLLBAR" int64_t);
        (Statusbar, constant "STATUSBAR" int64_t);
      ]

    let t = enum "GuiControl" ~typedef vals
  end

  module ControlProperty = struct
    type t =
      | Border_color_normal
      | Base_color_normal
      | Text_color_normal
      | Border_color_focused
      | Base_color_focused
      | Text_color_focused
      | Border_color_pressed
      | Base_color_pressed
      | Text_color_pressed
      | Border_color_disabled
      | Base_color_disabled
      | Text_color_disabled
      | Border_width
      | Text_padding
      | Text_alignment
      | Reserved

    let vals =
      [
        (Border_color_normal, constant "BORDER_COLOR_NORMAL" int64_t);
        (Base_color_normal, constant "BASE_COLOR_NORMAL" int64_t);
        (Text_color_normal, constant "TEXT_COLOR_NORMAL" int64_t);
        (Border_color_focused, constant "BORDER_COLOR_FOCUSED" int64_t);
        (Base_color_focused, constant "BASE_COLOR_FOCUSED" int64_t);
        (Text_color_focused, constant "TEXT_COLOR_FOCUSED" int64_t);
        (Border_color_pressed, constant "BORDER_COLOR_PRESSED" int64_t);
        (Base_color_pressed, constant "BASE_COLOR_PRESSED" int64_t);
        (Text_color_pressed, constant "TEXT_COLOR_PRESSED" int64_t);
        (Border_color_disabled, constant "BORDER_COLOR_DISABLED" int64_t);
        (Base_color_disabled, constant "BASE_COLOR_DISABLED" int64_t);
        (Text_color_disabled, constant "TEXT_COLOR_DISABLED" int64_t);
        (Border_width, constant "BORDER_WIDTH" int64_t);
        (Text_padding, constant "TEXT_PADDING" int64_t);
        (Text_alignment, constant "TEXT_ALIGNMENT" int64_t);
        (Reserved, constant "RESERVED" int64_t);
      ]

    let t = enum "GuiControlProperty" ~typedef vals
  end

  module DefaultProperty = struct
    type t = Text_size | Text_spacing | Line_color | Background_color

    let vals =
      [
        (Text_size, constant "TEXT_SIZE" int64_t);
        (Text_spacing, constant "TEXT_SPACING" int64_t);
        (Line_color, constant "LINE_COLOR" int64_t);
        (Background_color, constant "BACKGROUND_COLOR" int64_t);
      ]

    let t = enum "GuiDefaultProperty" ~typedef vals
  end

  module ToggleProperty = struct
    type t = Padding

    let vals = [ (Padding, constant "GROUP_PADDING" int64_t) ]
    let t = enum "GuiToggleProperty" ~typedef vals
  end

  module SliderProperty = struct
    type t = Width | Padding

    let vals =
      [
        (Width, constant "SLIDER_WIDTH" int64_t);
        (Padding, constant "SLIDER_PADDING" int64_t);
      ]

    let t = enum "GuiSliderProperty" ~typedef vals
  end

  module ProgressBarProperty = struct
    type t = Padding

    let vals = [ (Padding, constant "PROGRESS_PADDING" int64_t) ]
    let t = enum "GuiProgressBarProperty" ~typedef vals
  end

  module CheckBoxProperty = struct
    type t = Padding

    let vals = [ (Padding, constant "CHECK_PADDING" int64_t) ]
    let t = enum "GuiCheckBoxProperty" ~typedef vals
  end

  module ComboBoxProperty = struct
    type t = Width | Padding

    let vals =
      [
        (Width, constant "COMBO_BUTTON_WIDTH" int64_t);
        (Padding, constant "COMBO_BUTTON_PADDING" int64_t);
      ]

    let t = enum "GuiComboBoxProperty" ~typedef vals
  end

  module DropdownBoxProperty = struct
    type t = Arrow_padding | Dropdown_items_padding

    let vals =
      [
        (Arrow_padding, constant "ARROW_PADDING" int64_t);
        (Dropdown_items_padding, constant "DROPDOWN_ITEMS_PADDING" int64_t);
      ]

    let t = enum "GuiDropdownBoxProperty" ~typedef vals
  end

  module TextBoxProperty = struct
    type t =
      | Text_inner_padding
      | Text_lines_padding
      | Color_selected_fg
      | Color_selected_bg

    let vals =
      [
        (Text_inner_padding, constant "TEXT_INNER_PADDING" int64_t);
        (Text_lines_padding, constant "TEXT_LINES_PADDING" int64_t);
        (Color_selected_fg, constant "COLOR_SELECTED_FG" int64_t);
        (Color_selected_bg, constant "COLOR_SELECTED_BG" int64_t);
      ]

    let t = enum "GuiTextBoxProperty" ~typedef vals
  end

  module SpinnerProperty = struct
    type t = Width | Padding

    let vals =
      [
        (Width, constant "SPIN_BUTTON_WIDTH" int64_t);
        (Padding, constant "SPIN_BUTTON_PADDING" int64_t);
      ]

    let t = enum "GuiSpinnerProperty" ~typedef vals
  end

  module ScrollBarProperty = struct
    type t =
      | Arrows_size
      | Arrows_visible
      | Scroll_slider_padding
      | Scroll_slider_size
      | Scroll_padding
      | Scroll_speed

    let vals =
      [
        (Arrows_size, constant "ARROWS_SIZE" int64_t);
        (Arrows_visible, constant "ARROWS_VISIBLE" int64_t);
        (Scroll_slider_padding, constant "SCROLL_SLIDER_PADDING" int64_t);
        (Scroll_slider_size, constant "SCROLL_SLIDER_SIZE" int64_t);
        (Scroll_padding, constant "SCROLL_PADDING" int64_t);
        (Scroll_speed, constant "SCROLL_SPEED" int64_t);
      ]

    let t = enum "GuiScrollBarProperty" ~typedef vals
  end

  module ScrollBarSide = struct
    type t = Left | Right

    let vals =
      [
        (Left, constant "SCROLLBAR_LEFT_SIDE" int64_t);
        (Right, constant "SCROLLBAR_RIGHT_SIDE" int64_t);
      ]

    let t = enum "GuiScrollBarSide" ~typedef vals
  end

  module ListViewProperty = struct
    type t =
      | List_items_height
      | List_items_padding
      | Scrollbar_width
      | Scrollbar_side

    let vals =
      [
        (List_items_height, constant "LIST_ITEMS_HEIGHT" int64_t);
        (List_items_padding, constant "LIST_ITEMS_PADDING" int64_t);
        (Scrollbar_width, constant "SCROLLBAR_WIDTH" int64_t);
        (Scrollbar_side, constant "SCROLLBAR_SIDE" int64_t);
      ]

    let t = enum "GuiListViewProperty" ~typedef vals
  end

  module ColorPickerProperty = struct
    type t =
      | Color_selector_size
      | Huebar_width
      | Huebar_padding
      | Huebar_selector_height
      | Huebar_selector_overflow

    let vals =
      [
        (Color_selector_size, constant "COLOR_SELECTOR_SIZE" int64_t);
        (Huebar_width, constant "HUEBAR_WIDTH" int64_t);
        (Huebar_padding, constant "HUEBAR_PADDING" int64_t);
        (Huebar_selector_height, constant "HUEBAR_SELECTOR_HEIGHT" int64_t);
        (Huebar_selector_overflow, constant "HUEBAR_SELECTOR_OVERFLOW" int64_t);
      ]

    let t = enum "GuiColorPickerProperty" ~typedef vals
  end

  module StyleProp = struct
    type t

    let t : t Ctypes.structure typ = structure "GuiStyleProp"
    let control_id = field t "controlId" ushort
    let property_id = field t "propertyId" ushort
    let property_value = field t "propertyValue" int
    let () = seal t
  end
end
