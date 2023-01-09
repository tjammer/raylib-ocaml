include Raygui_types.Types (Raygui_c_generated_types)

external identity : 'a -> 'a = "%identity"

let build_enum_bitmask name alist =
  let lor', land', zero, lnot' = Int64.(logor, logand, zero, lognot) in
  let unexpected _ k =
    Printf.ksprintf failwith "Unexpected enum value for %s: %s" name
      (Int64.to_string k)
  in
  let ralist = List.rev alist in
  let write l = List.fold_left (fun ac k -> lor' (List.assoc k alist) ac) zero l
  and read res =
    let rec iter res_orig ac res l =
      match l with
      | [] -> if res = zero then ac else unexpected ac res
      | (a, b) :: tl ->
          if land' b res_orig = b then
            iter res_orig (a :: ac) (land' res (lnot' b)) tl
          else iter res_orig ac res tl
    in
    iter res [] res ralist
  and format_typ k fmt = Format.fprintf fmt "%s%t" name k in
  Ctypes_static.view ~format_typ ~read ~write Ctypes.int64_t

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
