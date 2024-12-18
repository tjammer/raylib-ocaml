module Types = Raylib_types.Types (Raylib_c_generated_types)
open Types

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

module ConfigFlags = struct
  include ConfigFlags

  let t_bitmask = build_enum_bitmask "ConfigFlags" vals
  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TraceLogLevel = struct
  include TraceLogLevel

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Key = struct
  include Key

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseButton = struct
  include MouseButton

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseCursor = struct
  include MouseCursor

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadButton = struct
  include GamepadButton

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadAxis = struct
  include GamepadAxis

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MaterialMapIndex = struct
  include MaterialMapIndex

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderLocationIndex = struct
  include ShaderLocationIndex

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderUniformDataType = struct
  include ShaderUniformDataType

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderAttributeDataType = struct
  include ShaderAttributeDataType

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module PixelFormat = struct
  include PixelFormat

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureFilter = struct
  include TextureFilter

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureWrap = struct
  include TextureWrap

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CubemapLayout = struct
  include CubemapLayout

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module FontType = struct
  include FontType

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module BlendMode = struct
  include BlendMode

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Gesture = struct
  include Gesture

  let t_bitmask = build_enum_bitmask "Gesture" vals
  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraMode = struct
  include CameraMode

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraProjection = struct
  include CameraProjection

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module NPatchLayout = struct
  include NPatchLayout

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Vector2 = Vector2
module Vector3 = Vector3
module Vector4 = Vector4
module Matrix = Matrix
module Color = Color
module Rectangle = Rectangle
module Image = Image
module Texture = Texture
module RenderTexture = RenderTexture
module NPatchInfo = NPatchInfo
module GlyphInfo = GlyphInfo
module Font = Font
module Camera3D = Camera3D
module Camera2D = Camera2D
module Mesh = Mesh
module Shader = Shader
module MaterialMap = MaterialMap
module Material = Material
module Transform = Transform
module BoneInfo = BoneInfo
module Model = Model
module ModelAnimation = ModelAnimation
module Ray = Ray
module RayCollision = RayCollision
module BoundingBox = BoundingBox
module VrDeviceInfo = VrDeviceInfo
module VrStereoConfig = VrStereoConfig
module FilePathList = FilePathList
module AutomationEvent = AutomationEvent
module AutomationEventList = AutomationEventList

let max_material_maps = max_material_maps
let max_shader_locations = max_shader_locations
