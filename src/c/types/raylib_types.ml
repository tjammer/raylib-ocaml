module Descriptions (F : Cstubs.Types.TYPE) = struct
  open Ctypes
  open F

  module Vector2 = struct
    type t = [ `Vector2 ]

    let t : t structure typ = structure "Vector2"

    let x = field t "x" float

    let y = field t "y" float

    let () = seal t
  end

  module Vector3 = struct
    type t = [ `Vector3 ]

    let t : t structure typ = structure "Vector3"

    let x = field t "x" float

    let y = field t "y" float

    let z = field t "z" float

    let () = seal t
  end

  module Vector4 = struct
    type t = [ `Vector4 ]

    let t : t structure typ = structure "Vector4"

    let x = field t "x" float

    let y = field t "y" float

    let z = field t "z" float

    let w = field t "w" float

    let () = seal t
  end

  module Quaternion = Vector4

  module Matrix = struct
    type t = [ `Matrix ]

    let t : t structure typ = structure "Matrix"

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
    type t = [ `Color ]

    let t : t structure typ = structure "Color"

    let r = field t "r" uint8_t

    let g = field t "g" uint8_t

    let b = field t "b" uint8_t

    let a = field t "a" uint8_t

    let () = seal t
  end

  module Rectangle = struct
    type t = [ `Rectangle ]

    let t : t structure typ = structure "Rectangle"

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
    type t = [ `Image ]

    let t : t structure typ = structure "Image"

    let data = field t "data" (ptr void)

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" PixelFormat.t

    let () = seal t
  end

  module Texture2D = struct
    type t = [ `Texture2D ]

    let t : t structure typ = structure "Texture2D"

    let id = field t "id" int

    let width = field t "width" int

    let height = field t "height" int

    let mipmaps = field t "mipmaps" int

    let format = field t "format" PixelFormat.t

    let () = seal t
  end

  module RenderTexture2D = struct
    type t = [ `RenderTexture2D ]

    let t : t structure typ = structure "RenderTexture2D"

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
    type t = [ `NPatchInfo ]

    let t : t structure typ = structure "NPatchInfo"

    let source_rec = field t "sourceRec" Rectangle.t

    let left = field t "left" int

    let top = field t "top" int

    let right = field t "right" int

    let bottom = field t "bottom" int

    let typ = field t "type" NPatchType.t

    let () = seal t
  end

  module CharInfo = struct
    type t = [ `CharInfo ]

    let t : t structure typ = structure "CharInfo"

    let value = field t "value" int

    let offset_x = field t "offsetX" int

    let offset_y = field t "offsetY" int

    let advance_x = field t "advanceX" int

    let image = field t "image" Image.t

    let () = seal t
  end

  module Font = struct
    type t = [ `Font ]

    let t : t structure typ = structure "Font"

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
    type t = [ `Camera3D ]

    let t : t structure typ = structure "Camera3D"

    let position = field t "position" Vector3.t

    let target = field t "target" Vector3.t

    let up = field t "up" Vector3.t

    let fovy = field t "fovy" float

    let typ = field t "type" CameraType.t

    let () = seal t
  end

  module Camera2D = struct
    type t = [ `Camera2D ]

    let t : t structure typ = structure "Camera2D"

    let offset = field t "offset" Vector2.t

    let target = field t "target" Vector2.t

    let rotation = field t "rotation" float

    let zoom = field t "zoom" float

    let () = seal t
  end

  (* we are getting lazy. will update fields once/if we need them *)
  module Mesh = struct
    type t = [ `Mesh ]

    let t : t structure typ = structure "Mesh"

    let () = seal t
  end

  module Shader = struct
    type t = [ `Shader ]

    let t : t structure typ = structure "Shader"

    let () = seal t
  end

  module MaterialMapType = struct
    type t =
      | Albedo
      | Metalness
      | Normal
      | Roughness
      | Occlusion
      | Emission
      | Height
      | Cubemap
      | Irradiance
      | Prefilter
      | Brdf

    let t =
      enum ~typedef:true "MaterialMapType"
        [
          (Albedo, constant "MAP_ALBEDO" int64_t);
          (Metalness, constant "MAP_METALNESS" int64_t);
          (Normal, constant "MAP_NORMAL" int64_t);
          (Roughness, constant "MAP_ROUGHNESS" int64_t);
          (Occlusion, constant "MAP_OCCLUSION" int64_t);
          (Emission, constant "MAP_EMISSION" int64_t);
          (Height, constant "MAP_HEIGHT" int64_t);
          (Cubemap, constant "MAP_CUBEMAP" int64_t);
          (Irradiance, constant "MAP_IRRADIANCE" int64_t);
          (Prefilter, constant "MAP_PREFILTER" int64_t);
          (Brdf, constant "MAP_BRDF" int64_t);
        ]

    module AsInt = struct
      let albedo = constant "MAP_ALBEDO" int

      let metalness = constant "MAP_METALNESS" int

      let normal = constant "MAP_NORMAL" int

      let roughness = constant "MAP_ROUGHNESS" int

      let occlusion = constant "MAP_OCCLUSION" int

      let emission = constant "MAP_EMISSION" int

      let height = constant "MAP_HEIGHT" int

      let cubemap = constant "MAP_CUBEMAP" int

      let irradiance = constant "MAP_IRRADIANCE" int

      let prefilter = constant "MAP_PREFILTER" int

      let brdf = constant "MAP_BRDF" int
    end
  end

  module MaterialMap = struct
    type t = [ `MaterialMap ]

    let t : t structure typ = structure "MaterialMap"

    let texture = field t "texture" Texture2D.t

    let color = field t "color" Color.t

    let value = field t "value" float

    let () = seal t
  end

  module Material = struct
    type t = [ `Material ]

    let t : t structure typ = structure "Material"

    let shader = field t "shader" Shader.t

    let maps = field t "maps" (ptr MaterialMap.t)

    let params = field t "params" (ptr float)

    let () = seal t
  end

  module Transform = struct
    type t = [ `Transform ]

    let t : t structure typ = structure "Transform"

    let translation = field t "translation" Vector3.t

    let rotation = field t "rotation" Quaternion.t

    let scale = field t "scale" Vector3.t

    let () = seal t
  end

  module BoneInfo = struct
    type t = [ `BoneInfo ]

    let t : t structure typ = structure "BoneInfo"

    let () = seal t
  end

  module Model = struct
    type t = [ `Model ]

    let t : t structure typ = structure "Model"

    let transform = field t "transform" Matrix.t

    let mesh_count = field t "meshCount" int

    let meshes = field t "meshes" (ptr Mesh.t)

    let material_count = field t "materialCount" int

    let materials = field t "materials" (ptr Material.t)

    let bone_count = field t "boneCount" int

    let bones = field t "bones" (ptr BoneInfo.t)

    let bind_pose = field t "bindPose" (ptr Transform.t)

    let () = seal t
  end

  module ModelAnimation = struct
    type t = [ `ModelAnimation ]

    let t : t structure typ = structure "ModelAnimation"

    let bone_count = field t "boneCount" int

    let bones = field t "bones" (ptr BoneInfo.t)

    let frame_count = field t "frameCount" int

    let frame_poses = field t "framePoses" (ptr (ptr Transform.t))

    let () = seal t
  end

  module Ray = struct
    type t = [ `Ray ]

    let t : t structure typ = structure "Ray"

    let position = field t "position" Vector3.t

    let direction = field t "direction" Vector3.t

    let () = seal t
  end

  module RayHitInfo = struct
    type t = [ `RayHitInfo ]

    let t : t structure typ = structure "RayHitInfo"

    let hit = field t "hit" bool

    let distance = field t "distance" float

    let position = field t "position" Vector3.t

    let normal = field t "normal" Vector3.t

    let () = seal t
  end

  module BoundingBox = struct
    type t = [ `BoundingBox ]

    let t : t structure typ = structure "BoundingBox"

    let min = field t "min" Vector3.t

    let max = field t "max" Vector3.t

    let () = seal t
  end

  module Wave = struct
    type t = [ `Wave ]

    let t : t structure typ = structure "Wave"

    let () = seal t
  end

  module AudioStream = struct
    type t = [ `AudioStream ]

    let t : t structure typ = structure "AudioStream"

    let () = seal t
  end

  module Sound = struct
    type t = [ `Sound ]

    let t : t structure typ = structure "Sound"

    let () = seal t
  end

  module Music = struct
    type t = [ `Music ]

    let t : t structure typ = structure "Music"

    let () = seal t
  end

  module ConfigFlag = struct
    let t = uint32_t

    let reserved = constant "FLAG_RESERVED" t

    let fullscreen = constant "FLAG_FULLSCREEN_MODE" t

    let resizable = constant "FLAG_WINDOW_RESIZABLE" t

    let undecorated = constant "FLAG_WINDOW_UNDECORATED" t

    let transparent = constant "FLAG_WINDOW_TRANSPARENT" t

    let hidden = constant "FLAG_WINDOW_HIDDEN" t

    let always_run = constant "FLAG_WINDOW_ALWAYS_RUN" t

    let msaa_4x_hint = constant "FLAG_MSAA_4X_HINT" t

    let vsync_hint = constant "FLAG_VSYNC_HINT" t

    let ( + ) = Unsigned.UInt32.logor
  end
end
