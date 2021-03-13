let%c () = header "#include <raygui.h>"

module ControlState = struct
  type%c t =
    | Normal [@cname "GUI_STATE_NORMAL"]
    | Focused [@cname "GUI_STATE_FOCUSED"]
    | Pressed [@cname "GUI_STATE_PRESSED"]
    | Disabled [@cname "GUI_STATE_DISABLED"]
  [@@cname "GuiControlState"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextAlignment = struct
  type%c t =
    | Left [@cname "GUI_TEXT_ALIGN_LEFT"]
    | Center [@cname "GUI_TEXT_ALIGN_CENTER"]
    | Right [@cname "GUI_TEXT_ALIGN_RIGHT"]
  [@@cname "GuiTextAlignment"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Control = struct
  type%c t =
    | Default [@cname "DEFAULT"]
    | Label [@cname "LABEL"]
    | Button [@cname "BUTTON"]
    | Toggle [@cname "TOGGLE"]
    | Slider [@cname "SLIDER"]
    | Progressbar [@cname "PROGRESSBAR"]
    | Checkbox [@cname "CHECKBOX"]
    | Combobox [@cname "COMBOBOX"]
    | Dropdownbox [@cname "DROPDOWNBOX"]
    | Textbox [@cname "TEXTBOX"]
    | Valuebox [@cname "VALUEBOX"]
    | Spinner [@cname "SPINNER"]
    | Listview [@cname "LISTVIEW"]
    | Colorpicker [@cname "COLORPICKER"]
    | Scrollbar [@cname "SCROLLBAR"]
    | Statusbar [@cname "STATUSBAR"]
  [@@cname "GuiControl"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ControlProperty = struct
  type%c t =
    | Border_color_normal [@cname "BORDER_COLOR_NORMAL"]
    | Base_color_normal [@cname "BASE_COLOR_NORMAL"]
    | Text_color_normal [@cname "TEXT_COLOR_NORMAL"]
    | Border_color_focused [@cname "BORDER_COLOR_FOCUSED"]
    | Base_color_focused [@cname "BASE_COLOR_FOCUSED"]
    | Text_color_focused [@cname "TEXT_COLOR_FOCUSED"]
    | Border_color_pressed [@cname "BORDER_COLOR_PRESSED"]
    | Base_color_pressed [@cname "BASE_COLOR_PRESSED"]
    | Text_color_pressed [@cname "TEXT_COLOR_PRESSED"]
    | Border_color_disabled [@cname "BORDER_COLOR_DISABLED"]
    | Base_color_disabled [@cname "BASE_COLOR_DISABLED"]
    | Text_color_disabled [@cname "TEXT_COLOR_DISABLED"]
    | Border_width [@cname "BORDER_WIDTH"]
    | Text_padding [@cname "TEXT_PADDING"]
    | Text_alignment [@cname "TEXT_ALIGNMENT"]
    | Reserved [@cname "RESERVED"]
  [@@cname "GuiControlProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module DefaultProperty = struct
  type%c t =
    | Text_size [@cname "TEXT_SIZE"]
    | Text_spacing [@cname "TEXT_SPACING"]
    | Line_color [@cname "LINE_COLOR"]
    | Background_color [@cname "BACKGROUND_COLOR"]
  [@@cname "GuiDefaultProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ToggleProperty = struct
  type%c t = Padding [@cname "GROUP_PADDING"]
  [@@cname "GuiToggleProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module SliderProperty = struct
  type%c t = Width [@cname "SLIDER_WIDTH"] | Padding [@cname "SLIDER_PADDING"]
  [@@cname "GuiSliderProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ProgressBarProperty = struct
  type%c t = Padding [@cname "PROGRESS_PADDING"]
  [@@cname "GuiProgressBarProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CheckBoxProperty = struct
  type%c t = Padding [@cname "CHECK_PADDING"]
  [@@cname "GuiCheckBoxProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ComboBoxProperty = struct
  type%c t =
    | Width [@cname "COMBO_BUTTON_WIDTH"]
    | Padding [@cname "COMBO_BUTTON_PADDING"]
  [@@cname "GuiComboBoxProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module DropdownBoxProperty = struct
  type%c t =
    | Arrow_padding [@cname "ARROW_PADDING"]
    | Dropdown_items_padding [@cname "DROPDOWN_ITEMS_PADDING"]
  [@@cname "GuiDropdownBoxProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextBoxProperty = struct
  type%c t =
    | Text_inner_padding [@cname "TEXT_INNER_PADDING"]
    | Text_lines_padding [@cname "TEXT_LINES_PADDING"]
    | Color_selected_fg [@cname "COLOR_SELECTED_FG"]
    | Color_selected_bg [@cname "COLOR_SELECTED_BG"]
  [@@cname "GuiTextBoxProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module SpinnerProperty = struct
  type%c t =
    | Width [@cname "SPIN_BUTTON_WIDTH"]
    | Padding [@cname "SPIN_BUTTON_PADDING"]
  [@@cname "GuiSpinnerProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ScrollBarProperty = struct
  type%c t =
    | Arrows_size [@cname "ARROWS_SIZE"]
    | Arrows_visible [@cname "ARROWS_VISIBLE"]
    | Scroll_slider_padding [@cname "SCROLL_SLIDER_PADDING"]
    | Scroll_slider_size [@cname "SCROLL_SLIDER_SIZE"]
    | Scroll_padding [@cname "SCROLL_PADDING"]
    | Scroll_speed [@cname "SCROLL_SPEED"]
  [@@cname "GuiScrollBarProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ScrollBarSide = struct
  type%c t =
    | Left [@cname "SCROLLBAR_LEFT_SIDE"]
    | Right [@cname "SCROLLBAR_RIGHT_SIDE"]
  [@@cname "GuiScrollBarSide"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ListViewProperty = struct
  type%c t =
    | List_items_height [@cname "LIST_ITEMS_HEIGHT"]
    | List_items_padding [@cname "LIST_ITEMS_PADDING"]
    | Scrollbar_width [@cname "SCROLLBAR_WIDTH"]
    | Scrollbar_side [@cname "SCROLLBAR_SIDE"]
  [@@cname "GuiListViewProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ColorPickerProperty = struct
  type%c t =
    | Color_selector_size [@cname "COLOR_SELECTOR_SIZE"]
    | Huebar_width [@cname "HUEBAR_WIDTH"]
    | Huebar_padding [@cname "HUEBAR_PADDING"]
    | Huebar_selector_height [@cname "HUEBAR_SELECTOR_HEIGHT"]
    | Huebar_selector_overflow [@cname "HUEBAR_SELECTOR_OVERFLOW"]
  [@@cname "GuiColorPickerProperty"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

(* not a constant but we're not gonna create a file for 1 type *)
module StyleProp = struct
  type%c t = {
    control_id : ushort; [@cname "controlId"]
    property_id : ushort; [@cname "propertyId"]
    property_value : int; [@cname "propertyValue"]
  }
  [@@cname "GuiStyleProp"]
end
