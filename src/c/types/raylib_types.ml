module Descriptions (F : Cstubs.Types.TYPE) = struct
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

  module PixelFormat = struct
    type t =
      | UncompressedGrayscale
      | UncompressedGrayAlpha
      | UncompressedR5G6B5
      | UncompressedR8G8B8
      | UncompressedR5G5B5A1
      | UncompressedR4G4B4A4
      | UncompressedR8G8B8A8
      | UncompressedR32
      | UncompressedR32G32B32
      | UncompressedR32G32B32A32
      | CompressedDxt1Rgb
      | CompressedDxt1Rgba
      | CompressedDxt3Rgba
      | CompressedDxt5Rgba
      | CompressedEtc1Rgb
      | CompressedEtc2Rgb
      | CompressedEtc2EacRgba
      | CompressedPvrtRgb
      | CompressedPvrtRgba
      | CompressedAstc4X4Rgba
      | CompressedAstc8X8Rgba

    let t =
      enum ~typedef:true "PixelFormat"
        [
          (UncompressedGrayscale, constant "UNCOMPRESSED_GRAYSCALE" int64_t);
          (UncompressedGrayAlpha, constant "UNCOMPRESSED_GRAY_ALPHA" int64_t);
          (UncompressedR5G6B5, constant "UNCOMPRESSED_R5G6B5" int64_t);
          (UncompressedR8G8B8, constant "UNCOMPRESSED_R8G8B8" int64_t);
          (UncompressedR5G5B5A1, constant "UNCOMPRESSED_R5G5B5A1" int64_t);
          (UncompressedR4G4B4A4, constant "UNCOMPRESSED_R4G4B4A4" int64_t);
          (UncompressedR8G8B8A8, constant "UNCOMPRESSED_R8G8B8A8" int64_t);
          (UncompressedR32, constant "UNCOMPRESSED_R32" int64_t);
          (UncompressedR32G32B32, constant "UNCOMPRESSED_R32G32B32" int64_t);
          ( UncompressedR32G32B32A32,
            constant "UNCOMPRESSED_R32G32B32A32" int64_t );
          (CompressedDxt1Rgb, constant "COMPRESSED_DXT1_RGB" int64_t);
          (CompressedDxt1Rgba, constant "COMPRESSED_DXT1_RGBA" int64_t);
          (CompressedDxt3Rgba, constant "COMPRESSED_DXT3_RGBA" int64_t);
          (CompressedDxt5Rgba, constant "COMPRESSED_DXT5_RGBA" int64_t);
          (CompressedEtc1Rgb, constant "COMPRESSED_ETC1_RGB" int64_t);
          (CompressedEtc2Rgb, constant "COMPRESSED_ETC2_RGB" int64_t);
          (CompressedEtc2EacRgba, constant "COMPRESSED_ETC2_EAC_RGBA" int64_t);
          (CompressedPvrtRgb, constant "COMPRESSED_PVRT_RGB" int64_t);
          (CompressedPvrtRgba, constant "COMPRESSED_PVRT_RGBA" int64_t);
          (CompressedAstc4X4Rgba, constant "COMPRESSED_ASTC_4x4_RGBA" int64_t);
          (CompressedAstc8X8Rgba, constant "COMPRESSED_ASTC_8x8_RGBA" int64_t);
        ]
  end

  module Image = struct
    let t : [ `Image ] structure typ = structure "Image"

    let data = field t "data" (ptr void)

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" PixelFormat.t

    let () = seal t
  end

  module Texture2D = struct
    let t : [ `Texture2D ] structure typ = structure "Texture2D"

    let id = field t "id" int

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" PixelFormat.t

    let () = seal t
  end

  module RenderTexture2D = struct
    let t : [ `RenderTexture2D ] structure typ = structure "RenderTexture2D"

    let texture = field t "texture" Texture2D.t

    let depth = field t "depth" Texture2D.t

    let depth_texture = field t "depthTexture" bool

    let () = seal t
  end

  module NPatchType = struct
    type t = NinePatch | ThreePatchVertical | ThreePatchHorizontal

    let t =
      enum ~typedef:true "NPatchType"
        [
          (NinePatch, constant "NPT_9PATCH" int64_t);
          (ThreePatchVertical, constant "NPT_3PATCH_VERTICAL" int64_t);
          (ThreePatchHorizontal, constant "NPT_3PATCH_HORIZONTAL" int64_t);
        ]
  end

  module NPatchInfo = struct
    let t : [ `NPatchInfo ] structure typ = structure "NPatchInfo"

    let source_rec = field t "sourceRec" Rectangle.t

    let left = field t "left" int

    let top = field t "top" int

    let right = field t "right" int

    let bottom = field t "bottom" int

    let typ = field t "type" NPatchType.t

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

  module CameraType = struct
    type t = Perspective | Orthographic

    let t =
      enum ~typedef:true "CameraType"
        [
          (Perspective, constant "CAMERA_PERSPECTIVE" int64_t);
          (Orthographic, constant "CAMERA_ORTHOGRAPHIC" int64_t);
        ]
  end

  module Camera3D = struct
    let t : [ `Camera3D ] structure typ = structure "Camera3D"

    let position = field t "position" Vector3.t

    let target = field t "target" Vector3.t

    let up = field t "up" Vector3.t

    let fovy = field t "fovy" float

    let typ = field t "type" CameraType.t

    let () = seal t
  end

  module Camera2D = struct
    let t : [ `Camera2D ] structure typ = structure "Camera2D"

    let offset = field t "offset" Vector2.t

    let target = field t "target" Vector2.t

    let rotation = field t "rotation" float

    let zoom = field t "zoom" float

    let () = seal t
  end

  (* we are getting lazy. will update fields once/if we need them *)
  module Mesh = struct
    let t : [ `Mesh ] structure typ = structure "Mesh"

    let () = seal t
  end

  module Shader = struct
    let t : [ `Shader ] structure typ = structure "Shader"

    let () = seal t
  end

  module MaterialMap = struct
    let t : [ `MaterialMap ] structure typ = structure "MaterialMap"

    let () = seal t
  end

  module Material = struct
    let t : [ `Material ] structure typ = structure "Material"

    let () = seal t
  end

  module Transform = struct
    let t : [ `Transform ] structure typ = structure "Transform"

    let () = seal t
  end

  module BoneInfo = struct
    let t : [ `BoneInfo ] structure typ = structure "BoneInfo"

    let () = seal t
  end

  module Model = struct
    let t : [ `Model ] structure typ = structure "Model"

    let () = seal t
  end

  module ModelAnimation = struct
    let t : [ `ModelAnimation ] structure typ = structure "ModelAnimation"

    let () = seal t
  end

  module Ray = struct
    let t : [ `Ray ] structure typ = structure "Ray"

    let position = field t "position" Vector3.t

    let direction = field t "direction" Vector3.t

    let () = seal t
  end

  module RayHitInfo = struct
    let t : [ `RayHitInfo ] structure typ = structure "RayHitInfo"

    let hit = field t "hit" bool

    let distance = field t "distance" float

    let position = field t "position" Vector3.t

    let normal = field t "normal" Vector3.t

    let () = seal t
  end

  module BoundingBox = struct
    let t : [ `BoundingBox ] structure typ = structure "BoundingBox"

    let min = field t "min" Vector3.t

    let max = field t "max" Vector3.t

    let () = seal t
  end

  module Wave = struct
    let t : [ `Wave ] structure typ = structure "Wave"

    let () = seal t
  end

  module AudioStream = struct
    let t : [ `AudioStream ] structure typ = structure "AudioStream"

    let () = seal t
  end

  module Sound = struct
    let t : [ `Sound ] structure typ = structure "Sound"

    let () = seal t
  end

  module Music = struct
    let t : [ `Music ] structure typ = structure "Music"

    let () = seal t
  end

  module ConfigFlag = struct
    let t = uint32_t

    let reserved = constant "FLAG_RESERVED" uint32_t

    let fullscreen = constant "FLAG_FULLSCREEN_MODE" uint32_t

    let resizable = constant "FLAG_WINDOW_RESIZABLE" uint32_t

    let undecorated = constant "FLAG_WINDOW_UNDECORATED" uint32_t

    let transparent = constant "FLAG_WINDOW_TRANSPARENT" uint32_t

    let hidden = constant "FLAG_WINDOW_HIDDEN" uint32_t

    let always_run = constant "FLAG_WINDOW_ALWAYS_RUN" uint32_t

    let msaa_4x_hint = constant "FLAG_MSAA_4X_HINT" uint32_t

    let vsync_hint = constant "FLAG_VSYNC_HINT" uint32_t

    let ( + ) = Unsigned.UInt32.logor
  end
end
