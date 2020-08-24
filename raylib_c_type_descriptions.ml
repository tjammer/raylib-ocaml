module Descriptions (F : Ctypes.TYPE) = struct
  open Ctypes
  open F

  module Color = struct

    let t : [ `Color ] structure typ = structure "Color"

    let r = field t "r" uint8_t

    let g = field t "g" uint8_t

    let b = field t "b" uint8_t

    let a = field t "a" uint8_t

    let () = seal t
  end
end
