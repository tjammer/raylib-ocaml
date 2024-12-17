open Raygui_types_generated

module ControlState = struct
  include ControlState

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextAlignment = struct
  include TextAlignment

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Wrapped_Control = struct
  include Wrapped_Control

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ControlProperty = struct
  include ControlProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module DefaultProperty = struct
  include DefaultProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ToggleProperty = struct
  include ToggleProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module SliderProperty = struct
  include SliderProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ProgressBarProperty = struct
  include ProgressBarProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CheckBoxProperty = struct
  include CheckBoxProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ComboBoxProperty = struct
  include ComboBoxProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module DropdownBoxProperty = struct
  include DropdownBoxProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextBoxProperty = struct
  include TextBoxProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module SpinnerProperty = struct
  include SpinnerProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ScrollBarProperty = struct
  include ScrollBarProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ScrollBarSide = struct
  include ScrollBarSide

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ListViewProperty = struct
  include ListViewProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ColorPickerProperty = struct
  include ColorPickerProperty

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module StyleProp = StyleProp
