module ConfigFlag = Raylib_generated_constants.ConfigFlag
module TraceLogType = Raylib_generated_constants.TraceLogType
module Key = Raylib_generated_constants.Key
module AndroidButton = Raylib_generated_constants.AndroidButton
module MouseButton = Raylib_generated_constants.MouseButton
module GamepadNumber = Raylib_generated_constants.GamepadNumber
module GamepadButton = Raylib_generated_constants.GamepadButton
module GamepadAxis = Raylib_generated_constants.GamepadAxis
module ShaderLocationIndex = Raylib_generated_constants.ShaderLocationIndex
module ShaderUniformDataType = Raylib_generated_constants.ShaderUniformDataType
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

type 'a ctyp

val addr : 'a ctyp -> 'a ctyp Ctypes.ptr

val to_voidp : 'a Ctypes.ptr -> unit Ctypes.ptr

val ptr_of_int : int -> int Ctypes.ptr

val ptr_of_uint : Unsigned.uint -> Unsigned.uint Ctypes.ptr

val void_ptr_of_int : int -> unit Ctypes.ptr

module Vector2 : sig
  type t'

  type t = t' ctyp

  val create : float -> float -> t

  val x : t -> float

  val y : t -> float

  val set_x : t -> float -> unit

  val set_y : t -> float -> unit

  val zero : unit -> t

  val one : unit -> t

  val add : t -> t -> t

  val subtract : t -> t -> t

  val length : t -> float

  val dot_product : t -> t -> float

  val distance : t -> t -> float

  val angle : t -> t -> float

  val scale : t -> float -> t

  val multiply_v : t -> t -> t

  val negate : t -> t

  val divide : t -> float -> t

  val divide_v : t -> t -> t

  val normalize : t -> t

  val lerp : t -> t -> float -> t

  val rotate : t -> float -> t
end

module rec Vector3 : sig
  type t'

  type t = t' ctyp

  val create : float -> float -> float -> t

  val x : t -> float

  val y : t -> float

  val z : t -> float

  val set_x : t -> float -> unit

  val set_y : t -> float -> unit

  val set_z : t -> float -> unit

  val zero : unit -> t

  val one : unit -> t

  val add : t -> t -> t

  val subtract : t -> t -> t

  val scale : t -> float -> t

  val multiply : t -> t -> t

  val cross_product : t -> t -> t

  val perpendicular : t -> t

  val length : t -> float

  val dot_product : t -> t -> float

  val distance : t -> t -> float

  val negate : t -> t

  val divide : t -> float -> t

  val divide_v : t -> t -> t

  val normalize : t -> t

  val ortho_normalize : t Ctypes_static.ptr -> t Ctypes_static.ptr -> unit

  val transform : t -> Matrix.t -> t

  val rotate_by_quaternion : t -> Vector4.t -> t

  val lerp : t -> t -> float -> t

  val reflect : t -> t -> t

  val min : t -> t -> t

  val max : t -> t -> t

  val barycenter : t -> t -> t -> t -> t
end

and Vector4 : sig
  type t'

  type t = t' ctyp

  val create : float -> float -> float -> float -> t

  val x : t -> float

  val y : t -> float

  val z : t -> float

  val w : t -> float

  val set_x : t -> float -> unit

  val set_y : t -> float -> unit

  val set_z : t -> float -> unit

  val set_w : t -> float -> unit

  val identity : unit -> t

  val length : t -> float

  val normalize : t -> t

  val invert : t -> t

  val multiply : t -> t -> t

  val lerp : t -> t -> float -> t

  val nlerp : t -> t -> float -> t

  val slerp : t -> t -> float -> t

  val from_vector3_to_vector3 : Vector3.t -> Vector3.t -> t

  val from_matrix : Matrix.t -> t

  val to_matrix : t -> Matrix.t

  val from_axis_angle : Vector3.t -> float -> t

  val to_axis_angle :
    t -> Vector3.t Ctypes_static.ptr -> float Ctypes_static.ptr -> unit

  val from_euler : float -> float -> float -> t

  val to_euler : t -> Vector3.t

  val transform : t -> Matrix.t -> t
end

and Matrix : sig
  type t'

  type t = t' ctyp

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
    float ->
    float ->
    t

  val determinant : t -> float

  val trace : t -> float

  val transpose : t -> t

  val invert : t -> t

  val normalize : t -> t

  val identity : unit -> t

  val add : t -> t -> t

  val subtract : t -> t -> t

  val translate : float -> float -> float -> t

  val rotate : Vector3.t -> float -> t

  val rotate_x_y_z : Vector3.t -> t

  val rotate_x : float -> t

  val rotate_y : float -> t

  val rotate_z : float -> t

  val scale : float -> float -> float -> t

  val multiply : t -> t -> t

  val frustum : float -> float -> float -> float -> float -> float -> t

  val perspective : float -> float -> float -> float -> t

  val ortho : float -> float -> float -> float -> float -> float -> t

  val look_at : Vector3.t -> Vector3.t -> Vector3.t -> t
end

module Color : sig
  type t'

  type t = t' ctyp

  val create : int -> int -> int -> int -> t

  val lightgray : t

  val gray : t

  val darkgray : t

  val yellow : t

  val gold : t

  val orange : t

  val pink : t

  val red : t

  val maroon : t

  val green : t

  val lime : t

  val darkgreen : t

  val skyblue : t

  val blue : t

  val darkblue : t

  val purple : t

  val violet : t

  val darkpurple : t

  val beige : t

  val brown : t

  val darkbrown : t

  val white : t

  val black : t

  val blank : t

  val magenta : t

  val raywhite : t
end

module Rectangle : sig
  type t'

  type t = t' ctyp

  val create : float -> float -> float -> float -> t

  val x : t -> float

  val y : t -> float

  val width : t -> float

  val height : t -> float

  val set_x : t -> float -> unit

  val set_y : t -> float -> unit

  val set_width : t -> float -> unit

  val set_height : t -> float -> unit
end

module Texture2D : sig
  type t'

  type t = t' ctyp

  val id : t -> Unsigned.uint

  val width : t -> int

  val height : t -> int

  val mipmaps : t -> int

  val format : t -> PixelFormat.t
end

module Image : sig
  type t'

  type t = t' ctyp

  val width : Texture2D.t -> int

  val height : Texture2D.t -> int

  val mipmaps : Texture2D.t -> int

  val format : Texture2D.t -> PixelFormat.t
end

module RenderTexture2D : sig
  type t'

  type t = t' ctyp

  val texture : t -> Texture2D.t

  val depth : t -> Texture2D.t

  val depth_texture : t -> bool
end

module NPatchInfo : sig
  type t'

  type t = t' ctyp

  val create : Rectangle.t -> int -> int -> int -> int -> NPatchType.t -> t

  val source_rec : t -> Rectangle.t

  val left : t -> int

  val top : t -> int

  val right : t -> int

  val bottom : t -> int

  val typ : t -> NPatchType.t
end

module CharInfo : sig
  type t'

  type t = t' ctyp

  val value : t -> int

  val offset_x : t -> int

  val offset_y : t -> int

  val advance_x : t -> int

  val image : t -> Image.t
end

module Font : sig
  type t'

  type t = t' ctyp

  val base_size : t -> int

  val chars_count : t -> int

  val texture : t -> Texture2D.t

  val recs : t -> Rectangle.t Ctypes_static.ptr

  val chars : t -> CharInfo.t Ctypes.CArray.t
end

module Camera3D : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector3.t -> Vector3.t -> float -> CameraType.t -> t

  val position : t -> Vector3.t

  val target : t -> Vector3.t

  val up : t -> Vector3.t

  val fovy : t -> float

  val typ : t -> CameraType.t
end

module Camera = Camera3D

module Camera2D : sig
  type t'

  type t = t' ctyp

  val create : Vector2.t -> Vector2.t -> float -> float -> t

  val offset : t -> Vector2.t

  val target : t -> Vector2.t

  val rotation : t -> float

  val zoom : t -> float

  val set_offset : t -> Vector2.t -> unit

  val set_target : t -> Vector2.t -> unit

  val set_rotation : t -> float -> unit

  val set_zoom : t -> float -> unit
end

module Mesh : sig
  type t'

  type t = t' ctyp
end

module Shader : sig
  type t'

  type t = t' ctyp
end

module MaterialMap : sig
  type t'

  type t = t' ctyp

  val create : Texture2D.t -> Color.t -> float -> t

  val texture : t -> Texture2D.t

  val color : t -> Color.t

  val value : t -> float

  val set_texture : t -> Texture2D.t -> unit

  val set_color : t -> Color.t -> unit

  val set_value : t -> float -> unit
end

module Material : sig
  type t'

  type t = t' ctyp

  val create :
    Shader.t -> MaterialMap.t Ctypes_static.ptr -> float Ctypes_static.ptr -> t

  val shader : t -> Shader.t

  val maps : t -> MaterialMap.t Ctypes.CArray.t

  val params : t -> float Ctypes.CArray.t

  val set_shader : t -> Shader.t -> unit

  val set_maps : t -> MaterialMap.t Ctypes.CArray.t -> unit
end

module Transform : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector4.t -> Vector3.t -> t

  val translation : t -> Vector3.t

  val rotation : t -> Vector4.t

  val scale : t -> Vector3.t

  val set_translation : t -> Vector3.t -> unit

  val set_rotation : t -> Vector4.t -> unit

  val set_scale : t -> Vector3.t -> unit
end

module BoneInfo : sig
  type t'

  type t = t' ctyp
end

module Model : sig
  type t'

  type t = t' ctyp

  val transform : t -> Matrix.t

  val meshes : t -> Mesh.t Ctypes.CArray.t

  val materials : t -> Material.t Ctypes.CArray.t

  val bones : t -> BoneInfo.t Ctypes.CArray.t

  val bind_pose : t -> Transform.t Ctypes_static.ptr

  val set_transform : t -> Matrix.t -> unit

  val set_meshes : t -> Mesh.t Ctypes.CArray.t -> unit

  val set_materials : t -> Material.t Ctypes.CArray.t -> unit

  val set_bones : t -> BoneInfo.t Ctypes.CArray.t -> unit

  val set_bind_pose : t -> Transform.t Ctypes_static.ptr -> unit
end

module ModelAnimation : sig
  type t'

  type t = t' ctyp

  val bones : t -> BoneInfo.t Ctypes.CArray.t

  val bone_count : t -> int

  val frame_count : t -> int

  val frame_pose_at : t -> int -> Transform.t Ctypes.CArray.t
end

module Ray : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector3.t -> t

  val position : t -> Vector3.t

  val direction : t -> Vector3.t
end

module RayHitInfo : sig
  type t'

  type t = t' ctyp

  val hit : t -> bool

  val distance : t -> float

  val position : t -> Vector3.t

  val normal : t -> Vector3.t
end

module BoundingBox : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector3.t -> t

  val min : t -> Vector3.t

  val max : t -> Vector3.t

  val set_min : t -> Vector3.t -> unit

  val set_max : t -> Vector3.t -> unit
end

module Wave : sig
  type t'

  type t = t' ctyp
end

module AudioStream : sig
  type t'

  type t = t' ctyp
end

module Sound : sig
  type t'

  type t = t' ctyp
end

module Music : sig
  type t'

  type t = t' ctyp
end

module VrDeviceInfo : sig
  type t'

  type t = t' ctyp

  val create : unit -> t

  val h_resolution : t -> int

  val v_resolution : t -> int

  val h_screen_size : t -> float

  val v_screen_size : t -> float

  val v_screen_center : t -> float

  val eye_to_screen_distance : t -> float

  val lens_separation_distance : t -> float

  val interpupillary_distance : t -> float

  val lens_distortion_values : t -> float Ctypes_static.carray

  val chroma_ab_correction : t -> float Ctypes_static.carray

  val set_h_resolution : t -> int -> unit

  val set_v_resolution : t -> int -> unit

  val set_h_screen_size : t -> float -> unit

  val set_v_screen_size : t -> float -> unit

  val set_v_screen_center : t -> float -> unit

  val set_eye_to_screen_distance : t -> float -> unit

  val set_lens_separation_distance : t -> float -> unit

  val set_interpupillary_distance : t -> float -> unit

  val set_lens_distortion_values : t -> float -> float -> float -> float -> unit

  val set_chroma_ab_correction : t -> float -> float -> float -> float -> unit
end

val init_window : int -> int -> string -> unit

val window_should_close : unit -> bool

val close_window : unit -> unit

val is_window_ready : unit -> bool

val is_window_minimized : unit -> bool

val is_window_resized : unit -> bool

val is_window_hidden : unit -> bool

val is_window_fullscreen : unit -> bool

val toggle_fullscreen : unit -> unit

val unhide_window : unit -> unit

val hide_window : unit -> unit

val set_window_icon : Image.t -> unit

val set_window_title : string -> unit

val set_window_position : int -> int -> unit

val set_window_monitor : int -> unit

val set_window_min_size : int -> int -> unit

val set_window_size : int -> int -> unit

val get_window_handle : unit -> unit Ctypes_static.ptr option

val get_screen_width : unit -> int

val get_screen_height : unit -> int

val get_monitor_count : unit -> int

val get_monitor_width : int -> int

val get_monitor_height : int -> int

val get_monitor_physical_width : int -> int

val get_monitor_physical_height : int -> int

val get_window_position : unit -> Vector2.t

val get_monitor_name : int -> string

val get_clipboard_text : unit -> string option

val set_clipboard_text : string -> unit

val show_cursor : unit -> unit

val hide_cursor : unit -> unit

val is_cursor_hidden : unit -> bool

val enable_cursor : unit -> unit

val disable_cursor : unit -> unit

val clear_background : Color.t -> unit

val begin_drawing : unit -> unit

val end_drawing : unit -> unit

val begin_mode_2d : Camera2D.t -> unit

val end_mode_2d : unit -> unit

val begin_mode_3d : Camera3D.t -> unit

val end_mode_3d : unit -> unit

val begin_texture_mode : RenderTexture2D.t -> unit

val end_texture_mode : unit -> unit

val begin_scissor_mode : int -> int -> int -> int -> unit

val end_scissor_mode : unit -> unit

val get_mouse_ray : Vector2.t -> Camera3D.t -> Ray.t

val get_camera_matrix : Camera3D.t -> Matrix.t

val get_camera_matrix_2d : Camera2D.t -> Matrix.t

val get_world_to_screen : Vector3.t -> Camera3D.t -> Vector2.t

val get_world_to_screen_ex : Vector3.t -> Camera3D.t -> int -> int -> Vector2.t

val get_world_to_screen_2d : Vector2.t -> Camera2D.t -> Vector2.t

val get_screen_to_world_2d : Vector2.t -> Camera2D.t -> Vector2.t

val set_target_fps : int -> unit

val get_f_p_s : unit -> int

val get_frame_time : unit -> float

val get_time : unit -> float

val color_to_int : Color.t -> int

val color_normalize : Color.t -> Vector4.t

val color_from_normalized : Vector4.t -> Color.t

val color_to_hsv : Color.t -> Vector3.t

val color_from_hsv : Vector3.t -> Color.t

val get_color : int -> Color.t

val fade : Color.t -> float -> Color.t

val set_config_flags : ConfigFlag.t list -> unit

val set_trace_log_level : TraceLogType.t -> unit

val set_trace_log_exit : TraceLogType.t -> unit

val trace_log : TraceLogType.t -> string -> unit

val take_screenshot : string -> unit

val get_random_value : int -> int -> int

val _load_file_data :
  string -> Unsigned.uint Ctypes_static.ptr -> Unsigned.uchar Ctypes_static.ptr

val _save_file_data : string -> unit Ctypes_static.ptr -> int -> unit

val load_file_text : string -> string

val save_file_text : string -> string -> unit

val file_exists : string -> bool

val is_file_extension : string -> string -> bool

val directory_exists : string -> bool

val get_extension : string -> string

val get_file_name : string -> string

val get_file_name_without_ext : string -> string

val get_directory_path : string -> string

val get_prev_directory_path : string -> string

val get_working_directory : unit -> string

val _get_directory_files :
  string -> int Ctypes_static.ptr -> string Ctypes_static.ptr

val clear_directory_files : unit -> unit

val change_directory : string -> bool

val is_file_dropped : unit -> bool

val _get_dropped_files : int Ctypes_static.ptr -> string Ctypes_static.ptr

val clear_dropped_files : unit -> unit

val get_file_mod_time : string -> Signed.long

val _compress_data :
  Unsigned.uchar Ctypes_static.ptr ->
  int ->
  int Ctypes_static.ptr ->
  Unsigned.uchar Ctypes_static.ptr

val _decompress_data :
  Unsigned.uchar Ctypes_static.ptr ->
  int ->
  int Ctypes_static.ptr ->
  Unsigned.uchar Ctypes_static.ptr

val save_storage_value : int -> int -> unit

val load_storage_value : int -> int

val open_u_r_l : string -> unit

val is_key_pressed : Key.t -> bool

val is_key_down : Key.t -> bool

val is_key_released : Key.t -> bool

val is_key_up : Key.t -> bool

val set_exit_key : Key.t -> unit

val get_key_pressed : unit -> Key.t

val is_gamepad_available : GamepadNumber.t -> bool

val is_gamepad_name : GamepadNumber.t -> string -> bool

val get_gamepad_name : GamepadNumber.t -> string

val is_gamepad_button_pressed : GamepadNumber.t -> GamepadButton.t -> bool

val is_gamepad_button_down : GamepadNumber.t -> GamepadButton.t -> bool

val is_gamepad_button_released : GamepadNumber.t -> GamepadButton.t -> bool

val is_gamepad_button_up : GamepadNumber.t -> GamepadButton.t -> bool

val get_gamepad_button_pressed : unit -> GamepadButton.t

val get_gamepad_axis_count : GamepadNumber.t -> int

val get_gamepad_axis_movement : GamepadNumber.t -> GamepadAxis.t -> float

val is_mouse_button_pressed : MouseButton.t -> bool

val is_mouse_button_down : MouseButton.t -> bool

val is_mouse_button_released : MouseButton.t -> bool

val is_mouse_button_up : MouseButton.t -> bool

val get_mouse_x : unit -> int

val get_mouse_y : unit -> int

val get_mouse_position : unit -> Vector2.t

val set_mouse_position : int -> int -> unit

val set_mouse_offset : int -> int -> unit

val set_mouse_scale : float -> float -> unit

val get_mouse_wheel_move : unit -> int

val get_touch_x : unit -> int

val get_touch_y : unit -> int

val get_touch_position : int -> Vector2.t

val is_gesture_detected : int -> bool

val get_gesture_detected : unit -> int

val get_touch_points_count : unit -> int

val get_gesture_hold_duration : unit -> float

val get_gesture_drag_vector : unit -> Vector2.t

val get_gesture_drag_angle : unit -> float

val get_gesture_pinch_vector : unit -> Vector2.t

val get_gesture_pinch_angle : unit -> float

val set_camera_mode : Camera3D.t -> CameraMode.t -> unit

val update_camera : Camera3D.t Ctypes_static.ptr -> unit

val set_camera_pan_control : Key.t -> unit

val set_camera_alt_control : Key.t -> unit

val set_camera_smooth_zoom_control : Key.t -> unit

val set_camera_move_controls :
  Key.t -> Key.t -> Key.t -> Key.t -> Key.t -> Key.t -> unit

val draw_pixel : int -> int -> Color.t -> unit

val draw_pixel_v : Vector2.t -> Color.t -> unit

val draw_line : int -> int -> int -> int -> Color.t -> unit

val draw_line_v : Vector2.t -> Vector2.t -> Color.t -> unit

val draw_line_ex : Vector2.t -> Vector2.t -> float -> Color.t -> unit

val draw_line_bezier : Vector2.t -> Vector2.t -> float -> Color.t -> unit

val draw_line_strip : Vector2.t Ctypes_static.ptr -> int -> Color.t -> unit

val draw_circle : int -> int -> float -> Color.t -> unit

val draw_circle_sector :
  Vector2.t -> float -> int -> int -> int -> Color.t -> unit

val draw_circle_sector_lines :
  Vector2.t -> float -> int -> int -> int -> Color.t -> unit

val draw_circle_gradient : int -> int -> float -> Color.t -> Color.t -> unit

val draw_circle_v : Vector2.t -> float -> Color.t -> unit

val draw_circle_lines : int -> int -> float -> Color.t -> unit

val draw_ellipse : int -> int -> float -> float -> Color.t -> unit

val draw_ellipse_lines : int -> int -> float -> float -> Color.t -> unit

val draw_ring :
  Vector2.t -> float -> float -> int -> int -> int -> Color.t -> unit

val draw_ring_lines :
  Vector2.t -> float -> float -> int -> int -> int -> Color.t -> unit

val draw_rectangle : int -> int -> int -> int -> Color.t -> unit

val draw_rectangle_v : Vector2.t -> Vector2.t -> Color.t -> unit

val draw_rectangle_rec : Rectangle.t -> Color.t -> unit

val draw_rectangle_pro : Rectangle.t -> Vector2.t -> float -> Color.t -> unit

val draw_rectangle_gradient_v :
  int -> int -> int -> int -> Color.t -> Color.t -> unit

val draw_rectangle_gradient_h :
  int -> int -> int -> int -> Color.t -> Color.t -> unit

val draw_rectangle_gradient_ex :
  Rectangle.t -> Color.t -> Color.t -> Color.t -> Color.t -> unit

val draw_rectangle_lines : int -> int -> int -> int -> Color.t -> unit

val draw_rectangle_lines_ex : Rectangle.t -> int -> Color.t -> unit

val draw_rectangle_rounded : Rectangle.t -> float -> int -> Color.t -> unit

val draw_rectangle_rounded_lines :
  Rectangle.t -> float -> int -> int -> Color.t -> unit

val draw_triangle : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit

val draw_triangle_lines : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit

val draw_triangle_fan : Vector2.t Ctypes_static.ptr -> int -> Color.t -> unit

val draw_triangle_strip : Vector2.t Ctypes_static.ptr -> int -> Color.t -> unit

val draw_poly : Vector2.t -> int -> float -> float -> Color.t -> unit

val draw_poly_lines : Vector2.t -> int -> float -> float -> Color.t -> unit

val check_collision_recs : Rectangle.t -> Rectangle.t -> bool

val check_collision_circles : Vector2.t -> float -> Vector2.t -> float -> bool

val check_collision_circle_rec : Vector2.t -> float -> Rectangle.t -> bool

val get_collision_rec : Rectangle.t -> Rectangle.t -> Rectangle.t

val check_collision_point_rec : Vector2.t -> Rectangle.t -> bool

val check_collision_point_circle : Vector2.t -> Vector2.t -> float -> bool

val check_collision_point_triangle :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> bool

val load_image : string -> Image.t

val load_image_ex : Color.t Ctypes_static.ptr -> int -> int -> Image.t

val load_image_pro : unit Ctypes_static.ptr -> int -> int -> int -> Image.t

val load_image_raw : string -> int -> int -> int -> int -> Image.t

val unload_image : Image.t -> unit

val export_image : Image.t -> string -> unit

val export_image_as_code : Image.t -> string -> unit

val gen_image_color : int -> int -> Color.t -> Image.t

val gen_image_gradient_v : int -> int -> Color.t -> Color.t -> Image.t

val gen_image_gradient_h : int -> int -> Color.t -> Color.t -> Image.t

val gen_image_gradient_radial :
  int -> int -> float -> Color.t -> Color.t -> Image.t

val gen_image_checked :
  int -> int -> int -> int -> Color.t -> Color.t -> Image.t

val gen_image_white_noise : int -> int -> float -> Image.t

val gen_image_perlin_noise : int -> int -> int -> int -> float -> Image.t

val gen_image_cellular : int -> int -> int -> Image.t

val image_copy : Image.t -> Image.t

val image_from_image : Image.t -> Rectangle.t -> Image.t

val image_text : string -> int -> Color.t -> Image.t

val image_text_ex : Font.t -> string -> float -> float -> Color.t -> Image.t

val image_to_p_o_t : Image.t Ctypes_static.ptr -> Color.t -> unit

val image_format : Image.t Ctypes_static.ptr -> int -> unit

val image_alpha_mask : Image.t Ctypes_static.ptr -> Image.t -> unit

val image_alpha_clear : Image.t Ctypes_static.ptr -> Color.t -> float -> unit

val image_alpha_crop : Image.t Ctypes_static.ptr -> float -> unit

val image_alpha_premultiply : Image.t Ctypes_static.ptr -> unit

val image_crop : Image.t Ctypes_static.ptr -> Rectangle.t -> unit

val image_resize : Image.t Ctypes_static.ptr -> int -> int -> unit

val image_resize_n_n : Image.t Ctypes_static.ptr -> int -> int -> unit

val image_resize_canvas :
  Image.t Ctypes_static.ptr -> int -> int -> int -> int -> Color.t -> unit

val image_mipmaps : Image.t Ctypes_static.ptr -> unit

val image_dither : Image.t Ctypes_static.ptr -> int -> int -> int -> int -> unit

val image_flip_vertical : Image.t Ctypes_static.ptr -> unit

val image_flip_horizontal : Image.t Ctypes_static.ptr -> unit

val image_rotate_c_w : Image.t Ctypes_static.ptr -> unit

val image_rotate_c_c_w : Image.t Ctypes_static.ptr -> unit

val image_color_tint : Image.t Ctypes_static.ptr -> Color.t -> unit

val image_color_invert : Image.t Ctypes_static.ptr -> unit

val image_color_grayscale : Image.t Ctypes_static.ptr -> unit

val image_color_contrast : Image.t Ctypes_static.ptr -> float -> unit

val image_color_brightness : Image.t Ctypes_static.ptr -> int -> unit

val image_color_replace :
  Image.t Ctypes_static.ptr -> Color.t -> Color.t -> unit

val get_image_alpha_border : Image.t -> float -> Rectangle.t

val image_clear_background : Image.t Ctypes_static.ptr -> Color.t -> unit

val image_draw_pixel :
  Image.t Ctypes_static.ptr -> int -> int -> Color.t -> unit

val image_draw_pixel_v :
  Image.t Ctypes_static.ptr -> Vector2.t -> Color.t -> unit

val image_draw_line :
  Image.t Ctypes_static.ptr -> int -> int -> int -> int -> Color.t -> unit

val image_draw_line_v :
  Image.t Ctypes_static.ptr -> Vector2.t -> Vector2.t -> Color.t -> unit

val image_draw_circle :
  Image.t Ctypes_static.ptr -> int -> int -> int -> Color.t -> unit

val image_draw_circle_v :
  Image.t Ctypes_static.ptr -> Vector2.t -> int -> Color.t -> unit

val image_draw_rectangle :
  Image.t Ctypes_static.ptr -> int -> int -> int -> int -> Color.t -> unit

val image_draw_rectangle_v :
  Image.t Ctypes_static.ptr -> Vector2.t -> Vector2.t -> Color.t -> unit

val image_draw_rectangle_rec :
  Image.t Ctypes_static.ptr -> Rectangle.t -> Color.t -> unit

val image_draw_rectangle_lines :
  Image.t Ctypes_static.ptr -> Rectangle.t -> int -> Color.t -> unit

val image_draw :
  Image.t Ctypes_static.ptr ->
  Image.t ->
  Rectangle.t ->
  Rectangle.t ->
  Color.t ->
  unit

val image_draw_text :
  Image.t Ctypes_static.ptr -> Vector2.t -> string -> int -> Color.t -> unit

val image_draw_text_ex :
  Image.t Ctypes_static.ptr ->
  Vector2.t ->
  Font.t ->
  string ->
  float ->
  float ->
  Color.t ->
  unit

val load_texture : string -> Texture2D.t

val load_texture_from_image : Image.t -> Texture2D.t

val load_texture_cubemap : Image.t -> int -> Texture2D.t

val load_render_texture : int -> int -> RenderTexture2D.t

val unload_texture : Texture2D.t -> unit

val unload_render_texture : RenderTexture2D.t -> unit

val update_texture : Texture2D.t -> unit Ctypes_static.ptr -> unit

val get_texture_data : Texture2D.t -> Image.t

val get_screen_data : unit -> Image.t

val gen_texture_mipmaps : Texture2D.t Ctypes_static.ptr -> unit

val set_texture_filter : Texture2D.t -> TextureFilterMode.t -> unit

val set_texture_wrap : Texture2D.t -> TextureWrapMode.t -> unit

val draw_texture : Texture2D.t -> int -> int -> Color.t -> unit

val draw_texture_v : Texture2D.t -> Vector2.t -> Color.t -> unit

val draw_texture_ex :
  Texture2D.t -> Vector2.t -> float -> float -> Color.t -> unit

val draw_texture_rec :
  Texture2D.t -> Rectangle.t -> Vector2.t -> Color.t -> unit

val draw_texture_quad :
  Texture2D.t -> Vector2.t -> Vector2.t -> Rectangle.t -> Color.t -> unit

val draw_texture_pro :
  Texture2D.t ->
  Rectangle.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit

val draw_texture_n_patch :
  Texture2D.t ->
  NPatchInfo.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit

val get_pixel_data_size : int -> int -> int -> int

val get_font_default : unit -> Font.t

val load_font : string -> Font.t

val load_font_ex : string -> int -> int Ctypes_static.ptr -> int -> Font.t

val load_font_from_image : Image.t -> Color.t -> int -> Font.t

val load_font_data :
  string ->
  int ->
  int Ctypes_static.ptr ->
  int ->
  int ->
  CharInfo.t Ctypes_static.ptr

val unload_font : Font.t -> unit

val draw_fps : int -> int -> unit

val draw_text : string -> int -> int -> int -> Color.t -> unit

val draw_text_ex :
  Font.t -> string -> Vector2.t -> float -> float -> Color.t -> unit

val draw_text_rec :
  Font.t -> string -> Rectangle.t -> float -> float -> bool -> Color.t -> unit

val draw_text_rec_ex :
  Font.t ->
  string ->
  Rectangle.t ->
  float ->
  float ->
  bool ->
  Color.t ->
  int ->
  int ->
  Color.t ->
  Color.t ->
  unit

val draw_text_codepoint : Font.t -> int -> Vector2.t -> float -> Color.t -> unit

val measure_text : string -> int -> int

val measure_text_ex : Font.t -> string -> float -> float -> Vector2.t

val get_glyph_index : Font.t -> int -> int

val text_copy : string -> string -> int

val text_is_equal : string -> string -> bool

val text_length : string -> int

val text_subtext : string -> int -> int -> string

val text_replace : string -> string -> string -> string

val text_insert : string -> string -> int -> string

val text_append : string -> string -> int Ctypes_static.ptr -> unit

val text_find_index : string -> string -> int

val text_to_upper : string -> string

val text_to_lower : string -> string

val text_to_pascal : string -> string

val text_to_integer : string -> int

val text_to_utf8 : int Ctypes_static.ptr -> int -> string

val get_codepoints : string -> int Ctypes_static.ptr -> int Ctypes_static.ptr

val get_codepoints_count : string -> int

val get_next_codepoint : string -> int Ctypes_static.ptr -> int

val codepoint_to_utf8 : int -> int Ctypes_static.ptr -> string

val draw_line_3d : Vector3.t -> Vector3.t -> Color.t -> unit

val draw_point_3d : Vector3.t -> Color.t -> unit

val draw_circle_3d : Vector3.t -> float -> Vector3.t -> float -> Color.t -> unit

val draw_cube : Vector3.t -> float -> float -> float -> Color.t -> unit

val draw_cube_v : Vector3.t -> Vector3.t -> Color.t -> unit

val draw_cube_wires : Vector3.t -> float -> float -> float -> Color.t -> unit

val draw_cube_wires_v : Vector3.t -> Vector3.t -> Color.t -> unit

val draw_cube_texture :
  Texture2D.t -> Vector3.t -> float -> float -> float -> Color.t -> unit

val draw_sphere : Vector3.t -> float -> Color.t -> unit

val draw_sphere_ex : Vector3.t -> float -> int -> int -> Color.t -> unit

val draw_sphere_wires : Vector3.t -> float -> int -> int -> Color.t -> unit

val draw_cylinder :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit

val draw_cylinder_wires :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit

val draw_plane : Vector3.t -> Vector2.t -> Color.t -> unit

val draw_ray : Ray.t -> Color.t -> unit

val draw_grid : int -> float -> unit

val draw_gizmo : Vector3.t -> unit

val load_model : string -> Model.t

val load_model_from_mesh : Mesh.t -> Model.t

val unload_model : Model.t -> unit

val load_meshes :
  string -> int Ctypes_static.ptr -> Mesh.t Ctypes_static.ptr option

val export_mesh : Mesh.t -> string -> unit

val unload_mesh : Mesh.t -> unit

val load_materials :
  string -> int Ctypes_static.ptr -> Material.t Ctypes_static.ptr

val load_material_default : unit -> Material.t

val unload_material : Material.t -> unit

val set_material_texture :
  Material.t Ctypes_static.ptr -> MaterialMapType.t -> Texture2D.t -> unit

val set_model_mesh_material : Model.t Ctypes_static.ptr -> int -> int -> unit

val _load_model_animations :
  string -> int Ctypes_static.ptr -> ModelAnimation.t Ctypes_static.ptr

val update_model_animation : Model.t -> ModelAnimation.t -> int -> unit

val unload_model_animation : ModelAnimation.t -> unit

val is_model_animation_valid : Model.t -> ModelAnimation.t -> bool

val gen_mesh_poly : int -> float -> Mesh.t

val gen_mesh_plane : float -> float -> int -> int -> Mesh.t

val gen_mesh_cube : float -> float -> float -> Mesh.t

val gen_mesh_sphere : float -> int -> int -> Mesh.t

val gen_mesh_hemi_sphere : float -> int -> int -> Mesh.t

val gen_mesh_cylinder : float -> float -> int -> Mesh.t

val gen_mesh_torus : float -> float -> int -> int -> Mesh.t

val gen_mesh_knot : float -> float -> int -> int -> Mesh.t

val gen_mesh_heightmap : Image.t -> Vector3.t -> Mesh.t

val gen_mesh_cubicmap : Image.t -> Vector3.t -> Mesh.t

val mesh_bounding_box : Mesh.t -> BoundingBox.t

val mesh_tangents : Mesh.t Ctypes_static.ptr -> unit

val mesh_binormals : Mesh.t Ctypes_static.ptr -> unit

val draw_model : Model.t -> Vector3.t -> float -> Color.t -> unit

val draw_model_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit

val draw_model_wires : Model.t -> Vector3.t -> float -> Color.t -> unit

val draw_model_wires_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit

val draw_bounding_box : BoundingBox.t -> Color.t -> unit

val draw_billboard :
  Camera3D.t -> Texture2D.t -> Vector3.t -> float -> Color.t -> unit

val draw_billboard_rec :
  Camera3D.t ->
  Texture2D.t ->
  Rectangle.t ->
  Vector3.t ->
  float ->
  Color.t ->
  unit

val check_collision_spheres : Vector3.t -> float -> Vector3.t -> float -> bool

val check_collision_boxes : BoundingBox.t -> BoundingBox.t -> bool

val check_collision_box_sphere : BoundingBox.t -> Vector3.t -> float -> bool

val check_collision_ray_sphere : Ray.t -> Vector3.t -> float -> bool

val check_collision_ray_sphere_ex :
  Ray.t -> Vector3.t -> float -> Vector3.t Ctypes_static.ptr -> bool

val check_collision_ray_box : Ray.t -> BoundingBox.t -> bool

val get_collision_ray_model : Ray.t -> Model.t -> RayHitInfo.t

val get_collision_ray_triangle :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayHitInfo.t

val get_collision_ray_ground : Ray.t -> float -> RayHitInfo.t

val load_shader : string -> string -> Shader.t

val load_shader_code : string -> string -> Shader.t

val unload_shader : Shader.t -> unit

val get_shader_default : unit -> Shader.t

val get_texture_default : unit -> Texture2D.t

val get_shapes_texture : unit -> Texture2D.t

val get_shapes_texture_rec : unit -> Rectangle.t

val set_shapes_texture : Texture2D.t -> Rectangle.t -> unit

val get_shader_location : Shader.t -> string -> ShaderLocationIndex.t

val set_shader_value :
  Shader.t ->
  ShaderLocationIndex.t ->
  unit Ctypes_static.ptr ->
  ShaderUniformDataType.t ->
  unit

val set_shader_value_v :
  Shader.t ->
  ShaderLocationIndex.t ->
  unit Ctypes_static.ptr ->
  ShaderUniformDataType.t ->
  int ->
  unit

val set_shader_value_matrix :
  Shader.t -> ShaderLocationIndex.t -> Matrix.t -> unit

val set_shader_value_texture :
  Shader.t -> ShaderLocationIndex.t -> Texture2D.t -> unit

val set_matrix_projection : Matrix.t -> unit

val set_matrix_modelview : Matrix.t -> unit

val get_matrix_modelview : unit -> Matrix.t

val get_matrix_projection : unit -> Matrix.t

val gen_texture_cubemap : Shader.t -> Texture2D.t -> int -> Texture2D.t

val gen_texture_irradiance : Shader.t -> Texture2D.t -> int -> Texture2D.t

val gen_texture_prefilter : Shader.t -> Texture2D.t -> int -> Texture2D.t

val gen_texture_b_r_d_f : Shader.t -> int -> Texture2D.t

val begin_shader_mode : Shader.t -> unit

val end_shader_mode : unit -> unit

val begin_blend_mode : BlendMode.t -> unit

val end_blend_mode : unit -> unit

val init_vr_simulator : unit -> unit

val close_vr_simulator : unit -> unit

val update_vr_tracking : Camera3D.t Ctypes_static.ptr -> unit

val set_vr_configuration : VrDeviceInfo.t -> Shader.t -> unit

val is_vr_simulator_ready : unit -> bool

val toggle_vr_mode : unit -> unit

val begin_vr_drawing : unit -> unit

val end_vr_drawing : unit -> unit

val init_audio_device : unit -> unit

val close_audio_device : unit -> unit

val is_audio_device_ready : unit -> bool

val set_master_volume : float -> unit

val load_wave : string -> Wave.t

val load_sound : string -> Sound.t

val load_sound_from_wave : Wave.t -> Sound.t

val update_sound : Sound.t -> unit Ctypes_static.ptr -> int -> unit

val unload_wave : Wave.t -> unit

val unload_sound : Sound.t -> unit

val export_wave : Wave.t -> string -> unit

val export_wave_as_code : Wave.t -> string -> unit

val play_sound : Sound.t -> unit

val stop_sound : Sound.t -> unit

val pause_sound : Sound.t -> unit

val resume_sound : Sound.t -> unit

val play_sound_multi : Sound.t -> unit

val stop_sound_multi : unit -> unit

val get_sounds_playing : unit -> int

val is_sound_playing : Sound.t -> bool

val set_sound_volume : Sound.t -> float -> unit

val set_sound_pitch : Sound.t -> float -> unit

val wave_format : Wave.t Ctypes_static.ptr -> int -> int -> int -> unit

val wave_copy : Wave.t -> Wave.t

val wave_crop : Wave.t Ctypes_static.ptr -> int -> int -> unit

val get_wave_data : Wave.t -> float Ctypes_static.ptr

val load_music_stream : string -> Music.t

val unload_music_stream : Music.t -> unit

val play_music_stream : Music.t -> unit

val update_music_stream : Music.t -> unit

val stop_music_stream : Music.t -> unit

val pause_music_stream : Music.t -> unit

val resume_music_stream : Music.t -> unit

val is_music_playing : Music.t -> bool

val set_music_volume : Music.t -> float -> unit

val set_music_pitch : Music.t -> float -> unit

val set_music_loop_count : Music.t -> int -> unit

val get_music_time_length : Music.t -> float

val get_music_time_played : Music.t -> float

val init_audio_stream : int -> int -> int -> AudioStream.t

val update_audio_stream : AudioStream.t -> unit Ctypes_static.ptr -> int -> unit

val close_audio_stream : AudioStream.t -> unit

val is_audio_stream_processed : AudioStream.t -> bool

val play_audio_stream : AudioStream.t -> unit

val pause_audio_stream : AudioStream.t -> unit

val resume_audio_stream : AudioStream.t -> unit

val is_audio_stream_playing : AudioStream.t -> bool

val stop_audio_stream : AudioStream.t -> unit

val set_audio_stream_volume : AudioStream.t -> float -> unit

val set_audio_stream_pitch : AudioStream.t -> float -> unit

val set_audio_stream_buffer_size_default : int -> unit

val load_file_data : string -> Unsigned.uchar Ctypes.CArray.t

val save_file_data : string -> 'a Ctypes.CArray.t -> unit

val get_directory_files : string -> string Ctypes.CArray.t

val get_dropped_files : unit -> string Ctypes.CArray.t

val compress_data :
  Unsigned.uchar Ctypes.CArray.t -> Unsigned.uchar Ctypes.CArray.t

val decompress_data :
  Unsigned.uchar Ctypes.CArray.t -> Unsigned.uchar Ctypes.CArray.t

val load_model_animations : string -> ModelAnimation.t Ctypes.CArray.t
