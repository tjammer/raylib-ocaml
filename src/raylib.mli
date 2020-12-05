module ConfigFlag = Raylib_generated_constants.ConfigFlag
module TraceLogType = Raylib_generated_constants.TraceLogType
module Key = Raylib_generated_constants.Key
module AndroidButton = Raylib_generated_constants.AndroidButton
module MouseButton = Raylib_generated_constants.MouseButton
module GamepadNumber = Raylib_generated_constants.GamepadNumber
module GamepadButton = Raylib_generated_constants.GamepadButton
module GamepadAxis = Raylib_generated_constants.GamepadAxis
module ShaderLocationIndex = Raylib_generated_constants.ShaderLocationIndex
module ShaderUniformDataType =
  Raylib_generated_constants.ShaderUniformDataType
module MaterialMapType = Raylib_generated_constants.MaterialMapType
module PixelFormat = Raylib_generated_constants.PixelFormat
module TextureFilterMode = Raylib_generated_constants.TextureFilterMode
module CubemapLayoutType = Raylib_generated_constants.CubemapLayoutType
module TextureWrapMode = Raylib_generated_constants.TextureWrapMode
module FontType = Raylib_generated_constants.FontType
module BlendMode = Raylib_generated_constants.BlendMode
module GestureType = Raylib_generated_constants.GestureType
module CameraMode = Raylib_generated_constants.CameraMode
module CameraType = Raylib_generated_constants.CameraType
module NPatchType = Raylib_generated_constants.NPatchType
val max_material_maps : int
val max_shader_locations : int
module CArray = Ctypes.CArray
val addr :
  ('a, 'b) Ctypes.structured -> ('a, 'b) Ctypes.structured Ctypes.ptr
val ptr_of_int : int -> int Ctypes.ptr
val ptr_of_uint : Unsigned.uint -> Unsigned.uint Ctypes.ptr
val void_ptr_of_int : int -> unit Ctypes.ptr
module Types = Raylib_functions.Types
module Math :
  sig
    val clamp :
      (float ->
       float -> float -> float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val lerp :
      (float ->
       float -> float -> float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    module Vector2 :
      sig
        val zero :
          (unit ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val one :
          (unit ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val add :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val subtract :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val length :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val dot_product :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val distance :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val angle :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val scale :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val multiply_v :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val negate :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val divide :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val divide_v :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val normalize :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val lerp :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           Raylib_math.Types.Vector2.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate :
          (Raylib_math.Types.Vector2.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector2.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
      end
    module Vector3 :
      sig
        val zero :
          (unit ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val one :
          (unit ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val add :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val subtract :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val scale :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val multiply :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val cross_product :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val perpendicular :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val length :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val dot_product :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val distance :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val negate :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val divide :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val divide_v :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val normalize :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val ortho_normalize :
          (Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
           Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
           unit Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val transform :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate_by_quaternion :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val lerp :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val reflect :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val min :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val max :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val barycenter :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
      end
    module Matrix :
      sig
        val determinant :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val trace :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val transpose :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val invert :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val normalize :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val identity :
          (unit ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val add :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val subtract :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val translate :
          (float ->
           float ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate_x_y_z :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate_x :
          (float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate_y :
          (float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val rotate_z :
          (float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val scale :
          (float ->
           float ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val multiply :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val frustum :
          (float ->
           float ->
           float ->
           float ->
           float ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val perspective :
          (float ->
           float ->
           float ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val ortho :
          (float ->
           float ->
           float ->
           float ->
           float ->
           float ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val look_at :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
      end
    module Quaternion :
      sig
        val identity :
          (unit ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val length :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           float Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val normalize :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val invert :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val multiply :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val lerp :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val nlerp :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val slerp :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val from_vector3_to_vector3 :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val from_matrix :
          (Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val to_matrix :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val from_axis_angle :
          (Raylib_math.Types.Vector3.t Ctypes.structure ->
           float ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val to_axis_angle :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
           float Ctypes_static.ptr ->
           unit Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val from_euler :
          (float ->
           float ->
           float ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val to_euler :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Vector3.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
        val transform :
          (Raylib_math.Types.Vector4.t Ctypes.structure ->
           Raylib_math.Types.Matrix.t Ctypes.structure ->
           Raylib_math.Types.Vector4.t Ctypes.structure
           Raylib_c.Raylib_c_generated_math.return)
          Raylib_c.Raylib_c_generated_math.result
      end
  end
module Vector2 :
  sig
    type t = Types.Vector2.t Ctypes.structure
    val t : Types.Vector2.t Ctypes.structure Ctypes.typ
    val create :
      float -> float -> (Types.Vector2.t, [ `Struct ]) Ctypes.structured
    val x : (Types.Vector2.t, [ `Struct ]) Ctypes.structured -> float
    val y : (Types.Vector2.t, [ `Struct ]) Ctypes.structured -> float
    val set_x :
      (Types.Vector2.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_y :
      (Types.Vector2.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val zero :
      (unit ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val one :
      (unit ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val add :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val subtract :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val length :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val dot_product :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val distance :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val angle :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val scale :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val multiply_v :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val negate :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val divide :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val divide_v :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val normalize :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val lerp :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       Raylib_math.Types.Vector2.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate :
      (Raylib_math.Types.Vector2.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector2.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
  end
module Vector3 :
  sig
    type t = Types.Vector3.t Ctypes.structure
    val t : Types.Vector3.t Ctypes.structure Ctypes.typ
    val create :
      float ->
      float -> float -> (Types.Vector3.t, [ `Struct ]) Ctypes.structured
    val x : (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float
    val y : (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float
    val z : (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float
    val set_x :
      (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_y :
      (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_z :
      (Types.Vector3.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val zero :
      (unit ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val one :
      (unit ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val add :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val subtract :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val scale :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val multiply :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val cross_product :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val perpendicular :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val length :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val dot_product :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val distance :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val negate :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val divide :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val divide_v :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val normalize :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val ortho_normalize :
      (Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
       Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
       unit Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val transform :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate_by_quaternion :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val lerp :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val reflect :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val min :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val max :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val barycenter :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
  end
module Vector4 :
  sig
    type t = Types.Vector4.t Ctypes.structure
    val t : Types.Vector4.t Ctypes.structure Ctypes.typ
    val create :
      float ->
      float ->
      float -> float -> (Types.Vector4.t, [ `Struct ]) Ctypes.structured
    val x : (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float
    val y : (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float
    val z : (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float
    val w : (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float
    val set_x :
      (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_y :
      (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_z :
      (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_w :
      (Types.Vector4.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val identity :
      (unit ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val length :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val normalize :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val invert :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val multiply :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val lerp :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val nlerp :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val slerp :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val from_vector3_to_vector3 :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val from_matrix :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val to_matrix :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val from_axis_angle :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val to_axis_angle :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
       float Ctypes_static.ptr ->
       unit Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val from_euler :
      (float ->
       float ->
       float ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val to_euler :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val transform :
      (Raylib_math.Types.Vector4.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Vector4.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
  end
module Quaternion = Vector4
module Matrix :
  sig
    type t = Types.Matrix.t Ctypes.structure
    val t : Types.Matrix.t Ctypes.structure Ctypes.typ
    val create :
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float ->
      float -> float -> (Types.Matrix.t, [ `Struct ]) Ctypes.structured
    val determinant :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val trace :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       float Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val transpose :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val invert :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val normalize :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val identity :
      (unit ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val add :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val subtract :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val translate :
      (float ->
       float ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate_x_y_z :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate_x :
      (float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate_y :
      (float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val rotate_z :
      (float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val scale :
      (float ->
       float ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val multiply :
      (Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val frustum :
      (float ->
       float ->
       float ->
       float ->
       float ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val perspective :
      (float ->
       float ->
       float ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val ortho :
      (float ->
       float ->
       float ->
       float ->
       float ->
       float ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
    val look_at :
      (Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Vector3.t Ctypes.structure ->
       Raylib_math.Types.Matrix.t Ctypes.structure
       Raylib_c.Raylib_c_generated_math.return)
      Raylib_c.Raylib_c_generated_math.result
  end
module Color :
  sig
    type t = Types.Color.t Ctypes.structure
    val t : Types.Color.t Ctypes.structure Ctypes.typ
    val create :
      int ->
      int -> int -> int -> (Types.Color.t, [ `Struct ]) Ctypes.structured
    val lightgray : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val gray : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val darkgray : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val yellow : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val gold : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val orange : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val pink : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val red : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val maroon : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val green : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val lime : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val darkgreen : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val skyblue : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val blue : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val darkblue : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val purple : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val violet : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val darkpurple : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val beige : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val brown : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val darkbrown : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val white : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val black : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val blank : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val magenta : (Types.Color.t, [ `Struct ]) Ctypes.structured
    val raywhite : (Types.Color.t, [ `Struct ]) Ctypes.structured
  end
module Rectangle :
  sig
    type t = Types.Rectangle.t Ctypes.structure
    val t : Types.Rectangle.t Ctypes.structure Ctypes.typ
    val create :
      float ->
      float ->
      float -> float -> (Types.Rectangle.t, [ `Struct ]) Ctypes.structured
    val x : (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float
    val y : (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float
    val width : (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float
    val height : (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float
    val set_x :
      (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_y :
      (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_width :
      (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_height :
      (Types.Rectangle.t, [ `Struct ]) Ctypes.structured -> float -> unit
  end
module Image :
  sig
    type t = Types.Image.t Ctypes.structure
    val width : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val height : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val mipmaps : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val format :
      (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> PixelFormat.t
  end
module Texture2D :
  sig
    type t = Types.Texture2D.t Ctypes.structure
    val id :
      (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> Unsigned.uint
    val width : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val height : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val mipmaps : (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> int
    val format :
      (Types.Texture2D.t, [ `Struct ]) Ctypes.structured -> PixelFormat.t
  end
module RenderTexture2D :
  sig
    type t = Types.RenderTexture2D.t Ctypes.structure
    val texture :
      (Types.RenderTexture2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Texture2D.t Ctypes.structure
    val depth :
      (Types.RenderTexture2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Texture2D.t Ctypes.structure
    val depth_texture :
      (Types.RenderTexture2D.t, [ `Struct ]) Ctypes.structured -> bool
  end
module NPatchInfo :
  sig
    type t = Types.NPatchInfo.t Ctypes.structure
    val t : Types.NPatchInfo.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Rectangle.t Ctypes.structure ->
      int ->
      int ->
      int ->
      int ->
      NPatchType.t -> (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured
    val source_rec :
      (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Rectangle.t Ctypes.structure
    val left : (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured -> int
    val top : (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured -> int
    val right : (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured -> int
    val bottom : (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured -> int
    val typ :
      (Types.NPatchInfo.t, [ `Struct ]) Ctypes.structured -> NPatchType.t
  end
module CharInfo :
  sig
    type t = Types.CharInfo.t Ctypes.structure
    val value : (Types.CharInfo.t, [ `Struct ]) Ctypes.structured -> int
    val offset_x : (Types.CharInfo.t, [ `Struct ]) Ctypes.structured -> int
    val offset_y : (Types.CharInfo.t, [ `Struct ]) Ctypes.structured -> int
    val advance_x : (Types.CharInfo.t, [ `Struct ]) Ctypes.structured -> int
    val image :
      (Types.CharInfo.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Image.t Ctypes.structure
  end
module Font :
  sig
    type t = Types.Font.t Ctypes.structure
    val base_size : (Types.Font.t, [ `Struct ]) Ctypes.structured -> int
    val chars_count : (Types.Font.t, [ `Struct ]) Ctypes.structured -> int
    val texture :
      (Types.Font.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Texture2D.t Ctypes.structure
    val recs :
      (Types.Font.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Rectangle.t Ctypes.structure Ctypes_static.ptr
    val chars :
      (Types.Font.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.CharInfo.t Ctypes.structure Ctypes.CArray.t
  end
module Camera3D :
  sig
    type t = Types.Camera3D.t Ctypes.structure
    val t : Types.Camera3D.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      float ->
      CameraType.t -> (Types.Camera3D.t, [ `Struct ]) Ctypes.structured
    val position :
      (Types.Camera3D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val target :
      (Types.Camera3D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val up :
      (Types.Camera3D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val fovy : (Types.Camera3D.t, [ `Struct ]) Ctypes.structured -> float
    val typ :
      (Types.Camera3D.t, [ `Struct ]) Ctypes.structured -> CameraType.t
  end
module Camera = Camera3D
module Camera2D :
  sig
    type t = Types.Camera2D.t Ctypes.structure
    val t : Types.Camera2D.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Vector2.t Ctypes.structure ->
      Raylib_generated_types.Vector2.t Ctypes.structure ->
      float -> float -> (Types.Camera2D.t, [ `Struct ]) Ctypes.structured
    val offset :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector2.t Ctypes.structure
    val target :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector2.t Ctypes.structure
    val rotation : (Types.Camera2D.t, [ `Struct ]) Ctypes.structured -> float
    val zoom : (Types.Camera2D.t, [ `Struct ]) Ctypes.structured -> float
    val set_offset :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector2.t Ctypes.structure -> unit
    val set_target :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector2.t Ctypes.structure -> unit
    val set_rotation :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_zoom :
      (Types.Camera2D.t, [ `Struct ]) Ctypes.structured -> float -> unit
  end
module Mesh = Types.Mesh
module Shader :
  sig
    type t = Types.Shader.t Ctypes.structure
    val t : Types.Shader.t Ctypes.structure Ctypes.typ
  end
module MaterialMap :
  sig
    type t = Types.MaterialMap.t Ctypes.structure
    val t : Types.MaterialMap.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Texture2D.t Ctypes.structure ->
      Raylib_generated_types.Color.t Ctypes.structure ->
      float -> (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured
    val texture :
      (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Texture2D.t Ctypes.structure
    val color :
      (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Color.t Ctypes.structure
    val value : (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured -> float
    val set_texture :
      (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Texture2D.t Ctypes.structure -> unit
    val set_color :
      (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Color.t Ctypes.structure -> unit
    val set_value :
      (Types.MaterialMap.t, [ `Struct ]) Ctypes.structured -> float -> unit
  end
module Material :
  sig
    type t = Types.Material.t Ctypes.structure
    val t : Types.Material.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Shader.t Ctypes.structure ->
      Raylib_generated_types.MaterialMap.t Ctypes.structure Ctypes_static.ptr ->
      float Ctypes_static.ptr ->
      (Types.Material.t, [ `Struct ]) Ctypes.structured
    val shader :
      (Types.Material.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Shader.t Ctypes.structure
    val maps :
      (Types.Material.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.MaterialMap.t Ctypes.structure Ctypes.CArray.t
    val params :
      (Types.Material.t, [ `Struct ]) Ctypes.structured ->
      float Ctypes.CArray.t
    val set_shader :
      (Types.Material.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Shader.t Ctypes.structure -> unit
    val set_maps :
      (Types.Material.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.MaterialMap.t Ctypes.structure Ctypes.CArray.t ->
      unit
  end
module Transform :
  sig
    type t = Types.Transform.t Ctypes.structure
    val t : Types.Transform.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      Raylib_generated_types.Vector4.t Ctypes.structure ->
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      (Types.Transform.t, [ `Struct ]) Ctypes.structured
    val translation :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val rotation :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector4.t Ctypes.structure
    val scale :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val set_translation :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure -> unit
    val set_rotation :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector4.t Ctypes.structure -> unit
    val set_scale :
      (Types.Transform.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure -> unit
  end
module BoneInfo = Types.BoneInfo
module Model :
  sig
    type t = Types.Model.t Ctypes.structure
    val t : Types.Model.t Ctypes.structure Ctypes.typ
    val transform :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Matrix.t Ctypes.structure
    val meshes :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Mesh.t Ctypes.structure Ctypes.CArray.t
    val materials :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Material.t Ctypes.structure Ctypes.CArray.t
    val bones :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.BoneInfo.t Ctypes.structure Ctypes.CArray.t
    val bind_pose :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Transform.t Ctypes.structure Ctypes_static.ptr
    val set_transform :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Matrix.t Ctypes.structure -> unit
    val set_meshes :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Mesh.t Ctypes.structure Ctypes.CArray.t -> unit
    val set_materials :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Material.t Ctypes.structure Ctypes.CArray.t ->
      unit
    val set_bones :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.BoneInfo.t Ctypes.structure Ctypes.CArray.t ->
      unit
    val set_bind_pose :
      (Types.Model.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Transform.t Ctypes.structure Ctypes_static.ptr ->
      unit
  end
module ModelAnimation :
  sig
    type t = Types.ModelAnimation.t Ctypes.structure
    val t : Types.Ray.t Ctypes.structure Ctypes.typ
    val bones :
      (Types.ModelAnimation.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.BoneInfo.t Ctypes.structure Ctypes.CArray.t
    val bone_count :
      (Types.ModelAnimation.t, [ `Struct ]) Ctypes.structured -> int
    val frame_count :
      (Types.ModelAnimation.t, [ `Struct ]) Ctypes.structured -> int
    val frame_pose_at :
      (Types.ModelAnimation.t, [ `Struct ]) Ctypes.structured ->
      int ->
      Raylib_generated_types.Transform.t Ctypes.structure Ctypes.CArray.t
  end
module Ray :
  sig
    type t = Types.Ray.t Ctypes.structure
    val t : Types.Ray.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      (Types.Ray.t, [ `Struct ]) Ctypes.structured
    val position :
      (Types.Ray.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val direction :
      (Types.Ray.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
  end
module RayHitInfo :
  sig
    type t = Types.RayHitInfo.t Ctypes.structure
    val hit : (Types.RayHitInfo.t, [ `Struct ]) Ctypes.structured -> bool
    val distance :
      (Types.RayHitInfo.t, [ `Struct ]) Ctypes.structured -> float
    val position :
      (Types.RayHitInfo.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val normal :
      (Types.RayHitInfo.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
  end
module BoundingBox :
  sig
    type t = Types.BoundingBox.t Ctypes.structure
    val t : Types.BoundingBox.t Ctypes.structure Ctypes.typ
    val create :
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      Raylib_generated_types.Vector3.t Ctypes.structure ->
      (Types.BoundingBox.t, [ `Struct ]) Ctypes.structured
    val min :
      (Types.BoundingBox.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val max :
      (Types.BoundingBox.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure
    val set_min :
      (Types.BoundingBox.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure -> unit
    val set_max :
      (Types.BoundingBox.t, [ `Struct ]) Ctypes.structured ->
      Raylib_generated_types.Vector3.t Ctypes.structure -> unit
  end
module Wave = Types.Wave
module AudioStream = Types.AudioStream
module Sound = Types.Sound
module Music = Types.Music
module VrDeviceInfo :
  sig
    type t = Types.VrDeviceInfo.t Ctypes.structure
    val t : Types.VrDeviceInfo.t Ctypes.structure Ctypes.typ
    val create :
      unit -> (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured
    val h_resolution :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> int
    val v_resolution :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> int
    val h_screen_size :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val v_screen_size :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val v_screen_center :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val eye_to_screen_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val lens_separation_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val interpupillary_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float
    val lens_distortion_values :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured ->
      float Ctypes_static.carray
    val chroma_ab_correction :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured ->
      float Ctypes_static.carray
    val set_h_resolution :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> int -> unit
    val set_v_resolution :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> int -> unit
    val set_h_screen_size :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_v_screen_size :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_v_screen_center :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_eye_to_screen_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_lens_separation_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_interpupillary_distance :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured -> float -> unit
    val set_lens_distortion_values :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured ->
      float -> float -> float -> float -> unit
    val set_chroma_ab_correction :
      (Types.VrDeviceInfo.t, [ `Struct ]) Ctypes.structured ->
      float -> float -> float -> float -> unit
  end
val init_window :
  (int -> int -> string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val window_should_close :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val close_window :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_window_ready :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_window_minimized :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_window_resized :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_window_hidden :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_window_fullscreen :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val toggle_fullscreen :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unhide_window :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val hide_window :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_icon :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_title :
  (string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_position :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_monitor :
  (int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_min_size :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_window_size :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_window_handle :
  (unit ->
   unit Ctypes_static.ptr option Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_screen_width :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_screen_height :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_count :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_width :
  (int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_height :
  (int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_physical_width :
  (int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_physical_height :
  (int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_window_position :
  (unit ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_monitor_name :
  (int -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_clipboard_text :
  (unit -> string option Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_clipboard_text :
  (string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val show_cursor :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val hide_cursor :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_cursor_hidden :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val enable_cursor :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val disable_cursor :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val clear_background :
  (Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_drawing :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_drawing :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_mode_2d :
  (Raylib_functions.Types.Camera2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_mode_2d :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_mode_3d :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_mode_3d :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_texture_mode :
  (Raylib_functions.Types.RenderTexture2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_texture_mode :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_scissor_mode :
  (int ->
   int -> int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_scissor_mode :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_mouse_ray :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Types.Ray.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_camera_matrix :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Types.Matrix.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_camera_matrix_2d :
  (Raylib_functions.Types.Camera2D.t Ctypes.structure ->
   Raylib_functions.Types.Matrix.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_world_to_screen :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_world_to_screen_ex :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   int ->
   int ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_world_to_screen_2d :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Camera2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_screen_to_world_2d :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Camera2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_target_fps :
  (int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_f_p_s :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_frame_time :
  (unit -> float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_time :
  (unit -> float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val color_to_int :
  (Raylib_functions.Types.Color.t Ctypes.structure ->
   int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val color_normalize :
  (Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Vector4.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val color_from_normalized :
  (Raylib_functions.Types.Vector4.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val color_to_hsv :
  (Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val color_from_hsv :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_color :
  (int ->
   Raylib_functions.Types.Color.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val fade :
  (Raylib_functions.Types.Color.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_config_flags :
  (Raylib_functions.Constants.ConfigFlag.t list ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_trace_log_level :
  (Raylib_functions.Constants.TraceLogType.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_trace_log_exit :
  (Raylib_functions.Constants.TraceLogType.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val trace_log :
  (Raylib_functions.Constants.TraceLogType.t ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val take_screenshot :
  (string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_random_value :
  (int -> int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _load_file_data :
  (string ->
   Unsigned.uint Ctypes_static.ptr ->
   Unsigned.uchar Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _save_file_data :
  (string ->
   unit Ctypes_static.ptr ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_file_text :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val save_file_text :
  (string -> string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val file_exists :
  (string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_file_extension :
  (string -> string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val directory_exists :
  (string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_extension :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_file_name :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_file_name_without_ext :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_directory_path :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_prev_directory_path :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_working_directory :
  (unit -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _get_directory_files :
  (string ->
   int Ctypes_static.ptr ->
   string Ctypes_static.ptr Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val clear_directory_files :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val change_directory :
  (string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_file_dropped :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _get_dropped_files :
  (int Ctypes_static.ptr ->
   string Ctypes_static.ptr Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val clear_dropped_files :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_file_mod_time :
  (string -> Signed.long Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _compress_data :
  (Unsigned.uchar Ctypes_static.ptr ->
   int ->
   int Ctypes_static.ptr ->
   Unsigned.uchar Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _decompress_data :
  (Unsigned.uchar Ctypes_static.ptr ->
   int ->
   int Ctypes_static.ptr ->
   Unsigned.uchar Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val save_storage_value :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_storage_value :
  (int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val open_u_r_l :
  (string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_key_pressed :
  (Raylib_functions.Constants.Key.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_key_down :
  (Raylib_functions.Constants.Key.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_key_released :
  (Raylib_functions.Constants.Key.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_key_up :
  (Raylib_functions.Constants.Key.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_exit_key :
  (Raylib_functions.Constants.Key.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_key_pressed :
  (unit ->
   Raylib_functions.Constants.Key.t
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_available :
  (Raylib_functions.Constants.GamepadNumber.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_name :
  (Raylib_functions.Constants.GamepadNumber.t ->
   string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gamepad_name :
  (Raylib_functions.Constants.GamepadNumber.t ->
   string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_button_pressed :
  (Raylib_functions.Constants.GamepadNumber.t ->
   Raylib_functions.Constants.GamepadButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_button_down :
  (Raylib_functions.Constants.GamepadNumber.t ->
   Raylib_functions.Constants.GamepadButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_button_released :
  (Raylib_functions.Constants.GamepadNumber.t ->
   Raylib_functions.Constants.GamepadButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gamepad_button_up :
  (Raylib_functions.Constants.GamepadNumber.t ->
   Raylib_functions.Constants.GamepadButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gamepad_button_pressed :
  (unit ->
   Raylib_functions.Constants.GamepadButton.t
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gamepad_axis_count :
  (Raylib_functions.Constants.GamepadNumber.t ->
   int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gamepad_axis_movement :
  (Raylib_functions.Constants.GamepadNumber.t ->
   Raylib_functions.Constants.GamepadAxis.t ->
   float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_mouse_button_pressed :
  (Raylib_functions.Constants.MouseButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_mouse_button_down :
  (Raylib_functions.Constants.MouseButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_mouse_button_released :
  (Raylib_functions.Constants.MouseButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_mouse_button_up :
  (Raylib_functions.Constants.MouseButton.t ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_mouse_x :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_mouse_y :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_mouse_position :
  (unit ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_mouse_position :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_mouse_offset :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_mouse_scale :
  (float -> float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_mouse_wheel_move :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_touch_x :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_touch_y :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_touch_position :
  (int ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_gesture_detected :
  (int -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_detected :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_touch_points_count :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_hold_duration :
  (unit -> float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_drag_vector :
  (unit ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_drag_angle :
  (unit -> float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_pinch_vector :
  (unit ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_gesture_pinch_angle :
  (unit -> float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_camera_mode :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Constants.CameraMode.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_camera :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_camera_pan_control :
  (Raylib_functions.Constants.Key.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_camera_alt_control :
  (Raylib_functions.Constants.Key.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_camera_smooth_zoom_control :
  (Raylib_functions.Constants.Key.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_camera_move_controls :
  (Raylib_functions.Constants.Key.t ->
   Raylib_functions.Constants.Key.t ->
   Raylib_functions.Constants.Key.t ->
   Raylib_functions.Constants.Key.t ->
   Raylib_functions.Constants.Key.t ->
   Raylib_functions.Constants.Key.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_pixel :
  (int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_pixel_v :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line_v :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line_ex :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line_bezier :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line_strip :
  (Raylib_functions.Types.Vector2.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle :
  (int ->
   int ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_sector :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_sector_lines :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_gradient :
  (int ->
   int ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_v :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_lines :
  (int ->
   int ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_ellipse :
  (int ->
   int ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_ellipse_lines :
  (int ->
   int ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_ring :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   float ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_ring_lines :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   float ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_v :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_rec :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_pro :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_gradient_v :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_gradient_h :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_gradient_ex :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_lines :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_lines_ex :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_rounded :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   float ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_rectangle_rounded_lines :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_triangle :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_triangle_lines :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_triangle_fan :
  (Raylib_functions.Types.Vector2.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_triangle_strip :
  (Raylib_functions.Types.Vector2.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_poly :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   int ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_poly_lines :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   int ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_recs :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_circles :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_circle_rec :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_collision_rec :
  (Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_point_rec :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_point_circle :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_point_triangle :
  (Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_image :
  (string ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_image_ex :
  (Raylib_functions.Types.Color.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_image_pro :
  (unit Ctypes_static.ptr ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_image_raw :
  (string ->
   int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_image :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val export_image :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val export_image_as_code :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_color :
  (int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_gradient_v :
  (int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_gradient_h :
  (int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_gradient_radial :
  (int ->
   int ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_checked :
  (int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_white_noise :
  (int ->
   int ->
   float ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_perlin_noise :
  (int ->
   int ->
   int ->
   int ->
   float ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_image_cellular :
  (int ->
   int ->
   int ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_copy :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_from_image :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_text :
  (string ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_text_ex :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_to_p_o_t :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_format :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_alpha_mask :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Image.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_alpha_clear :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_alpha_crop :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_alpha_premultiply :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_crop :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_resize :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_resize_n_n :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_resize_canvas :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_mipmaps :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_dither :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int -> int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_flip_vertical :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_flip_horizontal :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_rotate_c_w :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_rotate_c_c_w :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_tint :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_invert :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_grayscale :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_contrast :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_brightness :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_color_replace :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_image_alpha_border :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_clear_background :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_pixel :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_pixel_v :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_line :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_line_v :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_circle :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_circle_v :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_rectangle :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   int ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_rectangle_v :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_rectangle_rec :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_rectangle_lines :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_text :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   string ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val image_draw_text_ex :
  (Raylib_functions.Types.Image.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_texture :
  (string ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_texture_from_image :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_texture_cubemap :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_render_texture :
  (int ->
   int ->
   Raylib_functions.Types.RenderTexture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_texture :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_render_texture :
  (Raylib_functions.Types.RenderTexture2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_texture :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   unit Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_texture_data :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_screen_data :
  (unit ->
   Raylib_functions.Types.Image.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_texture_mipmaps :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_texture_filter :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Constants.TextureFilterMode.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_texture_wrap :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Constants.TextureWrapMode.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_v :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_ex :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_rec :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_quad :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_pro :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_texture_n_patch :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.NPatchInfo.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_pixel_data_size :
  (int -> int -> int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_font_default :
  (unit ->
   Raylib_functions.Types.Font.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_font :
  (string ->
   Raylib_functions.Types.Font.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_font_ex :
  (string ->
   int ->
   int Ctypes_static.ptr ->
   int ->
   Raylib_functions.Types.Font.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_font_from_image :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Font.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_font_data :
  (string ->
   int ->
   int Ctypes_static.ptr ->
   int ->
   int ->
   Raylib_functions.Types.CharInfo.t Ctypes.structure Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_font :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_fps :
  (int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_text :
  (string ->
   int ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_text_ex :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_text_rec :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   float ->
   float ->
   bool ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_text_rec_ex :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   float ->
   float ->
   bool ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_text_codepoint :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val measure_text :
  (string -> int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val measure_text_ex :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   string ->
   float ->
   float ->
   Raylib_functions.Types.Vector2.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_glyph_index :
  (Raylib_functions.Types.Font.t Ctypes.structure ->
   int -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_copy :
  (string -> string -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_is_equal :
  (string -> string -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_length :
  (string -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_subtext :
  (string ->
   int -> int -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_replace :
  (string ->
   string -> string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_insert :
  (string ->
   string -> int -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_append :
  (string ->
   string ->
   int Ctypes_static.ptr -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_find_index :
  (string -> string -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_to_upper :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_to_lower :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_to_pascal :
  (string -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_to_integer :
  (string -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val text_to_utf8 :
  (int Ctypes_static.ptr ->
   int -> string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_codepoints :
  (string ->
   int Ctypes_static.ptr ->
   int Ctypes_static.ptr Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_codepoints_count :
  (string -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_next_codepoint :
  (string ->
   int Ctypes_static.ptr -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val codepoint_to_utf8 :
  (int ->
   int Ctypes_static.ptr ->
   string Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_line_3d :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_point_3d :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_circle_3d :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cube :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cube_v :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cube_wires :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cube_wires_v :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cube_texture :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   float ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_sphere :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_sphere_ex :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_sphere_wires :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cylinder :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   float ->
   float ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_cylinder_wires :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   float ->
   float ->
   int ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_plane :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector2.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_ray :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_grid :
  (int -> float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_gizmo :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_model :
  (string ->
   Raylib_functions.Types.Model.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_model_from_mesh :
  (Raylib_functions.Types.Mesh.t Ctypes.structure ->
   Raylib_functions.Types.Model.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_model :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_meshes :
  (string ->
   int Ctypes_static.ptr ->
   Raylib_functions.Types.Mesh.t Ctypes.structure Ctypes_static.ptr option
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val export_mesh :
  (Raylib_functions.Types.Mesh.t Ctypes.structure ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_mesh :
  (Raylib_functions.Types.Mesh.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_materials :
  (string ->
   int Ctypes_static.ptr ->
   Raylib_functions.Types.Material.t Ctypes.structure Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_material_default :
  (unit ->
   Raylib_functions.Types.Material.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_material :
  (Raylib_functions.Types.Material.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_material_texture :
  (Raylib_functions.Types.Material.t Ctypes.structure Ctypes_static.ptr ->
   Raylib_functions.Constants.MaterialMapType.t ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_model_mesh_material :
  (Raylib_functions.Types.Model.t Ctypes.structure Ctypes_static.ptr ->
   int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val _load_model_animations :
  (string ->
   int Ctypes_static.ptr ->
   Raylib_functions.Types.ModelAnimation.t Ctypes.structure Ctypes_static.ptr
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_model_animation :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.ModelAnimation.t Ctypes.structure ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_model_animation :
  (Raylib_functions.Types.ModelAnimation.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_model_animation_valid :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.ModelAnimation.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_poly :
  (int ->
   float ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_plane :
  (float ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_cube :
  (float ->
   float ->
   float ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_sphere :
  (float ->
   int ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_hemi_sphere :
  (float ->
   int ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_cylinder :
  (float ->
   float ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_torus :
  (float ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_knot :
  (float ->
   float ->
   int ->
   int ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_heightmap :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_mesh_cubicmap :
  (Raylib_functions.Types.Image.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Mesh.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val mesh_bounding_box :
  (Raylib_functions.Types.Mesh.t Ctypes.structure ->
   Raylib_functions.Types.BoundingBox.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val mesh_tangents :
  (Raylib_functions.Types.Mesh.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val mesh_binormals :
  (Raylib_functions.Types.Mesh.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_model :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_model_ex :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_model_wires :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_model_wires_ex :
  (Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_bounding_box :
  (Raylib_functions.Types.BoundingBox.t Ctypes.structure ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_billboard :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val draw_billboard_rec :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Color.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_spheres :
  (Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_boxes :
  (Raylib_functions.Types.BoundingBox.t Ctypes.structure ->
   Raylib_functions.Types.BoundingBox.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_box_sphere :
  (Raylib_functions.Types.BoundingBox.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_ray_sphere :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_ray_sphere_ex :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.Vector3.t Ctypes.structure Ctypes_static.ptr ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val check_collision_ray_box :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.BoundingBox.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_collision_ray_model :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.Model.t Ctypes.structure ->
   Raylib_functions.Types.RayHitInfo.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_collision_ray_triangle :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.Vector3.t Ctypes.structure ->
   Raylib_functions.Types.RayHitInfo.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_collision_ray_ground :
  (Raylib_functions.Types.Ray.t Ctypes.structure ->
   float ->
   Raylib_functions.Types.RayHitInfo.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_shader :
  (string ->
   string ->
   Raylib_functions.Types.Shader.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_shader_code :
  (string ->
   string ->
   Raylib_functions.Types.Shader.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_shader :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_shader_default :
  (unit ->
   Raylib_functions.Types.Shader.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_texture_default :
  (unit ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_shapes_texture :
  (unit ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_shapes_texture_rec :
  (unit ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_shapes_texture :
  (Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   Raylib_functions.Types.Rectangle.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_shader_location :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   string ->
   Raylib_functions.Constants.ShaderLocationIndex.t
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_shader_value :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Constants.ShaderLocationIndex.t ->
   unit Ctypes_static.ptr ->
   Raylib_functions.Constants.ShaderUniformDataType.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_shader_value_v :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Constants.ShaderLocationIndex.t ->
   unit Ctypes_static.ptr ->
   Raylib_functions.Constants.ShaderUniformDataType.t ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_shader_value_matrix :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Constants.ShaderLocationIndex.t ->
   Raylib_functions.Types.Matrix.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_shader_value_texture :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Constants.ShaderLocationIndex.t ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_matrix_projection :
  (Raylib_functions.Types.Matrix.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_matrix_modelview :
  (Raylib_functions.Types.Matrix.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_matrix_modelview :
  (unit ->
   Raylib_functions.Types.Matrix.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_matrix_projection :
  (unit ->
   Raylib_functions.Types.Matrix.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_texture_cubemap :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_texture_irradiance :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_texture_prefilter :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val gen_texture_b_r_d_f :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   int ->
   Raylib_functions.Types.Texture2D.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_shader_mode :
  (Raylib_functions.Types.Shader.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_shader_mode :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_blend_mode :
  (Raylib_functions.Constants.BlendMode.t ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_blend_mode :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val init_vr_simulator :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val close_vr_simulator :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_vr_tracking :
  (Raylib_functions.Types.Camera3D.t Ctypes.structure Ctypes_static.ptr ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_vr_configuration :
  (Raylib_functions.Types.VrDeviceInfo.t Ctypes.structure ->
   Raylib_functions.Types.Shader.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_vr_simulator_ready :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val toggle_vr_mode :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val begin_vr_drawing :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val end_vr_drawing :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val init_audio_device :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val close_audio_device :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_audio_device_ready :
  (unit -> bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_master_volume :
  (float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_wave :
  (string ->
   Raylib_functions.Types.Wave.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_sound :
  (string ->
   Raylib_functions.Types.Sound.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_sound_from_wave :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   Raylib_functions.Types.Sound.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Ctypes_static.ptr ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_wave :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val export_wave :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val export_wave_as_code :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   string -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val play_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val stop_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val pause_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val resume_sound :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val play_sound_multi :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val stop_sound_multi :
  (unit -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_sounds_playing :
  (unit -> int Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_sound_playing :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_sound_volume :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_sound_pitch :
  (Raylib_functions.Types.Sound.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val wave_format :
  (Raylib_functions.Types.Wave.t Ctypes.structure Ctypes_static.ptr ->
   int -> int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val wave_copy :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   Raylib_functions.Types.Wave.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val wave_crop :
  (Raylib_functions.Types.Wave.t Ctypes.structure Ctypes_static.ptr ->
   int -> int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_wave_data :
  (Raylib_functions.Types.Wave.t Ctypes.structure ->
   float Ctypes_static.ptr Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_music_stream :
  (string ->
   Raylib_functions.Types.Music.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val unload_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val play_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val stop_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val pause_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val resume_music_stream :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_music_playing :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_music_volume :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_music_pitch :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_music_loop_count :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_music_time_length :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val get_music_time_played :
  (Raylib_functions.Types.Music.t Ctypes.structure ->
   float Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val init_audio_stream :
  (int ->
   int ->
   int ->
   Raylib_functions.Types.AudioStream.t Ctypes.structure
   Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val update_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Ctypes_static.ptr ->
   int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val close_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_audio_stream_processed :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val play_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val pause_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val resume_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val is_audio_stream_playing :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   bool Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val stop_audio_stream :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_audio_stream_volume :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_audio_stream_pitch :
  (Raylib_functions.Types.AudioStream.t Ctypes.structure ->
   float -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val set_audio_stream_buffer_size_default :
  (int -> unit Raylib_c.Raylib_c_generated_functions.return)
  Raylib_c.Raylib_c_generated_functions.result
val load_file_data : string -> Unsigned.uchar Ctypes.CArray.t
val save_file_data :
  string ->
  'a Ctypes.CArray.t -> unit Raylib_c.Raylib_c_generated_functions.return
val get_directory_files : string -> string Ctypes.CArray.t
val get_dropped_files : unit -> string Ctypes.CArray.t
val compress_data :
  Unsigned.uchar Ctypes.CArray.t -> Unsigned.uchar Ctypes.CArray.t
val decompress_data :
  Unsigned.uchar Ctypes.CArray.t -> Unsigned.uchar Ctypes.CArray.t
val load_model_animations :
  string ->
  Raylib_functions.Types.ModelAnimation.t Ctypes.structure Ctypes.CArray.t
