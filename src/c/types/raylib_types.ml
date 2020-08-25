module Descriptions (F : Ctypes.TYPE) = struct
  open Ctypes
  open F

  module Vector2 = struct
    let t : [ `Vector2 ] structure typ = structure "Vector2"

    let x = field t "x" float

    let y = field t "y" float

    let () = seal t
  end

  module Vector3 = struct
    let t : [ `Vector3 ] structure typ = structure "Vector3"

    let x = field t "x" float

    let y = field t "y" float

    let z = field t "z" float

    let () = seal t
  end

  module Vector4 = struct
    let t : [ `Vector4 ] structure typ = structure "Vector4"

    let x = field t "x" float

    let y = field t "y" float

    let z = field t "z" float

    let w = field t "w" float

    let () = seal t
  end

  module Matrix = struct
    let t : [ `Matrix ] structure typ = structure "Matrix"

    let m0 = field t "m0" float

    let m4 = field t "m4" float

    let m8 = field t "m8" float

    let m12 = field t "m12" float

    let m1 = field t "m1" float

    let m5 = field t "m5" float

    let m9 = field t "m9" float

    let m13 = field t "m13" float

    let m2 = field t "m2" float

    let m6 = field t "m6" float

    let m10 = field t "m10" float

    let m14 = field t "m14" float

    let m3 = field t "m3" float

    let m7 = field t "m7" float

    let m11 = field t "m11" float

    let m15 = field t "m15" float

    let () = seal t
  end

  module Color = struct
    let t : [ `Color ] structure typ = structure "Color"

    let r = field t "r" uint8_t

    let g = field t "g" uint8_t

    let b = field t "b" uint8_t

    let a = field t "a" uint8_t

    let () = seal t
  end

  module Rectangle = struct
    let t : [ `Rectangle ] structure typ = structure "Rectangle"

    let x = field t "x" float

    let y = field t "y" float

    let width = field t "width" float

    let height = field t "height" float

    let () = seal t
  end

  module Image = struct
    let t : [ `Image ] structure typ = structure "Image"

    let data = field t "data" (ptr void)

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" int

    let () = seal t
  end

  module Texture2D = struct
    let t : [ `Texture2D ] structure typ = structure "Texture2D"

    let id = field t "id" int

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" int

    let () = seal t
  end

  module RenderTexture2D = struct
    let t : [ `RenderTexture2D ] structure typ = structure "RenderTexture2D"

    let texture = field t "texture" Texture2D.t

    let depth = field t "depth" Texture2D.t

    let depth_texture = field t "depthTexture" bool

    let () = seal t
  end

  module NPatchInfo = struct
    let t : [ `NPatchInfo ] structure typ = structure "NPatchInfo"

    let source_rec = field t "sourceRec" Rectangle.t

    let left = field t "left" int

    let top = field t "top" int

    let right = field t "right" int

    let bottom = field t "bottom" int

    let typ = field t "type" int

    let () = seal t
  end

  module CharInfo = struct
    let t : [ `CharInfo ] structure typ = structure "CharInfo"

    let value = field t "value" int

    let offset_x = field t "offsetX" int

    let offset_y = field t "offsetY" int

    let advance_x = field t "advanceX" int

    let image = field t "image" Image.t

    let () = seal t
  end

  module Font = struct
    let t : [ `Font ] structure typ = structure "Font"

    let base_size = field t "baseSize" int

    let chars_count = field t "charsCount" int

    let texture = field t "texture" Texture2D.t

    let recs = field t "recs" (ptr Rectangle.t)

    let chars = field t "chars" (ptr CharInfo.t)

    let () = seal t
  end

end
