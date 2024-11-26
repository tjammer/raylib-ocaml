(** {1 Ctypes reexports}

  Basic types and utility functions shared by the following modules *)

(* Ideally, the ctypes types would be completely abstract but both the gui
   bindings and the rlgl module need to be able to access them directly. If
   anyone reading this has an idea an how to improve this, I'd be happy *)
type 'a ctyp = 'a Ctypes.structure
type 'a ptr = 'a Ctypes.ptr

val to_ctyp : 'a Ctypes.structure -> 'a ctyp
val addr : 'a ctyp -> 'a ctyp ptr
val to_voidp : 'a ptr -> unit ptr
val ptr_of_int : int -> int ptr
val ptr_of_uint : Unsigned.uint -> Unsigned.uint ptr
val void_ptr_of_int : int -> unit ptr

module CArray = Ctypes.CArray

(** {1 Constants} *)

module ConfigFlags : sig
  type t =
    | Vsync_hint
    | Fullscreen_mode
    | Window_resizable
    | Window_undecorated
    | Window_hidden
    | Window_minimized
    | Window_maximized
    | Window_unfocused
    | Window_topmost
    | Window_always_run
    | Window_transparent
    | Window_highdpi
    | Window_mouse_passthrough
    | Borderless_windowed_mode
    | Msaa_4x_hint
    | Interlaced_hint

  val to_int : t -> int
  val of_int : int -> t
end

module TraceLogLevel : sig
  type t = All | Trace | Debug | Info | Warning | Error | Fatal | None

  val to_int : t -> int
  val of_int : int -> t
end

module Key : sig
  type t =
    | Null
    | Apostrophe
    | Comma
    | Minus
    | Period
    | Slash
    | Zero
    | One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Semicolon
    | Equal
    | A
    | B
    | C
    | D
    | E
    | F
    | G
    | H
    | I
    | J
    | K
    | L
    | M
    | N
    | O
    | P
    | Q
    | R
    | S
    | T
    | U
    | V
    | W
    | X
    | Y
    | Z
    | Left_bracket
    | Backslash
    | Right_bracket
    | Grave
    | Space
    | Escape
    | Enter
    | Tab
    | Backspace
    | Insert
    | Delete
    | Right
    | Left
    | Down
    | Up
    | Page_up
    | Page_down
    | Home
    | End
    | Caps_lock
    | Scroll_lock
    | Num_lock
    | Print_screen
    | Pause
    | F1
    | F2
    | F3
    | F4
    | F5
    | F6
    | F7
    | F8
    | F9
    | F10
    | F11
    | F12
    | Left_shift
    | Left_control
    | Left_alt
    | Left_super
    | Right_shift
    | Right_control
    | Right_alt
    | Right_super
    | Kb_menu
    | Kp_0
    | Kp_1
    | Kp_2
    | Kp_3
    | Kp_4
    | Kp_5
    | Kp_6
    | Kp_7
    | Kp_8
    | Kp_9
    | Kp_decimal
    | Kp_divide
    | Kp_multiply
    | Kp_subtract
    | Kp_add
    | Kp_enter
    | Kp_equal
    | Back
    | Menu
    | Volume_up
    | Volume_down

  val to_int : t -> int
  val of_int : int -> t
end

module MouseButton : sig
  type t = Left | Right | Middle | Side | Extra | Forward | Back

  val to_int : t -> int
  val of_int : int -> t
end

module MouseCursor : sig
  type t =
    | Default
    | Arrow
    | Ibeam
    | Crosshair
    | Pointing_hand
    | Resize_ew
    | Resize_ns
    | Resize_nwse
    | Resize_nesw
    | Resize_all
    | Not_allowed

  val to_int : t -> int
  val of_int : int -> t
end

module GamepadButton : sig
  type t =
    | Unknown
    | Left_face_up
    | Left_face_right
    | Left_face_down
    | Left_face_left
    | Right_face_up
    | Right_face_right
    | Right_face_down
    | Right_face_left
    | Left_trigger_1
    | Left_trigger_2
    | Right_trigger_1
    | Right_trigger_2
    | Middle_left
    | Middle
    | Middle_right
    | Left_thumb
    | Right_thumb

  val to_int : t -> int
  val of_int : int -> t
end

module GamepadAxis : sig
  type t = Left_x | Left_y | Right_x | Right_y | Left_trigger | Right_trigger

  val to_int : t -> int
  val of_int : int -> t
end

module MaterialMapIndex : sig
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

  val to_int : t -> int
  val of_int : int -> t
end

module ShaderLocationIndex : sig
  type t =
    | Vertex_position
    | Vertex_texcoord01
    | Vertex_texcoord02
    | Vertex_normal
    | Vertex_tangent
    | Vertex_color
    | Matrix_mvp
    | Matrix_view
    | Matrix_projection
    | Matrix_model
    | Matrix_normal
    | Vector_view
    | Color_diffuse
    | Color_specular
    | Color_ambient
    | Map_albedo
    | Map_metalness
    | Map_normal
    | Map_roughness
    | Map_occlusion
    | Map_emission
    | Map_height
    | Map_cubemap
    | Map_irradiance
    | Map_prefilter
    | Map_brdf

  val to_int : t -> int
  val of_int : int -> t
end

module ShaderUniformDataType : sig
  type t =
    | Float
    | Vec2
    | Vec3
    | Vec4
    | Int
    | Ivec2
    | Ivec3
    | Ivec4
    | Sampler2d

  val to_int : t -> int
  val of_int : int -> t
end

module ShaderAttributeDataType : sig
  type t = Float | Vec2 | Vec3 | Vec4

  val to_int : t -> int
  val of_int : int -> t
end

module PixelFormat : sig
  type t =
    | Uncompressed_grayscale
    | Uncompressed_gray_alpha
    | Uncompressed_r5g6b5
    | Uncompressed_r8g8b8
    | Uncompressed_r5g5b5a1
    | Uncompressed_r4g4b4a4
    | Uncompressed_r8g8b8a8
    | Uncompressed_r32
    | Uncompressed_r32g32b32
    | Uncompressed_r32g32b32a32
    | Uncompressed_r16
    | Uncompressed_r16g16b16
    | Uncompressed_r16g16b16a16
    | Compressed_dxt1_rgb
    | Compressed_dxt1_rgba
    | Compressed_dxt3_rgba
    | Compressed_dxt5_rgba
    | Compressed_etc1_rgb
    | Compressed_etc2_rgb
    | Compressed_etc2_eac_rgba
    | Compressed_pvrt_rgb
    | Compressed_pvrt_rgba
    | Compressed_astc_4x4_rgba
    | Compressed_astc_8x8_rgba

  val to_int : t -> int
  val of_int : int -> t
end

module TextureFilter : sig
  type t =
    | Point
    | Bilinear
    | Trilinear
    | Anisotropic_4x
    | Anisotropic_8x
    | Anisotropic_16x

  val to_int : t -> int
  val of_int : int -> t
end

module TextureWrap : sig
  type t = Repeat | Clamp | Mirror_repeat | Mirror_clamp

  val to_int : t -> int
  val of_int : int -> t
end

module CubemapLayout : sig
  type t =
    | Auto_detect
    | Line_vertical
    | Line_horizontal
    | Cross_three_by_four
    | Cross_four_by_three
    | Panorama

  val to_int : t -> int
  val of_int : int -> t
end

module FontType : sig
  type t = Default | Bitmap | Sdf

  val to_int : t -> int
  val of_int : int -> t
end

module BlendMode : sig
  type t =
    | Alpha
    | Additive
    | Multiplied
    | Add_colors
    | Subtract_colors
    | Alpha_premultiply
    | Custom
    | Custom_separate

  val to_int : t -> int
  val of_int : int -> t
end

module Gesture : sig
  type t =
    | None
    | Tap
    | Doubletap
    | Hold
    | Drag
    | Swipe_right
    | Swipe_left
    | Swipe_up
    | Swipe_down
    | Pinch_in
    | Pinch_out

  val to_int : t -> int
  val of_int : int -> t
end

module CameraMode : sig
  type t = Custom | Free | Orbital | First_person | Third_person

  val to_int : t -> int
  val of_int : int -> t
end

module CameraProjection : sig
  type t = Perspective | Orthographic

  val to_int : t -> int
  val of_int : int -> t
end

module NPatchLayout : sig
  type t = Nine_patch | Three_patch_vertical | Three_patch_horizontal

  val to_int : t -> int
  val of_int : int -> t
end

val max_material_maps : int
val max_shader_locations : int

(** {1 Types} *)

module Vector2 : sig
  type t' = Raylib_fixed_types.Vector2.t
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : float -> float -> t
  (** [create x y] *)

  val x : t -> float
  (** Vector x component *)

  val y : t -> float
  (** Vector y component *)

  val set_x : t -> float -> unit
  val set_y : t -> float -> unit
  val zero : unit -> t
  val one : unit -> t
  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val length : t -> float
  val length_sqr : t -> float
  val dot_product : t -> t -> float
  val distance : t -> t -> float
  val angle : t -> t -> float
  val scale : t -> float -> t
  val multiply : t -> t -> t
  val negate : t -> t
  val divide : t -> t -> t
  val normalize : t -> t
  val lerp : t -> t -> float -> t
  val reflect : t -> t -> t
  val rotate : t -> float -> t
  val move_towards : t -> t -> float -> t
end

module rec Vector3 : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : float -> float -> float -> t
  (** [create x y z] *)

  val x : t -> float
  (** Vector x component *)

  val y : t -> float
  (** Vector y component *)

  val z : t -> float
  (** Vector z component *)

  val set_x : t -> float -> unit
  val set_y : t -> float -> unit
  val set_z : t -> float -> unit
  val zero : unit -> t
  val one : unit -> t
  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val scale : t -> float -> t
  val multiply : t -> t -> t
  val cross_product : t -> t -> t
  val perpendicular : t -> t
  val length : t -> float
  val length_sqr : t -> float
  val dot_product : t -> t -> float
  val distance : t -> t -> float
  val negate : t -> t
  val divide : t -> t -> t
  val normalize : t -> t
  val ortho_normalize : t ptr -> t ptr -> unit
  val transform : t -> Matrix.t -> t
  val rotate_by_quaternion : t -> Vector4.t -> t
  val lerp : t -> t -> float -> t
  val reflect : t -> t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val barycenter : t -> t -> t -> t -> t
  val unproject : t -> Matrix.t -> Matrix.t -> t
end

and Vector4 : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : float -> float -> float -> float -> t
  (** [create x y z w] *)

  val x : t -> float
  (** Vector x component *)

  val y : t -> float
  (** Vector y component *)

  val z : t -> float
  (** Vector z component *)

  val w : t -> float
  (** Vector w component *)

  val set_x : t -> float -> unit
  val set_y : t -> float -> unit
  val set_z : t -> float -> unit
  val set_w : t -> float -> unit
  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val identity : unit -> t
  val length : t -> float
  val normalize : t -> t
  val invert : t -> t
  val multiply : t -> t -> t
  val scale : t -> float -> t
  val divide : t -> t -> t
  val lerp : t -> t -> float -> t
  val nlerp : t -> t -> float -> t
  val slerp : t -> t -> float -> t
  val from_vector3_to_vector3 : Vector3.t -> Vector3.t -> t
  val from_matrix : Matrix.t -> t
  val to_matrix : t -> Matrix.t
  val from_axis_angle : Vector3.t -> float -> t
  val to_axis_angle : t -> Vector3.t ptr -> float ptr -> unit
  val from_euler : float -> float -> float -> t
  val to_euler : t -> Vector3.t
  val transform : t -> Matrix.t -> t
end

and Matrix : sig
  type t' = Raylib_fixed_types.Matrix.t
  type t = t' ctyp

  val t : t Ctypes.typ

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
  (** [create m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15] *)

  val m0 : t -> float
  val m1 : t -> float
  val m2 : t -> float
  val m3 : t -> float
  val m4 : t -> float
  val m5 : t -> float
  val m6 : t -> float
  val m7 : t -> float
  val m8 : t -> float
  val m9 : t -> float
  val m10 : t -> float
  val m11 : t -> float
  val m12 : t -> float
  val m13 : t -> float
  val m14 : t -> float
  val m15 : t -> float
  val set_m0 : t -> float -> unit
  val set_m1 : t -> float -> unit
  val set_m2 : t -> float -> unit
  val set_m3 : t -> float -> unit
  val set_m4 : t -> float -> unit
  val set_m5 : t -> float -> unit
  val set_m6 : t -> float -> unit
  val set_m7 : t -> float -> unit
  val set_m8 : t -> float -> unit
  val set_m9 : t -> float -> unit
  val set_m10 : t -> float -> unit
  val set_m11 : t -> float -> unit
  val set_m12 : t -> float -> unit
  val set_m13 : t -> float -> unit
  val set_m14 : t -> float -> unit
  val set_m15 : t -> float -> unit
  val determinant : t -> float
  val trace : t -> float
  val transpose : t -> t
  val invert : t -> t
  val identity : unit -> t
  val add : t -> t -> t
  val subtract : t -> t -> t
  val translate : float -> float -> float -> t
  val rotate : Vector3.t -> float -> t
  val rotate_xyz : Vector3.t -> t
  val rotate_zyx : Vector3.t -> t
  val rotate_x : float -> t
  val rotate_y : float -> t
  val rotate_z : float -> t
  val scale : float -> float -> float -> t
  val multiply : t -> t -> t

  val frustum : float -> float -> float -> float -> float -> float -> t
  (** [frustum left right bottom top near far] returns perspective projection matrix *)

  val perspective : float -> float -> float -> float -> t
  (** [perspective fovy aspect near far] returns perspective projection matrix *)

  val ortho : float -> float -> float -> float -> float -> float -> t
  (** [ortho left right bottom top near far] returns orthographic projection matrix *)

  val look_at : Vector3.t -> Vector3.t -> Vector3.t -> t
  (** [look at eye target up] returns camera look-at matrix (view matrix) *)
end

module Color : sig
  type t' = Raylib_fixed_types.Color.t
  type t = t' ctyp

  val t : t Ctypes.typ
  val r : t -> int
  val g : t -> int
  val b : t -> int
  val a : t -> int

  val create : int -> int -> int -> int -> t
  (** [create red green blue alpha] creates a 24bit+8bit alpha color. *)

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
  type t' = Raylib_fixed_types.Rectangle.t
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : float -> float -> float -> float -> t
  (** [create x y width height] *)

  val x : t -> float
  (** Rectangle top-left corner position x *)

  val y : t -> float
  (** Rectangle top-left corner position y *)

  val width : t -> float
  (** Rectangle width *)

  val height : t -> float
  (** Rectangle height *)

  val set_x : t -> float -> unit
  val set_y : t -> float -> unit
  val set_width : t -> float -> unit
  val set_height : t -> float -> unit
end

module Image : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val width : t -> int
  (** Image base width *)

  val height : t -> int
  (** Image base height *)

  val mipmaps : t -> int
  (** Mipmap levels, 1 by default *)

  val format : t -> PixelFormat.t
  (** Data format (PixelFormat type) *)
end

module Texture : sig
  type t' = Raylib_fixed_types.Texture.t
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Unsigned.uint -> int -> int -> int -> PixelFormat.t -> t
  (** [create id width height mipmaps format] *)

  val id : t -> Unsigned.uint
  (** OpenGL texture id *)

  val width : t -> int
  (** Texture base width *)

  val height : t -> int
  (** Texture base height *)

  val mipmaps : t -> int
  (** Mipmap levels, 1 by default *)

  val format : t -> PixelFormat.t
  (** Data format (PixelFormat type) *)
end

module Texture2D = Texture

module RenderTexture : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val id : t -> Unsigned.uint
  (** OpenGL framebuffer object id *)

  val texture : t -> Texture.t
  (** Color buffer attachment texture *)

  val depth : t -> Texture.t
  (** Depth buffer attachment texture *)

  val set_texture : t -> Texture.t -> unit
  val set_depth : t -> Texture.t -> unit
end

module NPatchInfo : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Rectangle.t -> int -> int -> int -> int -> NPatchLayout.t -> t
  (** [create source left top right bottom layout] *)

  val source : t -> Rectangle.t
  (** Texture source rectangle *)

  val left : t -> int
  (** Left border offset *)

  val top : t -> int
  (** Top border offset *)

  val right : t -> int
  (** Right border offset *)

  val bottom : t -> int
  (** Bottom border offset *)

  val layout : t -> NPatchLayout.t
  (** Layout of the n-patch: 3x3, 1x3 or 3x1 *)

  val set_source : t -> Rectangle.t -> unit
  val set_left : t -> int -> unit
  val set_top : t -> int -> unit
  val set_right : t -> int -> unit
  val set_bottom : t -> int -> unit
  val set_layout : t -> NPatchLayout.t -> unit
end

module GlyphInfo : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : int -> int -> int -> int -> Image.t -> t
  (** [create value offset_x offset_y advance_x image] *)

  val value : t -> int
  (** Character value (Unicode) *)

  val offset_x : t -> int
  (** Character offset X when drawing *)

  val offset_y : t -> int
  (** Character offset Y when drawing *)

  val advance_x : t -> int
  (** Character advance position X *)

  val image : t -> Image.t
  (** Character image data *)

  val set_value : t -> int -> unit
  val set_offset_x : t -> int -> unit
  val set_offset_y : t -> int -> unit
  val set_advance_x : t -> int -> unit
  val set_image : t -> Image.t -> unit
end

module Font : sig
  type t' = Raylib_fixed_types.Font.t
  type t = t' ctyp

  val t : t Ctypes.typ

  val base_size : t -> int
  (** Base size (default chars height) *)

  val glyph_padding : t -> int
  (** Padding around the glyph characters *)

  val texture : t -> Texture.t
  (** Texture atlas containing the glyphs *)

  val recs : t -> Rectangle.t ptr
  (** Rectangles in texture for the glyphs *)

  val glyphs : t -> GlyphInfo.t CArray.t
  (** Glyphs info data *)

  val set_base_size : t -> int -> unit
  val set_glyph_padding : t -> int -> unit
  val set_texture : t -> Texture.t -> unit
  val set_recs : t -> Rectangle.t ptr -> unit
  val set_glyphs : t -> GlyphInfo.t CArray.t -> unit
end

module Camera3D : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create :
    Vector3.t -> Vector3.t -> Vector3.t -> float -> CameraProjection.t -> t
  (** [create position target up fovy projection] *)

  val position : t -> Vector3.t
  (** Camera position *)

  val target : t -> Vector3.t
  (** Camera target it looks-at *)

  val up : t -> Vector3.t
  (** Camera up vector (rotation over its axis) *)

  val fovy : t -> float
  (** Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic *)

  val projection : t -> CameraProjection.t
  (** Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC *)

  val set_position : t -> Vector3.t -> unit
  val set_target : t -> Vector3.t -> unit
  val set_up : t -> Vector3.t -> unit
  val set_fovy : t -> float -> unit
  val set_projection : t -> CameraProjection.t -> unit
end

module Camera = Camera3D

module Camera2D : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Vector2.t -> Vector2.t -> float -> float -> t
  (** [create offset target rotation zoom] *)

  val offset : t -> Vector2.t
  (** Camera offset (displacement from target) *)

  val target : t -> Vector2.t
  (** Camera target (rotation and zoom origin) *)

  val rotation : t -> float
  (** Camera rotation in degrees *)

  val zoom : t -> float
  (** Camera zoom (scaling), should be 1.0f by default *)

  val set_offset : t -> Vector2.t -> unit
  val set_target : t -> Vector2.t -> unit
  val set_rotation : t -> float -> unit
  val set_zoom : t -> float -> unit
end

module Mesh : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val create : unit -> t

  val vertex_count : t -> int
  (** Number of vertices stored in arrays *)

  val triangle_count : t -> int
  (** Number of triangles stored (indexed or not) *)

  val vertices : t -> float Ctypes_static.carray
  (** Vertex position (XYZ - 3 components per vertex) (shader-location = 0) *)

  val texcoords : t -> float Ctypes_static.carray
  (** Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1) *)

  val texcoords2 : t -> float Ctypes_static.carray
  (** Vertex second texture coordinates (useful for lightmaps) (shader-location = 5) *)

  val normals : t -> float Ctypes_static.carray
  (** Vertex normals (XYZ - 3 components per vertex) (shader-location = 2) *)

  val tangents : t -> float Ctypes_static.carray
  (** Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4) *)

  val colors : t -> Unsigned.uchar Ctypes_static.carray
  (** Vertex colors (RGBA - 4 components per vertex) (shader-location = 3) *)

  val indices : t -> Unsigned.ushort Ctypes_static.carray
  (** Vertex indices (in case vertex data comes indexed) *)

  val anim_vertices : t -> float Ctypes_static.carray
  (** Animated vertex positions (after bones transformations) *)

  val anim_normals : t -> float Ctypes_static.carray
  (** Animated normals (after bones transformations) *)

  val bone_ids : t -> int Ctypes_static.carray
  (** Vertex bone ids, up to 4 bones influence by vertex (skinning) *)

  val bone_weights : t -> float Ctypes_static.carray
  (** Vertex bone weight, up to 4 bones influence by vertex (skinning) *)

  val set_vertex_count : t -> int -> unit
  val set_triangle_count : t -> int -> unit
  val set_vertices : t -> float Ctypes_static.carray -> unit
  val set_texcoords : t -> float Ctypes_static.carray -> unit
  val set_texcoords2 : t -> float Ctypes_static.carray -> unit
  val set_normals : t -> float Ctypes_static.carray -> unit
  val set_tangents : t -> float Ctypes_static.carray -> unit
  val set_colors : t -> Unsigned.uchar Ctypes_static.carray -> unit
  val set_indices : t -> Unsigned.ushort Ctypes_static.carray -> unit
  val set_anim_vertices : t -> float Ctypes_static.carray -> unit
  val set_anim_normals : t -> float Ctypes_static.carray -> unit
  val set_bone_ids : t -> int Ctypes_static.carray -> unit
  val set_bone_weights : t -> float Ctypes_static.carray -> unit
end

module ShaderLoc : sig
  type t = int
end

module Shader : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val shader : Unsigned.UInt.t -> ShaderLoc.t CArray.t -> t
  val id : t -> Unsigned.UInt.t
  val locs : t -> ShaderLoc.t CArray.t
  val set_loc : t -> ShaderLocationIndex.t -> ShaderLoc.t -> unit
  val set_locs : t -> ShaderLoc.t CArray.t -> unit
end

module MaterialMap : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Texture.t -> Color.t -> float -> t
  (** [create texture color value] *)

  val texture : t -> Texture.t
  (** Material map texture *)

  val color : t -> Color.t
  (** Material map color *)

  val value : t -> float
  (** Material map value *)

  val set_texture : t -> Texture.t -> unit
  val set_color : t -> Color.t -> unit
  val set_value : t -> float -> unit
end

module Material : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val shader : t -> Shader.t
  (** Material shader *)

  val maps : t -> MaterialMap.t CArray.t
  (** Material maps array (MAX_MATERIAL_MAPS) *)

  val params : t -> float Ctypes_static.carray
  (** Material generic parameters (if required) *)

  val set_shader : t -> Shader.t -> unit
  val set_maps : t -> MaterialMap.t CArray.t -> unit
  val set_params : t -> float -> float -> float -> float -> unit
end

module Transform : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Vector3.t -> Vector4.t -> Vector3.t -> t
  (** [create translation rotation scale] *)

  val translation : t -> Vector3.t
  (** Translation *)

  val rotation : t -> Vector4.t
  (** Rotation *)

  val scale : t -> Vector3.t
  (** Scale *)

  val set_translation : t -> Vector3.t -> unit
  val set_rotation : t -> Vector4.t -> unit
  val set_scale : t -> Vector3.t -> unit
end

module BoneInfo : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val parent : t -> int
  (** Bone parent *)

  val set_parent : t -> int -> unit
end

module Model : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val transform : t -> Matrix.t
  (** Local transform matrix *)

  val meshes : t -> Mesh.t CArray.t
  (** Meshes array *)

  val materials : t -> Material.t CArray.t
  (** Materials array *)

  val bones : t -> BoneInfo.t CArray.t
  (** Bones information (skeleton) *)

  val bind_pose : t -> Transform.t ptr
  (** Bones base transformation (pose) *)

  val set_transform : t -> Matrix.t -> unit
  val set_meshes : t -> Mesh.t CArray.t -> unit
  val set_materials : t -> Material.t CArray.t -> unit
  val set_bones : t -> BoneInfo.t CArray.t -> unit
  val set_bind_pose : t -> Transform.t ptr -> unit
end

module ModelAnimation : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val bones : t -> BoneInfo.t CArray.t
  (** Bones information (skeleton) *)

  val frame_count : t -> int

  val frame_poses_at : t -> int -> Transform.t CArray.t
  (** Poses array by frame *)

  val set_bones : t -> BoneInfo.t CArray.t -> unit
end

module Ray : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Vector3.t -> Vector3.t -> t
  (** [create position direction] *)

  val position : t -> Vector3.t
  (** Ray position (origin) *)

  val direction : t -> Vector3.t
  (** Ray direction *)

  val set_position : t -> Vector3.t -> unit
  val set_direction : t -> Vector3.t -> unit
end

module RayCollision : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val hit : t -> bool
  (** Did the ray hit something? *)

  val distance : t -> float
  (** Distance to the nearest hit *)

  val point : t -> Vector3.t
  (** Point of the nearest hit *)

  val normal : t -> Vector3.t
  (** Surface normal of hit *)

  val set_hit : t -> bool -> unit
  val set_distance : t -> float -> unit
  val set_point : t -> Vector3.t -> unit
  val set_normal : t -> Vector3.t -> unit
end

module BoundingBox : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : Vector3.t -> Vector3.t -> t
  (** [create min max] *)

  val min : t -> Vector3.t
  (** Minimum vertex box-corner *)

  val max : t -> Vector3.t
  (** Maximum vertex box-corner *)

  val set_min : t -> Vector3.t -> unit
  val set_max : t -> Vector3.t -> unit
end

module Wave : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val sample_rate : t -> Unsigned.uint
  (** Frequency (samples per second) *)

  val sample_size : t -> Unsigned.uint
  (** Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)

  val channels : t -> Unsigned.uint
  (** Number of channels (1-mono, 2-stereo, ...) *)

  val set_sample_rate : t -> Unsigned.uint -> unit
  val set_sample_size : t -> Unsigned.uint -> unit
  val set_channels : t -> Unsigned.uint -> unit
end

module AudioStream : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val sample_rate : t -> Unsigned.uint
  (** Frequency (samples per second) *)

  val sample_size : t -> Unsigned.uint
  (** Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)

  val channels : t -> Unsigned.uint
  (** Number of channels (1-mono, 2-stereo, ...) *)

  val set_sample_rate : t -> Unsigned.uint -> unit
  val set_sample_size : t -> Unsigned.uint -> unit
  val set_channels : t -> Unsigned.uint -> unit
end

module Sound : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val stream : t -> AudioStream.t
  (** Audio stream *)

  val set_stream : t -> AudioStream.t -> unit
end

module Music : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val stream : t -> AudioStream.t
  (** Audio stream *)

  val looping : t -> bool
  (** Music looping enable *)

  val ctx_type : t -> int
  (** Type of music context (audio filetype) *)

  val set_stream : t -> AudioStream.t -> unit
  val set_looping : t -> bool -> unit
  val set_ctx_type : t -> int -> unit
end

module VrDeviceInfo : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val create : unit -> t

  val h_resolution : t -> int
  (** Horizontal resolution in pixels *)

  val v_resolution : t -> int
  (** Vertical resolution in pixels *)

  val h_screen_size : t -> float
  (** Horizontal size in meters *)

  val v_screen_size : t -> float
  (** Vertical size in meters *)

  val v_screen_center : t -> float
  (** Screen center in meters *)

  val eye_to_screen_distance : t -> float
  (** Distance between eye and display in meters *)

  val lens_separation_distance : t -> float
  (** Lens separation distance in meters *)

  val interpupillary_distance : t -> float
  (** IPD (distance between pupils) in meters *)

  val lens_distortion_values : t -> float Ctypes_static.carray
  (** Lens distortion constant parameters *)

  val chroma_ab_correction : t -> float Ctypes_static.carray
  (** Chromatic aberration correction parameters *)

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

module VrStereoConfig : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val projection : t -> Matrix.t Ctypes_static.carray
  (** VR projection matrices (per eye) *)

  val view_offset : t -> Matrix.t Ctypes_static.carray
  (** VR view offset matrices (per eye) *)

  val left_lens_center : t -> float Ctypes_static.carray
  (** VR left lens center *)

  val right_lens_center : t -> float Ctypes_static.carray
  (** VR right lens center *)

  val left_screen_center : t -> float Ctypes_static.carray
  (** VR left screen center *)

  val right_screen_center : t -> float Ctypes_static.carray
  (** VR right screen center *)

  val scale : t -> float Ctypes_static.carray
  (** VR distortion scale *)

  val scale_in : t -> float Ctypes_static.carray
  (** VR distortion scale in *)

  val set_projection : t -> Matrix.t -> Matrix.t -> unit
  val set_view_offset : t -> Matrix.t -> Matrix.t -> unit
  val set_left_lens_center : t -> float -> float -> unit
  val set_right_lens_center : t -> float -> float -> unit
  val set_left_screen_center : t -> float -> float -> unit
  val set_right_screen_center : t -> float -> float -> unit
  val set_scale : t -> float -> float -> unit
  val set_scale_in : t -> float -> float -> unit
end

module FilePathList : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val files : t -> string list
end

module AutomationEvent : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
end

module AutomationEventList : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
end

(** {1 Functions}*)

val init_window : int -> int -> string -> unit
(** [init_window width height title] Initialize window and OpenGL context*)

val close_window : unit -> unit
(** [close_window ()] Close window and unload OpenGL context*)

val window_should_close : unit -> bool
(** [window_should_close ()] Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)*)

val is_window_ready : unit -> bool
(** [is_window_ready ()] Check if window has been initialized successfully*)

val is_window_fullscreen : unit -> bool
(** [is_window_fullscreen ()] Check if window is currently fullscreen*)

val is_window_hidden : unit -> bool
(** [is_window_hidden ()] Check if window is currently hidden (only PLATFORM_DESKTOP)*)

val is_window_minimized : unit -> bool
(** [is_window_minimized ()] Check if window is currently minimized (only PLATFORM_DESKTOP)*)

val is_window_maximized : unit -> bool
(** [is_window_maximized ()] Check if window is currently maximized (only PLATFORM_DESKTOP)*)

val is_window_focused : unit -> bool
(** [is_window_focused ()] Check if window is currently focused (only PLATFORM_DESKTOP)*)

val is_window_resized : unit -> bool
(** [is_window_resized ()] Check if window has been resized last frame*)

val is_window_state : ConfigFlags.t -> bool
(** [is_window_state flag] Check if one specific window flag is enabled*)

val set_window_state : ConfigFlags.t list -> unit
(** [set_window_state flags] Set window configuration state using flags (only PLATFORM_DESKTOP)*)

val clear_window_state : ConfigFlags.t list -> unit
(** [clear_window_state flags] Clear window configuration state flags*)

val toggle_fullscreen : unit -> unit
(** [toggle_fullscreen ()] Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)*)

val toggle_borderless_windowed : unit -> unit
(** [toggle_borderless_windowed ()] Toggle window state: borderless windowed (only PLATFORM_DESKTOP)*)

val maximize_window : unit -> unit
(** [maximize_window ()] Set window state: maximized, if resizable (only PLATFORM_DESKTOP)*)

val minimize_window : unit -> unit
(** [minimize_window ()] Set window state: minimized, if resizable (only PLATFORM_DESKTOP)*)

val restore_window : unit -> unit
(** [restore_window ()] Set window state: not minimized/maximized (only PLATFORM_DESKTOP)*)

val set_window_icon : Image.t -> unit
(** [set_window_icon image] Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)*)

val set_window_icons : Image.t ptr -> int -> unit
(** [set_window_icons images count] Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)*)

val set_window_title : string -> unit
(** [set_window_title title] Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)*)

val set_window_position : int -> int -> unit
(** [set_window_position x y] Set window position on screen (only PLATFORM_DESKTOP)*)

val set_window_monitor : int -> unit
(** [set_window_monitor monitor] Set monitor for the current window*)

val set_window_min_size : int -> int -> unit
(** [set_window_min_size width height] Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)*)

val set_window_max_size : int -> int -> unit
(** [set_window_max_size width height] Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)*)

val set_window_size : int -> int -> unit
(** [set_window_size width height] Set window dimensions*)

val set_window_opacity : float -> unit
(** [set_window_opacity opacity] Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)*)

val set_window_focused : unit -> unit
(** [set_window_focused ()] Set window focused (only PLATFORM_DESKTOP)*)

val get_window_handle : unit -> unit ptr option
(** [get_window_handle ()] Get native window handle*)

val get_screen_width : unit -> int
(** [get_screen_width ()] Get current screen width*)

val get_screen_height : unit -> int
(** [get_screen_height ()] Get current screen height*)

val get_render_width : unit -> int
(** [get_render_width ()] Get current render width (it considers HiDPI)*)

val get_render_height : unit -> int
(** [get_render_height ()] Get current render height (it considers HiDPI)*)

val get_monitor_count : unit -> int
(** [get_monitor_count ()] Get number of connected monitors*)

val get_current_monitor : unit -> int
(** [get_current_monitor ()] Get current connected monitor*)

val get_monitor_position : int -> Vector2.t
(** [get_monitor_position monitor] Get specified monitor position*)

val get_monitor_width : int -> int
(** [get_monitor_width monitor] Get specified monitor width (current video mode used by monitor)*)

val get_monitor_height : int -> int
(** [get_monitor_height monitor] Get specified monitor height (current video mode used by monitor)*)

val get_monitor_physical_width : int -> int
(** [get_monitor_physical_width monitor] Get specified monitor physical width in millimetres*)

val get_monitor_physical_height : int -> int
(** [get_monitor_physical_height monitor] Get specified monitor physical height in millimetres*)

val get_monitor_refresh_rate : int -> int
(** [get_monitor_refresh_rate monitor] Get specified monitor refresh rate*)

val get_window_position : unit -> Vector2.t
(** [get_window_position ()] Get window position XY on monitor*)

val get_window_scale_dpi : unit -> Vector2.t
(** [get_window_scale_dpi ()] Get window scale DPI factor*)

val get_monitor_name : int -> string
(** [get_monitor_name monitor] Get the human-readable, UTF-8 encoded name of the specified monitor*)

val set_clipboard_text : string -> unit
(** [set_clipboard_text text] Set clipboard text content*)

val get_clipboard_text : unit -> string option
(** [get_clipboard_text ()] Get clipboard text content*)

val enable_event_waiting : unit -> unit
(** [enable_event_waiting ()] Enable waiting for events on EndDrawing(), no automatic event polling*)

val disable_event_waiting : unit -> unit
(** [disable_event_waiting ()] Disable waiting for events on EndDrawing(), automatic events polling*)

(** {3 Cursor-related functions} *)

val show_cursor : unit -> unit
(** [show_cursor ()] Shows cursor*)

val hide_cursor : unit -> unit
(** [hide_cursor ()] Hides cursor*)

val is_cursor_hidden : unit -> bool
(** [is_cursor_hidden ()] Check if cursor is not visible*)

val enable_cursor : unit -> unit
(** [enable_cursor ()] Enables cursor (unlock cursor)*)

val disable_cursor : unit -> unit
(** [disable_cursor ()] Disables cursor (lock cursor)*)

val is_cursor_on_screen : unit -> bool
(** [is_cursor_on_screen ()] Check if cursor is on the screen*)

val clear_background : Color.t -> unit
(** [clear_background color] Set background color (framebuffer clear color)*)

val begin_drawing : unit -> unit
(** [begin_drawing ()] Setup canvas (framebuffer) to start drawing*)

val end_drawing : unit -> unit
(** [end_drawing ()] End canvas drawing and swap buffers (double buffering)*)

val begin_mode_2d : Camera2D.t -> unit
(** [begin_mode_2d camera] Begin 2D mode with custom camera (2D)*)

val end_mode_2d : unit -> unit
(** [end_mode_2d ()] Ends 2D mode with custom camera*)

val begin_mode_3d : Camera3D.t -> unit
(** [begin_mode_3d camera] Begin 3D mode with custom camera (3D)*)

val end_mode_3d : unit -> unit
(** [end_mode_3d ()] Ends 3D mode and returns to default 2D orthographic mode*)

val begin_texture_mode : RenderTexture.t -> unit
(** [begin_texture_mode target] Begin drawing to render texture*)

val end_texture_mode : unit -> unit
(** [end_texture_mode ()] Ends drawing to render texture*)

val begin_shader_mode : Shader.t -> unit
(** [begin_shader_mode shader] Begin custom shader drawing*)

val end_shader_mode : unit -> unit
(** [end_shader_mode ()] End custom shader drawing (use default shader)*)

val begin_blend_mode : BlendMode.t -> unit
(** [begin_blend_mode mode] Begin blending mode (alpha, additive, multiplied, subtract, custom)*)

val end_blend_mode : unit -> unit
(** [end_blend_mode ()] End blending mode (reset to default: alpha blending)*)

val begin_scissor_mode : int -> int -> int -> int -> unit
(** [begin_scissor_mode x y width height] Begin scissor mode (define screen area for following drawing)*)

val end_scissor_mode : unit -> unit
(** [end_scissor_mode ()] End scissor mode*)

val begin_vr_stereo_mode : VrStereoConfig.t -> unit
(** [begin_vr_stereo_mode config] Begin stereo rendering (requires VR simulator)*)

val end_vr_stereo_mode : unit -> unit
(** [end_vr_stereo_mode ()] End stereo rendering (requires VR simulator)*)

val load_vr_stereo_config : VrDeviceInfo.t -> VrStereoConfig.t
(** [load_vr_stereo_config device] Load VR stereo config for VR simulator device parameters*)

val unload_vr_stereo_config : VrStereoConfig.t -> unit
(** [unload_vr_stereo_config config] Unload VR stereo config*)

val load_shader : string -> string -> Shader.t
(** [load_shader vs_file_name fs_file_name] Load shader from files and bind default locations*)

val load_shader_from_memory : string -> string -> Shader.t
(** [load_shader_from_memory vs_code fs_code] Load shader from code strings and bind default locations*)

val is_shader_ready : Shader.t -> bool
(** [is_shader_ready shader] Check if a shader is ready*)

val get_shader_location : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location shader uniform_name] Get shader uniform location*)

val get_shader_location_attrib : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location_attrib shader attrib_name] Get shader attribute location*)

val set_shader_value :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> unit
(** [set_shader_value shader loc_index value uniform_type] Set shader uniform value*)

val set_shader_value_v :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> int -> unit
(** [set_shader_value_v shader loc_index value uniform_type count] Set shader uniform value vector*)

val set_shader_value_matrix : Shader.t -> ShaderLoc.t -> Matrix.t -> unit
(** [set_shader_value_matrix shader loc_index mat] Set shader uniform value (matrix 4x4)*)

val set_shader_value_texture : Shader.t -> ShaderLoc.t -> Texture.t -> unit
(** [set_shader_value_texture shader loc_index texture] Set shader uniform value for texture (sampler2d)*)

val unload_shader : Shader.t -> unit
(** [unload_shader shader] Unload shader from GPU memory (VRAM)*)

(** {3 Screen-space-related functions} *)

val get_mouse_ray : Vector2.t -> Camera3D.t -> Ray.t
(** [get_mouse_ray mouse_position camera] Get a ray trace from mouse position*)

val get_camera_matrix : Camera3D.t -> Matrix.t
(** [get_camera_matrix camera] Get camera transform matrix (view matrix)*)

val get_camera_matrix_2d : Camera2D.t -> Matrix.t
(** [get_camera_matrix_2d camera] Get camera 2d transform matrix*)

val get_world_to_screen : Vector3.t -> Camera3D.t -> Vector2.t
(** [get_world_to_screen position camera] Get the screen space position for a 3d world space position*)

val get_screen_to_world_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_screen_to_world_2d position camera] Get the world space position for a 2d camera screen space position*)

val get_world_to_screen_ex : Vector3.t -> Camera3D.t -> int -> int -> Vector2.t
(** [get_world_to_screen_ex position camera width height] Get size position for a 3d world space position*)

val get_world_to_screen_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_world_to_screen_2d position camera] Get the screen space position for a 2d camera world space position*)

val set_target_fps : int -> unit
(** [set_target_fps fps] Set target FPS (maximum)*)

val get_frame_time : unit -> float
(** [get_frame_time ()] Get time in seconds for last frame drawn (delta time)*)

val get_time : unit -> float
(** [get_time ()] Get elapsed time in seconds since InitWindow()*)

val get_fps : unit -> int
(** [get_fps ()] Get current FPS*)

val swap_screen_buffer : unit -> unit
(** [swap_screen_buffer ()] Swap back buffer with front buffer (screen drawing)*)

val poll_input_events : unit -> unit
(** [poll_input_events ()] Register all input events*)

val wait_time : float -> unit
(** [wait_time seconds] Wait for some time (halt program execution)*)

val set_random_seed : Unsigned.uint -> unit
(** [set_random_seed seed] Set the seed for the random number generator*)

val get_random_value : int -> int -> int
(** [get_random_value min max] Get a random value between min and max (both included)*)

val take_screenshot : string -> unit
(** [take_screenshot file_name] Takes a screenshot of current screen (filename extension defines format)*)

val set_config_flags : ConfigFlags.t list -> unit
(** [set_config_flags flags] Setup init configuration flags (view FLAGS)*)

val open_url : string -> unit
(** [open_url url] Open URL with default system browser (if available)*)

val trace_log : int -> string -> unit
(** [trace_log log_level text args] Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)*)

val set_trace_log_level : TraceLogLevel.t -> unit
(** [set_trace_log_level log_level] Set the current threshold (minimum) log level*)

val mem_alloc : int -> unit ptr
(** [mem_alloc size] Internal memory allocator*)

val mem_realloc : unit ptr -> int -> unit ptr
(** [mem_realloc ptr size] Internal memory reallocator*)

val mem_free : unit ptr -> unit
(** [mem_free ptr] Internal memory free*)

val load_file_data : string -> Unsigned.uchar CArray.t
(** [load_file_data file_name data_size] Load file data as byte array (read)*)

val unload_file_data : string -> unit
(** [unload_file_data data] Unload file data allocated by LoadFileData()*)

val save_file_data : string -> 'a CArray.t -> bool
(** [save_file_data file_name data bytes_to_write] Save data to file from byte array (write), returns true on success*)

val export_data_as_code : string -> string -> bool
(** [export_data_as_code data filename] Export data to code (.h), returns true on success*)

val load_file_text : string -> string
(** [load_file_text file_name] Load text data from file (read), returns a '\0' terminated string*)

val unload_file_text : string -> unit
(** [unload_file_text text] Unload file text data allocated by LoadFileText()*)

val save_file_text : string -> string -> bool
(** [save_file_text file_name text] Save text data to file (write), string must be ' 0' terminated, returns true on success*)

val file_exists : string -> bool
(** [file_exists file_name] Check if file exists*)

val directory_exists : string -> bool
(** [directory_exists dir_path] Check if a directory path exists*)

val is_file_extension : string -> string -> bool
(** [is_file_extension file_name ext] Check file extension (including point: .png, .wav)*)

val get_file_length : string -> int
(** [get_file_length file_name] Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)*)

val get_file_extension : string -> string
(** [get_file_extension file_name] Get pointer to extension for a filename string (includes dot: '.png')*)

val get_file_name : string -> string
(** [get_file_name file_path] Get pointer to filename for a path string*)

val get_file_name_without_ext : string -> string
(** [get_file_name_without_ext file_path] Get filename string without extension (uses static string)*)

val get_directory_path : string -> string
(** [get_directory_path file_path] Get full path for a given fileName with path (uses static string)*)

val get_prev_directory_path : string -> string
(** [get_prev_directory_path dir_path] Get previous directory path for a given path (uses static string)*)

val get_working_directory : unit -> string
(** [get_working_directory ()] Get current working directory (uses static string)*)

val get_application_directory : unit -> string
(** [get_application_directory ()] Get the directory of the running application (uses static string)*)

val change_directory : string -> bool
(** [change_directory dir] Change working directory, return true on success*)

val is_path_file : string -> bool
(** [is_path_file path] Check if a given path is a file or a directory*)

val load_directory_files : string -> FilePathList.t
(** [load_directory_files dir_path] Load directory filepaths*)

val load_directory_files_ex : string -> string -> bool -> FilePathList.t
(** [load_directory_files_ex base_path filter scan_subdirs] Load directory filepaths with extension filtering and recursive directory scan*)

val unload_directory_files : FilePathList.t -> unit
(** [unload_directory_files files] Unload filepaths*)

val is_file_dropped : unit -> bool
(** [is_file_dropped ()] Check if a file has been dropped into window*)

val load_dropped_files : unit -> FilePathList.t
(** [load_dropped_files ()] Load dropped filepaths*)

val unload_dropped_files : FilePathList.t -> unit
(** [unload_dropped_files files] Unload dropped filepaths*)

val get_file_mod_time : string -> Signed.Long.t
(** [get_file_mod_time file_name] Get file modification time (last write time)*)

val compress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [compress_data data data_length comp_data_length] Compress data (DEFLATE algorithm)*)

val decompress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [decompress_data comp_data comp_data_length data_length] Decompress data (DEFLATE algorithm)*)

val load_automation_event_list : string -> AutomationEventList.t
(** [load_automation_event_list file_name] Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS*)

val unload_automation_event_list : AutomationEventList.t ptr -> unit
(** [unload_automation_event_list list] Unload automation events list from file*)

val export_automation_event_list : AutomationEventList.t -> string -> bool
(** [export_automation_event_list list file_name] Export automation events list as text file*)

val set_automation_event_list : AutomationEventList.t ptr -> unit
(** [set_automation_event_list list] Set automation event list to record to*)

val set_automation_event_base_frame : int -> unit
(** [set_automation_event_base_frame frame] Set automation event internal base frame to start recording*)

val start_automation_event_recording : unit -> unit
(** [start_automation_event_recording ()] Start recording automation events (AutomationEventList must be set)*)

val stop_automation_event_recording : unit -> unit
(** [stop_automation_event_recording ()] Stop recording automation events*)

val play_automation_event : AutomationEvent.t -> unit
(** [play_automation_event event] Play a recorded automation event*)

val is_key_pressed : Key.t -> bool
(** [is_key_pressed key] Check if a key has been pressed once*)

val is_key_pressed_repeat : Key.t -> bool
(** [is_key_pressed_repeat key] Check if a key has been pressed again (Only PLATFORM_DESKTOP)*)

val is_key_down : Key.t -> bool
(** [is_key_down key] Check if a key is being pressed*)

val is_key_released : Key.t -> bool
(** [is_key_released key] Check if a key has been released once*)

val is_key_up : Key.t -> bool
(** [is_key_up key] Check if a key is NOT being pressed*)

val get_key_pressed : unit -> Key.t
(** [get_key_pressed ()] Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty*)

val get_char_pressed : unit -> Uchar.t
(** [get_char_pressed ()] Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty*)

val set_exit_key : Key.t -> unit
(** [set_exit_key key] Set a custom key to exit program (default is ESC)*)

val is_gamepad_available : int -> bool
(** [is_gamepad_available gamepad] Check if a gamepad is available*)

val get_gamepad_name : int -> string
(** [get_gamepad_name gamepad] Get gamepad internal name id*)

val is_gamepad_button_pressed : int -> GamepadButton.t -> bool
(** [is_gamepad_button_pressed gamepad button] Check if a gamepad button has been pressed once*)

val is_gamepad_button_down : int -> GamepadButton.t -> bool
(** [is_gamepad_button_down gamepad button] Check if a gamepad button is being pressed*)

val is_gamepad_button_released : int -> GamepadButton.t -> bool
(** [is_gamepad_button_released gamepad button] Check if a gamepad button has been released once*)

val is_gamepad_button_up : int -> GamepadButton.t -> bool
(** [is_gamepad_button_up gamepad button] Check if a gamepad button is NOT being pressed*)

val get_gamepad_button_pressed : unit -> GamepadButton.t
(** [get_gamepad_button_pressed ()] Get the last gamepad button pressed*)

val get_gamepad_axis_count : int -> int
(** [get_gamepad_axis_count gamepad] Get gamepad axis count for a gamepad*)

val get_gamepad_axis_movement : int -> GamepadAxis.t -> float
(** [get_gamepad_axis_movement gamepad axis] Get axis movement value for a gamepad axis*)

val set_gamepad_mappings : string -> int
(** [set_gamepad_mappings mappings] Set internal gamepad mappings (SDL_GameControllerDB)*)

val is_mouse_button_pressed : MouseButton.t -> bool
(** [is_mouse_button_pressed button] Check if a mouse button has been pressed once*)

val is_mouse_button_down : MouseButton.t -> bool
(** [is_mouse_button_down button] Check if a mouse button is being pressed*)

val is_mouse_button_released : MouseButton.t -> bool
(** [is_mouse_button_released button] Check if a mouse button has been released once*)

val is_mouse_button_up : MouseButton.t -> bool
(** [is_mouse_button_up button] Check if a mouse button is NOT being pressed*)

val get_mouse_x : unit -> int
(** [get_mouse_x ()] Get mouse position X*)

val get_mouse_y : unit -> int
(** [get_mouse_y ()] Get mouse position Y*)

val get_mouse_position : unit -> Vector2.t
(** [get_mouse_position ()] Get mouse position XY*)

val get_mouse_delta : unit -> Vector2.t
(** [get_mouse_delta ()] Get mouse delta between frames*)

val set_mouse_position : int -> int -> unit
(** [set_mouse_position x y] Set mouse position XY*)

val set_mouse_offset : int -> int -> unit
(** [set_mouse_offset offset_x offset_y] Set mouse offset*)

val set_mouse_scale : float -> float -> unit
(** [set_mouse_scale scale_x scale_y] Set mouse scaling*)

val get_mouse_wheel_move : unit -> float
(** [get_mouse_wheel_move ()] Get mouse wheel movement for X or Y, whichever is larger*)

val get_mouse_wheel_move_v : unit -> Vector2.t
(** [get_mouse_wheel_move_v ()] Get mouse wheel movement for both X and Y*)

val set_mouse_cursor : MouseCursor.t -> unit
(** [set_mouse_cursor cursor] Set mouse cursor*)

val get_touch_x : unit -> int
(** [get_touch_x ()] Get touch position X for touch point 0 (relative to screen size)*)

val get_touch_y : unit -> int
(** [get_touch_y ()] Get touch position Y for touch point 0 (relative to screen size)*)

val get_touch_position : int -> Vector2.t
(** [get_touch_position index] Get touch position XY for a touch point index (relative to screen size)*)

val get_touch_point_id : int -> int
(** [get_touch_point_id index] Get touch point identifier for given index*)

val get_touch_point_count : unit -> int
(** [get_touch_point_count ()] Get number of touch points*)

val set_gestures_enabled : Gesture.t list -> unit
(** [set_gestures_enabled flags] Enable a set of gestures using flags*)

val is_gesture_detected : Gesture.t -> bool
(** [is_gesture_detected gesture] Check if a gesture have been detected*)

val get_gesture_detected : unit -> Gesture.t
(** [get_gesture_detected ()] Get latest detected gesture*)

val get_gesture_hold_duration : unit -> float
(** [get_gesture_hold_duration ()] Get gesture hold time in milliseconds*)

val get_gesture_drag_vector : unit -> Vector2.t
(** [get_gesture_drag_vector ()] Get gesture drag vector*)

val get_gesture_drag_angle : unit -> float
(** [get_gesture_drag_angle ()] Get gesture drag angle*)

val get_gesture_pinch_vector : unit -> Vector2.t
(** [get_gesture_pinch_vector ()] Get gesture pinch delta*)

val get_gesture_pinch_angle : unit -> float
(** [get_gesture_pinch_angle ()] Get gesture pinch angle*)

val update_camera : Camera3D.t ptr -> CameraMode.t -> unit
(** [update_camera camera mode] Update camera position for selected mode*)

val update_camera_pro :
  Camera3D.t ptr -> Vector3.t -> Vector3.t -> float -> unit
(** [update_camera_pro camera movement rotation zoom] Update camera movement/rotation*)

val set_shapes_texture : Texture.t -> Rectangle.t -> unit
(** [set_shapes_texture texture source] Set texture and rectangle to be used on shapes drawing*)

val draw_pixel : int -> int -> Color.t -> unit
(** [draw_pixel pos_x pos_y color] Draw a pixel*)

val draw_pixel_v : Vector2.t -> Color.t -> unit
(** [draw_pixel_v position color] Draw a pixel (Vector version)*)

val draw_line : int -> int -> int -> int -> Color.t -> unit
(** [draw_line start_pos_x start_pos_y end_pos_x end_pos_y color] Draw a line*)

val draw_line_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_line_v start_pos end_pos color] Draw a line (Vector version)*)

val draw_line_ex : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_ex start_pos end_pos thick color] Draw a line (using triangles/quads)*)

val draw_line_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_line_strip points point_count color] Draw lines sequence (using gl lines)*)

val draw_line_bezier : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_bezier start_pos end_pos thick color] Draw line segment cubic-bezier in-out interpolation*)

val draw_circle : int -> int -> float -> Color.t -> unit
(** [draw_circle center_x center_y radius color] Draw a color-filled circle*)

val draw_circle_sector :
  Vector2.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_circle_sector center radius start_angle end_angle segments color] Draw a piece of a circle*)

val draw_circle_sector_lines :
  Vector2.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_circle_sector_lines center radius start_angle end_angle segments color] Draw circle sector outline*)

val draw_circle_gradient : int -> int -> float -> Color.t -> Color.t -> unit
(** [draw_circle_gradient center_x center_y radius color1 color2] Draw a gradient-filled circle*)

val draw_circle_v : Vector2.t -> float -> Color.t -> unit
(** [draw_circle_v center radius color] Draw a color-filled circle (Vector version)*)

val draw_circle_lines : int -> int -> float -> Color.t -> unit
(** [draw_circle_lines center_x center_y radius color] Draw circle outline*)

val draw_circle_lines_v : Vector2.t -> float -> Color.t -> unit
(** [draw_circle_lines_v center radius color] Draw circle outline (Vector version)*)

val draw_ellipse : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse center_x center_y radius_h radius_v color] Draw ellipse*)

val draw_ellipse_lines : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse_lines center_x center_y radius_h radius_v color] Draw ellipse outline*)

val draw_ring :
  Vector2.t -> float -> float -> float -> float -> int -> Color.t -> unit
(** [draw_ring center inner_radius outer_radius start_angle end_angle segments color] Draw ring*)

val draw_ring_lines :
  Vector2.t -> float -> float -> float -> float -> int -> Color.t -> unit
(** [draw_ring_lines center inner_radius outer_radius start_angle end_angle segments color] Draw ring outline*)

val draw_rectangle : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle pos_x pos_y width height color] Draw a color-filled rectangle*)

val draw_rectangle_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_rectangle_v position size color] Draw a color-filled rectangle (Vector version)*)

val draw_rectangle_rec : Rectangle.t -> Color.t -> unit
(** [draw_rectangle_rec rec color] Draw a color-filled rectangle*)

val draw_rectangle_pro : Rectangle.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_rectangle_pro rec origin rotation color] Draw a color-filled rectangle with pro parameters*)

val draw_rectangle_gradient_v :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_v pos_x pos_y width height color1 color2] Draw a vertical-gradient-filled rectangle*)

val draw_rectangle_gradient_h :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_h pos_x pos_y width height color1 color2] Draw a horizontal-gradient-filled rectangle*)

val draw_rectangle_gradient_ex :
  Rectangle.t -> Color.t -> Color.t -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_ex rec col1 col2 col3 col4] Draw a gradient-filled rectangle with custom vertex colors*)

val draw_rectangle_lines : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle_lines pos_x pos_y width height color] Draw rectangle outline*)

val draw_rectangle_lines_ex : Rectangle.t -> float -> Color.t -> unit
(** [draw_rectangle_lines_ex rec line_thick color] Draw rectangle outline with extended parameters*)

val draw_rectangle_rounded : Rectangle.t -> float -> int -> Color.t -> unit
(** [draw_rectangle_rounded rec roundness segments color] Draw rectangle with rounded edges*)

val draw_rectangle_rounded_lines :
  Rectangle.t -> float -> int -> float -> Color.t -> unit
(** [draw_rectangle_rounded_lines rec roundness segments line_thick color] Draw rectangle with rounded edges outline*)

val draw_triangle : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle v1 v2 v3 color] Draw a color-filled triangle (vertex in counter-clockwise order!)*)

val draw_triangle_lines : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle_lines v1 v2 v3 color] Draw triangle outline (vertex in counter-clockwise order!)*)

val draw_triangle_fan : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_fan points point_count color] Draw a triangle fan defined by points (first vertex is the center)*)

val draw_triangle_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip points point_count color] Draw a triangle strip defined by points*)

val draw_poly : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly center sides radius rotation color] Draw a regular polygon (Vector version)*)

val draw_poly_lines : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly_lines center sides radius rotation color] Draw a polygon outline of n sides*)

val draw_poly_lines_ex :
  Vector2.t -> int -> float -> float -> float -> Color.t -> unit
(** [draw_poly_lines_ex center sides radius rotation line_thick color] Draw a polygon outline of n sides with extended parameters*)

val draw_spline_linear : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_linear points point_count thick color] Draw spline: Linear, minimum 2 points*)

val draw_spline_basis : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_basis points point_count thick color] Draw spline: B-Spline, minimum 4 points*)

val draw_spline_catmull_rom : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_catmull_rom points point_count thick color] Draw spline: Catmull-Rom, minimum 4 points*)

val draw_spline_bezier_quadratic :
  Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_bezier_quadratic points point_count thick color] Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]*)

val draw_spline_bezier_cubic : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_bezier_cubic points point_count thick color] Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]*)

val draw_spline_segment_linear :
  Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_linear p1 p2 thick color] Draw spline segment: Linear, 2 points*)

val draw_spline_segment_basis :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_basis p1 p2 p3 p4 thick color] Draw spline segment: B-Spline, 4 points*)

val draw_spline_segment_catmull_rom :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_catmull_rom p1 p2 p3 p4 thick color] Draw spline segment: Catmull-Rom, 4 points*)

val draw_spline_segment_bezier_quadratic :
  Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_bezier_quadratic p1 c2 p3 thick color] Draw spline segment: Quadratic Bezier, 2 points, 1 control point*)

val draw_spline_segment_bezier_cubic :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_bezier_cubic p1 c2 c3 p4 thick color] Draw spline segment: Cubic Bezier, 2 points, 2 control points*)

val get_spline_point_linear : Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_linear start_pos end_pos t] Get (evaluate) spline point: Linear*)

val get_spline_point_basis :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_basis p1 p2 p3 p4 t] Get (evaluate) spline point: B-Spline*)

val get_spline_point_catmull_rom :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_catmull_rom p1 p2 p3 p4 t] Get (evaluate) spline point: Catmull-Rom*)

val get_spline_point_bezier_quad :
  Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_bezier_quad p1 c2 p3 t] Get (evaluate) spline point: Quadratic Bezier*)

val get_spline_point_bezier_cubic :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_bezier_cubic p1 c2 c3 p4 t] Get (evaluate) spline point: Cubic Bezier*)

(** {3 Basic shapes collision detection functions} *)

val check_collision_recs : Rectangle.t -> Rectangle.t -> bool
(** [check_collision_recs rec1 rec2] Check collision between two rectangles*)

val check_collision_circles : Vector2.t -> float -> Vector2.t -> float -> bool
(** [check_collision_circles center1 radius1 center2 radius2] Check collision between two circles*)

val check_collision_circle_rec : Vector2.t -> float -> Rectangle.t -> bool
(** [check_collision_circle_rec center radius rec] Check collision between circle and rectangle*)

val check_collision_point_rec : Vector2.t -> Rectangle.t -> bool
(** [check_collision_point_rec point rec] Check if point is inside rectangle*)

val check_collision_point_circle : Vector2.t -> Vector2.t -> float -> bool
(** [check_collision_point_circle point center radius] Check if point is inside circle*)

val check_collision_point_triangle :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> bool
(** [check_collision_point_triangle point p1 p2 p3] Check if point is inside a triangle*)

val check_collision_point_poly : Vector2.t -> Vector2.t ptr -> int -> bool
(** [check_collision_point_poly point points point_count] Check if point is within a polygon described by array of vertices*)

val check_collision_lines :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t ptr -> bool
(** [check_collision_lines start_pos1 end_pos1 start_pos2 end_pos2 collision_point] Check the collision between two lines defined by two points each, returns collision point by reference*)

val check_collision_point_line :
  Vector2.t -> Vector2.t -> Vector2.t -> int -> bool
(** [check_collision_point_line point p1 p2 threshold] Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]*)

val get_collision_rec : Rectangle.t -> Rectangle.t -> Rectangle.t
(** [get_collision_rec rec1 rec2] Get collision rectangle for two rectangles collision*)

val load_image : string -> Image.t
(** [load_image file_name] Load image from file into CPU memory (RAM)*)

val load_image_raw : string -> int -> int -> PixelFormat.t -> int -> Image.t
(** [load_image_raw file_name width height format header_size] Load image from RAW file data*)

val load_image_svg : string -> int -> int -> Image.t
(** [load_image_svg file_name_or_string width height] Load image from SVG file data or string with specified size*)

val load_image_anim : string -> int ptr -> Image.t
(** [load_image_anim file_name frames] Load image sequence from file (frames appended to image.data)*)

val load_image_from_memory : string -> string -> int -> Image.t
(** [load_image_from_memory file_type file_data data_size] Load image from memory buffer, fileType refers to extension: i.e. '.png'*)

val load_image_from_texture : Texture.t -> Image.t
(** [load_image_from_texture texture] Load image from GPU texture data*)

val load_image_from_screen : unit -> Image.t
(** [load_image_from_screen ()] Load image from screen buffer and (screenshot)*)

val is_image_ready : Image.t -> bool
(** [is_image_ready image] Check if an image is ready*)

val unload_image : Image.t -> unit
(** [unload_image image] Unload image from CPU memory (RAM)*)

val export_image : Image.t -> string -> bool
(** [export_image image file_name] Export image data to file, returns true on success*)

val export_image_to_memory : Image.t -> string -> int ptr -> string
(** [export_image_to_memory image file_type file_size] Export image to memory buffer*)

val export_image_as_code : Image.t -> string -> bool
(** [export_image_as_code image file_name] Export image as code file defining an array of bytes, returns true on success*)

val gen_image_color : int -> int -> Color.t -> Image.t
(** [gen_image_color width height color] Generate image: plain color*)

val gen_image_gradient_linear :
  int -> int -> int -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_linear width height direction start end] Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient*)

val gen_image_gradient_radial :
  int -> int -> float -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_radial width height density inner outer] Generate image: radial gradient*)

val gen_image_gradient_square :
  int -> int -> float -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_square width height density inner outer] Generate image: square gradient*)

val gen_image_checked :
  int -> int -> int -> int -> Color.t -> Color.t -> Image.t
(** [gen_image_checked width height checks_x checks_y col1 col2] Generate image: checked*)

val gen_image_white_noise : int -> int -> float -> Image.t
(** [gen_image_white_noise width height factor] Generate image: white noise*)

val gen_image_perlin_noise : int -> int -> int -> int -> float -> Image.t
(** [gen_image_perlin_noise width height offset_x offset_y scale] Generate image: perlin noise*)

val gen_image_cellular : int -> int -> int -> Image.t
(** [gen_image_cellular width height tile_size] Generate image: cellular algorithm, bigger tileSize means bigger cells*)

val gen_image_text : int -> int -> string -> Image.t
(** [gen_image_text width height text] Generate image: grayscale image from text data*)

(** {3 Image manipulation functions} *)

val image_copy : Image.t -> Image.t
(** [image_copy image] Create an image duplicate (useful for transformations)*)

val image_from_image : Image.t -> Rectangle.t -> Image.t
(** [image_from_image image rec] Create an image from another image piece*)

val image_text : string -> int -> Color.t -> Image.t
(** [image_text text font_size color] Create an image from text (default font)*)

val image_text_ex : Font.t -> string -> float -> float -> Color.t -> Image.t
(** [image_text_ex font text font_size spacing tint] Create an image from text (custom sprite font)*)

val image_format : Image.t ptr -> int -> unit
(** [image_format image new_format] Convert image data to desired format*)

val image_to_pot : Image.t ptr -> Color.t -> unit
(** [image_to_pot image fill] Convert image to POT (power-of-two)*)

val image_crop : Image.t ptr -> Rectangle.t -> unit
(** [image_crop image crop] Crop an image to a defined rectangle*)

val image_alpha_crop : Image.t ptr -> float -> unit
(** [image_alpha_crop image threshold] Crop image depending on alpha value*)

val image_alpha_clear : Image.t ptr -> Color.t -> float -> unit
(** [image_alpha_clear image color threshold] Clear alpha channel to desired color*)

val image_alpha_mask : Image.t ptr -> Image.t -> unit
(** [image_alpha_mask image alpha_mask] Apply alpha mask to image*)

val image_alpha_premultiply : Image.t ptr -> unit
(** [image_alpha_premultiply image] Premultiply alpha channel*)

val image_blur_gaussian : Image.t ptr -> int -> unit
(** [image_blur_gaussian image blur_size] Apply Gaussian blur using a box blur approximation*)

val image_resize : Image.t ptr -> int -> int -> unit
(** [image_resize image new_width new_height] Resize image (Bicubic scaling algorithm)*)

val image_resize_nn : Image.t ptr -> int -> int -> unit
(** [image_resize_nn image new_width new_height] Resize image (Nearest-Neighbor scaling algorithm)*)

val image_resize_canvas :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_resize_canvas image new_width new_height offset_x offset_y fill] Resize canvas and fill with color*)

val image_mipmaps : Image.t ptr -> unit
(** [image_mipmaps image] Compute all mipmap levels for a provided image*)

val image_dither : Image.t ptr -> int -> int -> int -> int -> unit
(** [image_dither image r_bpp g_bpp b_bpp a_bpp] Dither image data to 16bpp or lower (Floyd-Steinberg dithering)*)

val image_flip_vertical : Image.t ptr -> unit
(** [image_flip_vertical image] Flip image vertically*)

val image_flip_horizontal : Image.t ptr -> unit
(** [image_flip_horizontal image] Flip image horizontally*)

val image_rotate : Image.t ptr -> int -> unit
(** [image_rotate image degrees] Rotate image by input angle in degrees (-359 to 359)*)

val image_rotate_cw : Image.t ptr -> unit
(** [image_rotate_cw image] Rotate image clockwise 90deg*)

val image_rotate_ccw : Image.t ptr -> unit
(** [image_rotate_ccw image] Rotate image counter-clockwise 90deg*)

val image_color_tint : Image.t ptr -> Color.t -> unit
(** [image_color_tint image color] Modify image color: tint*)

val image_color_invert : Image.t ptr -> unit
(** [image_color_invert image] Modify image color: invert*)

val image_color_grayscale : Image.t ptr -> unit
(** [image_color_grayscale image] Modify image color: grayscale*)

val image_color_contrast : Image.t ptr -> float -> unit
(** [image_color_contrast image contrast] Modify image color: contrast (-100 to 100)*)

val image_color_brightness : Image.t ptr -> int -> unit
(** [image_color_brightness image brightness] Modify image color: brightness (-255 to 255)*)

val image_color_replace : Image.t ptr -> Color.t -> Color.t -> unit
(** [image_color_replace image color replace] Modify image color: replace color*)

val load_image_colors : Image.t -> Color.t ptr
(** [load_image_colors image] Load color data from image as a Color array (RGBA - 32bit)*)

val load_image_palette : Image.t -> int -> int ptr -> Color.t ptr
(** [load_image_palette image max_palette_size color_count] Load colors palette from image as a Color array (RGBA - 32bit)*)

val unload_image_colors : Color.t ptr -> unit
(** [unload_image_colors colors] Unload color data loaded with LoadImageColors()*)

val unload_image_palette : Color.t ptr -> unit
(** [unload_image_palette colors] Unload colors palette loaded with LoadImagePalette()*)

val get_image_alpha_border : Image.t -> float -> Rectangle.t
(** [get_image_alpha_border image threshold] Get image alpha border rectangle*)

val get_image_color : Image.t -> int -> int -> Color.t
(** [get_image_color image x y] Get image pixel color at (x, y) position*)

val image_clear_background : Image.t ptr -> Color.t -> unit
(** [image_clear_background dst color] Clear image background with given color*)

val image_draw_pixel : Image.t ptr -> int -> int -> Color.t -> unit
(** [image_draw_pixel dst pos_x pos_y color] Draw pixel within an image*)

val image_draw_pixel_v : Image.t ptr -> Vector2.t -> Color.t -> unit
(** [image_draw_pixel_v dst position color] Draw pixel within an image (Vector version)*)

val image_draw_line : Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_draw_line dst start_pos_x start_pos_y end_pos_x end_pos_y color] Draw line within an image*)

val image_draw_line_v : Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_line_v dst start end color] Draw line within an image (Vector version)*)

val image_draw_circle : Image.t ptr -> int -> int -> int -> Color.t -> unit
(** [image_draw_circle dst center_x center_y radius color] Draw a filled circle within an image*)

val image_draw_circle_v : Image.t ptr -> Vector2.t -> int -> Color.t -> unit
(** [image_draw_circle_v dst center radius color] Draw a filled circle within an image (Vector version)*)

val image_draw_circle_lines :
  Image.t ptr -> int -> int -> int -> Color.t -> unit
(** [image_draw_circle_lines dst center_x center_y radius color] Draw circle outline within an image*)

val image_draw_circle_lines_v :
  Image.t ptr -> Vector2.t -> int -> Color.t -> unit
(** [image_draw_circle_lines_v dst center radius color] Draw circle outline within an image (Vector version)*)

val image_draw_rectangle :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_draw_rectangle dst pos_x pos_y width height color] Draw rectangle within an image*)

val image_draw_rectangle_v :
  Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_rectangle_v dst position size color] Draw rectangle within an image (Vector version)*)

val image_draw_rectangle_rec : Image.t ptr -> Rectangle.t -> Color.t -> unit
(** [image_draw_rectangle_rec dst rec color] Draw rectangle within an image*)

val image_draw_rectangle_lines :
  Image.t ptr -> Rectangle.t -> int -> Color.t -> unit
(** [image_draw_rectangle_lines dst rec thick color] Draw rectangle lines within an image*)

val image_draw :
  Image.t ptr -> Image.t -> Rectangle.t -> Rectangle.t -> Color.t -> unit
(** [image_draw dst src src_rec dst_rec tint] Draw a source image within a destination image (tint applied to source)*)

val image_draw_text :
  Image.t ptr -> string -> int -> int -> int -> Color.t -> unit
(** [image_draw_text dst text pos_x pos_y font_size color] Draw text (using default font) within an image (destination)*)

val image_draw_text_ex :
  Image.t ptr ->
  Font.t ->
  string ->
  Vector2.t ->
  float ->
  float ->
  Color.t ->
  unit
(** [image_draw_text_ex dst font text position font_size spacing tint] Draw text (custom sprite font) within an image (destination)*)

(** {3 Texture loading functions} *)

val load_texture : string -> Texture.t
(** [load_texture file_name] Load texture from file into GPU memory (VRAM)*)

val load_texture_from_image : Image.t -> Texture.t
(** [load_texture_from_image image] Load texture from image data*)

val load_texture_cubemap : Image.t -> int -> Texture.t
(** [load_texture_cubemap image layout] Load cubemap from image, multiple image cubemap layouts supported*)

val load_render_texture : int -> int -> RenderTexture.t
(** [load_render_texture width height] Load texture for rendering (framebuffer)*)

val is_texture_ready : Texture.t -> bool
(** [is_texture_ready texture] Check if a texture is ready*)

val unload_texture : Texture.t -> unit
(** [unload_texture texture] Unload texture from GPU memory (VRAM)*)

val is_render_texture_ready : RenderTexture.t -> bool
(** [is_render_texture_ready target] Check if a render texture is ready*)

val unload_render_texture : RenderTexture.t -> unit
(** [unload_render_texture target] Unload render texture from GPU memory (VRAM)*)

val update_texture : Texture.t -> unit ptr -> unit
(** [update_texture texture pixels] Update GPU texture with new data*)

val update_texture_rec : Texture.t -> Rectangle.t -> unit ptr -> unit
(** [update_texture_rec texture rec pixels] Update GPU texture rectangle with new data*)

val gen_texture_mipmaps : Texture.t ptr -> unit
(** [gen_texture_mipmaps texture] Generate GPU mipmaps for a texture*)

val set_texture_filter : Texture.t -> TextureFilter.t -> unit
(** [set_texture_filter texture filter] Set texture scaling filter mode*)

val set_texture_wrap : Texture.t -> TextureWrap.t -> unit
(** [set_texture_wrap texture wrap] Set texture wrapping mode*)

val draw_texture : Texture.t -> int -> int -> Color.t -> unit
(** [draw_texture texture pos_x pos_y tint] Draw a Texture2D*)

val draw_texture_v : Texture.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_v texture position tint] Draw a Texture2D with position defined as Vector2*)

val draw_texture_ex :
  Texture.t -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_texture_ex texture position rotation scale tint] Draw a Texture2D with extended parameters*)

val draw_texture_rec : Texture.t -> Rectangle.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_rec texture source position tint] Draw a part of a texture defined by a rectangle*)

val draw_texture_pro :
  Texture.t ->
  Rectangle.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_pro texture source dest origin rotation tint] Draw a part of a texture defined by a rectangle with 'pro' parameters*)

val draw_texture_npatch :
  Texture.t ->
  NPatchInfo.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_npatch texture n_patch_info dest origin rotation tint] Draws a texture (or part of it) that stretches or shrinks nicely*)

val fade : Color.t -> float -> Color.t
(** [fade color alpha] Get color with alpha applied, alpha goes from 0.0f to 1.0f*)

val color_to_int : Color.t -> int
(** [color_to_int color] Get hexadecimal value for a Color*)

val color_normalize : Color.t -> Vector4.t
(** [color_normalize color] Get Color normalized as float [0..1]*)

val color_from_normalized : Vector4.t -> Color.t
(** [color_from_normalized normalized] Get Color from normalized values [0..1]*)

val color_to_hsv : Color.t -> Vector3.t
(** [color_to_hsv color] Get HSV values for a Color, hue [0..360], saturation/value [0..1]*)

val color_from_hsv : float -> float -> float -> Color.t
(** [color_from_hsv hue saturation value] Get a Color from HSV values, hue [0..360], saturation/value [0..1]*)

val color_tint : Color.t -> Color.t -> Color.t
(** [color_tint color tint] Get color multiplied with another color*)

val color_brightness : Color.t -> float -> Color.t
(** [color_brightness color factor] Get color with brightness correction, brightness factor goes from -1.0f to 1.0f*)

val color_contrast : Color.t -> float -> Color.t
(** [color_contrast color contrast] Get color with contrast correction, contrast values between -1.0f and 1.0f*)

val color_alpha : Color.t -> float -> Color.t
(** [color_alpha color alpha] Get color with alpha applied, alpha goes from 0.0f to 1.0f*)

val color_alpha_blend : Color.t -> Color.t -> Color.t -> Color.t
(** [color_alpha_blend dst src tint] Get src alpha-blended into dst color with tint*)

val get_color : int -> Color.t
(** [get_color hex_value] Get Color structure from hexadecimal value*)

val get_pixel_color : unit ptr -> PixelFormat.t -> Color.t
(** [get_pixel_color src_ptr format] Get Color from a source pixel pointer of certain format*)

val set_pixel_color : unit ptr -> Color.t -> PixelFormat.t -> unit
(** [set_pixel_color dst_ptr color format] Set color formatted into destination pixel pointer*)

val get_pixel_data_size : int -> int -> PixelFormat.t -> int
(** [get_pixel_data_size width height format] Get pixel data size in bytes for certain format*)

(** {2 Font Loading and Text Drawing Functions (Module: text)} *)

(** {3 Font loading/unloading functions} *)

val get_font_default : unit -> Font.t
(** [get_font_default ()] Get the default Font*)

val load_font : string -> Font.t
(** [load_font file_name] Load font from file into GPU memory (VRAM)*)

val load_font_ex : string -> int -> int CArray.t option -> Font.t
(** [load_font_ex file_name font_size codepoints codepoint_count] Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character setFont*)

val load_font_from_image : Image.t -> Color.t -> int -> Font.t
(** [load_font_from_image image key first_char] Load font from Image (XNA style)*)

val load_font_from_memory :
  string -> string -> int -> int -> int ptr -> int -> Font.t
(** [load_font_from_memory file_type file_data data_size font_size codepoints codepoint_count] Load font from memory buffer, fileType refers to extension: i.e. '.ttf'*)

val is_font_ready : Font.t -> bool
(** [is_font_ready font] Check if a font is ready*)

val load_font_data :
  string -> int -> int -> int ptr -> int -> int -> GlyphInfo.t ptr
(** [load_font_data file_data data_size font_size codepoints codepoint_count type] Load font data for further use*)

val gen_image_font_atlas :
  GlyphInfo.t ptr -> Rectangle.t ptr ptr -> int -> int -> int -> int -> Image.t
(** [gen_image_font_atlas chars recs glyph_count font_size padding pack_method] Generate image font atlas using chars info*)

val unload_font_data : GlyphInfo.t ptr -> int -> unit
(** [unload_font_data chars glyph_count] Unload font chars info data (RAM)*)

val unload_font : Font.t -> unit
(** [unload_font font] Unload font from GPU memory (VRAM)*)

val export_font_as_code : Font.t -> string -> bool
(** [export_font_as_code font file_name] Export font as code file, returns true on success*)

val draw_fps : int -> int -> unit
(** [draw_fps pos_x pos_y] Draw current FPS*)

val draw_text : string -> int -> int -> int -> Color.t -> unit
(** [draw_text text pos_x pos_y font_size color] Draw text (using default font)*)

val draw_text_ex :
  Font.t -> string -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_text_ex font text position font_size spacing tint] Draw text using font and additional parameters*)

val draw_text_pro :
  Font.t ->
  string ->
  Vector2.t ->
  Vector2.t ->
  float ->
  float ->
  float ->
  Color.t ->
  unit
(** [draw_text_pro font text position origin rotation font_size spacing tint] Draw text using Font and pro parameters (rotation)*)

val draw_text_codepoint : Font.t -> int -> Vector2.t -> float -> Color.t -> unit
(** [draw_text_codepoint font codepoint position font_size tint] Draw one character (codepoint)*)

val draw_text_codepoints :
  Font.t -> int CArray.t -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_text_codepoints font codepoints position font_size spacing tint] Draw multiple character (codepoint)*)

val set_text_line_spacing : int -> unit
(** [set_text_line_spacing spacing] Set vertical line spacing when drawing with line-breaks*)

(** {3 Text misc. functions} *)

val measure_text : string -> int -> int
(** [measure_text text font_size] Measure string width for default font*)

val measure_text_ex : Font.t -> string -> float -> float -> Vector2.t
(** [measure_text_ex font text font_size spacing] Measure string size for Font*)

val get_glyph_index : Font.t -> int -> int
(** [get_glyph_index font codepoint] Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found*)

val get_glyph_info : Font.t -> int -> GlyphInfo.t
(** [get_glyph_info font codepoint] Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found*)

val get_glyph_atlas_rec : Font.t -> int -> Rectangle.t
(** [get_glyph_atlas_rec font codepoint] Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found*)

val load_utf8 : int ptr -> int -> char ptr
(** [load_utf8 codepoints length] Load UTF-8 text encoded from codepoints array*)

val unload_utf8 : char ptr -> unit
(** [unload_utf8 text] Unload UTF-8 text encoded from codepoints array*)

val load_codepoints : string -> int ptr -> int ptr
(** [load_codepoints text count] Load all codepoints from a UTF-8 text string, codepoints count returned by parameter*)

val unload_codepoints : int ptr -> unit
(** [unload_codepoints codepoints] Unload codepoints data from memory*)

val get_codepoint_count : string -> int
(** [get_codepoint_count text] Get total number of codepoints in a UTF-8 encoded string*)

val get_codepoint : string -> int ptr -> int
(** [get_codepoint text codepoint_size] Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure*)

val get_codepoint_next : string -> int ptr -> int
(** [get_codepoint_next text codepoint_size] Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure*)

val get_codepoint_previous : string -> int ptr -> int
(** [get_codepoint_previous text codepoint_size] Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure*)

val codepoint_to_utf8 : int -> int ptr -> string
(** [codepoint_to_utf8 codepoint utf8_size] Encode one codepoint into UTF-8 byte array (array length returned as parameter)*)

val text_copy : string -> string -> int
(** [text_copy dst src] Copy one string to another, returns bytes copied*)

val text_is_equal : string -> string -> bool
(** [text_is_equal text1 text2] Check if two text string are equal*)

val text_length : string -> int
(** [text_length text] Get text length, checks for '\0' ending*)

val text_subtext : string -> int -> int -> string
(** [text_subtext text position length] Get a piece of a text string*)

val text_replace : string -> string -> string -> string
(** [text_replace text replace by] Replace text string (WARNING: memory must be freed!)*)

val text_insert : string -> string -> int -> string
(** [text_insert text insert position] Insert text in a position (WARNING: memory must be freed!)*)

val text_append : string -> string -> int ptr -> unit
(** [text_append text append position] Append text at specific position and move cursor!*)

val text_find_index : string -> string -> int
(** [text_find_index text find] Find first text occurrence within a string*)

val text_to_upper : string -> string
(** [text_to_upper text] Get upper case version of provided string*)

val text_to_lower : string -> string
(** [text_to_lower text] Get lower case version of provided string*)

val text_to_pascal : string -> string
(** [text_to_pascal text] Get Pascal case notation version of provided string*)

val text_to_integer : string -> int
(** [text_to_integer text] Get integer value from text (negative values not supported)*)

(** {2 Basic 3d Shapes Drawing Functions (Module: models)} *)

(** {3 Basic geometric 3D shapes drawing functions} *)

val draw_line_3d : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_line_3d start_pos end_pos color] Draw a line in 3D world space*)

val draw_point_3d : Vector3.t -> Color.t -> unit
(** [draw_point_3d position color] Draw a point in 3D space, actually a small line*)

val draw_circle_3d : Vector3.t -> float -> Vector3.t -> float -> Color.t -> unit
(** [draw_circle_3d center radius rotation_axis rotation_angle color] Draw a circle in 3D world space*)

val draw_triangle_3d : Vector3.t -> Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_triangle_3d v1 v2 v3 color] Draw a color-filled triangle (vertex in counter-clockwise order!)*)

val draw_triangle_strip_3d : Vector3.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip_3d points point_count color] Draw a triangle strip defined by points*)

val draw_cube : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube position width height length color] Draw cube*)

val draw_cube_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_v position size color] Draw cube (Vector version)*)

val draw_cube_wires : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube_wires position width height length color] Draw cube wires*)

val draw_cube_wires_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_wires_v position size color] Draw cube wires (Vector version)*)

val draw_sphere : Vector3.t -> float -> Color.t -> unit
(** [draw_sphere center_pos radius color] Draw sphere*)

val draw_sphere_ex : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_ex center_pos radius rings slices color] Draw sphere with extended parameters*)

val draw_sphere_wires : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_wires center_pos radius rings slices color] Draw sphere wires*)

val draw_cylinder :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder position radius_top radius_bottom height slices color] Draw a cylinder/cone*)

val draw_cylinder_ex :
  Vector3.t -> Vector3.t -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_ex start_pos end_pos start_radius end_radius sides color] Draw a cylinder with base at startPos and top at endPos*)

val draw_cylinder_wires :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_wires position radius_top radius_bottom height slices color] Draw a cylinder/cone wires*)

val draw_cylinder_wires_ex :
  Vector3.t -> Vector3.t -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_wires_ex start_pos end_pos start_radius end_radius sides color] Draw a cylinder wires with base at startPos and top at endPos*)

val draw_capsule :
  Vector3.t -> Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_capsule start_pos end_pos radius slices rings color] Draw a capsule with the center of its sphere caps at startPos and endPos*)

val draw_capsule_wires :
  Vector3.t -> Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_capsule_wires start_pos end_pos radius slices rings color] Draw capsule wireframe with the center of its sphere caps at startPos and endPos*)

val draw_plane : Vector3.t -> Vector2.t -> Color.t -> unit
(** [draw_plane center_pos size color] Draw a plane XZ*)

val draw_ray : Ray.t -> Color.t -> unit
(** [draw_ray ray color] Draw a ray line*)

val draw_grid : int -> float -> unit
(** [draw_grid slices spacing] Draw a grid (centered at (0, 0, 0))*)

(** {3 Model loading/unloading functions} *)

val load_model : string -> Model.t
(** [load_model file_name] Load model from files (meshes and materials)*)

val load_model_from_mesh : Mesh.t -> Model.t
(** [load_model_from_mesh mesh] Load model from generated mesh (default material)*)

val is_model_ready : Model.t -> bool
(** [is_model_ready model] Check if a model is ready*)

val unload_model : Model.t -> unit
(** [unload_model model] Unload model (including meshes) from memory (RAM and/or VRAM)*)

val get_model_bounding_box : Model.t -> BoundingBox.t
(** [get_model_bounding_box model] Compute model bounding box limits (considers all meshes)*)

val draw_model : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model model position scale tint] Draw a model (with texture if set)*)

val draw_model_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_ex model position rotation_axis rotation_angle scale tint] Draw a model with extended parameters*)

val draw_model_wires : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model_wires model position scale tint] Draw a model wires (with texture if set)*)

val draw_model_wires_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_wires_ex model position rotation_axis rotation_angle scale tint] Draw a model wires (with texture if set) with extended parameters*)

val draw_bounding_box : BoundingBox.t -> Color.t -> unit
(** [draw_bounding_box box color] Draw bounding box (wires)*)

val draw_billboard :
  Camera3D.t -> Texture.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_billboard camera texture position size tint] Draw a billboard texture*)

val draw_billboard_rec :
  Camera3D.t ->
  Texture.t ->
  Rectangle.t ->
  Vector3.t ->
  Vector2.t ->
  Color.t ->
  unit
(** [draw_billboard_rec camera texture source position size tint] Draw a billboard texture defined by source*)

val draw_billboard_pro :
  Camera3D.t ->
  Texture.t ->
  Rectangle.t ->
  Vector3.t ->
  Vector3.t ->
  Vector2.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_billboard_pro camera texture source position up size origin rotation tint] Draw a billboard texture defined by source and rotation*)

val upload_mesh : Mesh.t ptr -> bool -> unit
(** [upload_mesh mesh dynamic] Upload mesh vertex data in GPU and provide VAO/VBO ids*)

val update_mesh_buffer : Mesh.t -> int -> unit ptr -> int -> int -> unit
(** [update_mesh_buffer mesh index data data_size offset] Update mesh vertex data in GPU for a specific buffer index*)

val unload_mesh : Mesh.t -> unit
(** [unload_mesh mesh] Unload mesh data from CPU and GPU*)

val draw_mesh : Mesh.t -> Material.t -> Matrix.t -> unit
(** [draw_mesh mesh material transform] Draw a 3d mesh with material and transform*)

val draw_mesh_instanced : Mesh.t -> Material.t -> Matrix.t ptr -> int -> unit
(** [draw_mesh_instanced mesh material transforms instances] Draw multiple mesh instances with material and different transforms*)

val export_mesh : Mesh.t -> string -> bool
(** [export_mesh mesh file_name] Export mesh data to file, returns true on success*)

val get_mesh_bounding_box : Mesh.t -> BoundingBox.t
(** [get_mesh_bounding_box mesh] Compute mesh bounding box limits*)

(** {3 Mesh generation functions} *)

val gen_mesh_tangents : Mesh.t ptr -> unit
(** [gen_mesh_tangents mesh] Compute mesh tangents*)

val gen_mesh_poly : int -> float -> Mesh.t
(** [gen_mesh_poly sides radius] Generate polygonal mesh*)

val gen_mesh_plane : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_plane width length res_x res_z] Generate plane mesh (with subdivisions)*)

val gen_mesh_cube : float -> float -> float -> Mesh.t
(** [gen_mesh_cube width height length] Generate cuboid mesh*)

val gen_mesh_sphere : float -> int -> int -> Mesh.t
(** [gen_mesh_sphere radius rings slices] Generate sphere mesh (standard sphere)*)

val gen_mesh_hemi_sphere : float -> int -> int -> Mesh.t
(** [gen_mesh_hemi_sphere radius rings slices] Generate half-sphere mesh (no bottom cap)*)

val gen_mesh_cylinder : float -> float -> int -> Mesh.t
(** [gen_mesh_cylinder radius height slices] Generate cylinder mesh*)

val gen_mesh_cone : float -> float -> int -> Mesh.t
(** [gen_mesh_cone radius height slices] Generate cone/pyramid mesh*)

val gen_mesh_torus : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_torus radius size rad_seg sides] Generate torus mesh*)

val gen_mesh_knot : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_knot radius size rad_seg sides] Generate trefoil knot mesh*)

val gen_mesh_heightmap : Image.t -> Vector3.t -> Mesh.t
(** [gen_mesh_heightmap heightmap size] Generate heightmap mesh from image data*)

val gen_mesh_cubicmap : Image.t -> Vector3.t -> Mesh.t
(** [gen_mesh_cubicmap cubicmap cube_size] Generate cubes-based map mesh from image data*)

val load_materials : string -> int ptr -> Material.t ptr
(** [load_materials file_name material_count] Load materials from model file*)

val load_material_default : unit -> Material.t
(** [load_material_default ()] Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)*)

val is_material_ready : Material.t -> bool
(** [is_material_ready material] Check if a material is ready*)

val unload_material : Material.t -> unit
(** [unload_material material] Unload material from GPU memory (VRAM)*)

val set_material_texture :
  Material.t ptr -> MaterialMapIndex.t -> Texture.t -> unit
(** [set_material_texture material map_type texture] Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)*)

val set_model_mesh_material : Model.t ptr -> int -> int -> unit
(** [set_model_mesh_material model mesh_id material_id] Set material for a mesh*)

val load_model_animations : string -> ModelAnimation.t CArray.t
(** [load_model_animations file_name anim_count] Load model animations from file*)

val update_model_animation : Model.t -> ModelAnimation.t -> int -> unit
(** [update_model_animation model anim frame] Update model animation pose*)

val unload_model_animation : ModelAnimation.t -> unit
(** [unload_model_animation anim] Unload animation data*)

val unload_model_animations : ModelAnimation.t CArray.t -> unit
(** [unload_model_animations animations anim_count] Unload animation array data*)

val is_model_animation_valid : Model.t -> ModelAnimation.t -> bool
(** [is_model_animation_valid model anim] Check model animation skeleton match*)

(** {3 Collision detection functions} *)

val check_collision_spheres : Vector3.t -> float -> Vector3.t -> float -> bool
(** [check_collision_spheres center1 radius1 center2 radius2] Check collision between two spheres*)

val check_collision_boxes : BoundingBox.t -> BoundingBox.t -> bool
(** [check_collision_boxes box1 box2] Check collision between two bounding boxes*)

val check_collision_box_sphere : BoundingBox.t -> Vector3.t -> float -> bool
(** [check_collision_box_sphere box center radius] Check collision between box and sphere*)

val get_ray_collision_sphere : Ray.t -> Vector3.t -> float -> RayCollision.t
(** [get_ray_collision_sphere ray center radius] Get collision info between ray and sphere*)

val get_ray_collision_box : Ray.t -> BoundingBox.t -> RayCollision.t
(** [get_ray_collision_box ray box] Get collision info between ray and box*)

val get_ray_collision_mesh : Ray.t -> Mesh.t -> Matrix.t -> RayCollision.t
(** [get_ray_collision_mesh ray mesh transform] Get collision info between ray and mesh*)

val get_ray_collision_triangle :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayCollision.t
(** [get_ray_collision_triangle ray p1 p2 p3] Get collision info between ray and triangle*)

val get_ray_collision_quad :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayCollision.t
(** [get_ray_collision_quad ray p1 p2 p3 p4] Get collision info between ray and quad*)

(** {2 Audio Loading and Playing Functions (Module: audio)} *)

(** {3 Audio device management functions} *)
val init_audio_device : unit -> unit
(** [init_audio_device ()] Initialize audio device and context*)

val close_audio_device : unit -> unit
(** [close_audio_device ()] Close the audio device and context*)

val is_audio_device_ready : unit -> bool
(** [is_audio_device_ready ()] Check if audio device has been initialized successfully*)

val set_master_volume : float -> unit
(** [set_master_volume volume] Set master volume (listener)*)

val get_master_volume : unit -> float
(** [get_master_volume ()] Get master volume (listener)*)

val load_wave : string -> Wave.t
(** [load_wave file_name] Load wave data from file*)

val load_wave_from_memory : string -> string -> int -> Wave.t
(** [load_wave_from_memory file_type file_data data_size] Load wave from memory buffer, fileType refers to extension: i.e. '.wav'*)

val is_wave_ready : Wave.t -> bool
(** [is_wave_ready wave] Checks if wave data is ready*)

val load_sound : string -> Sound.t
(** [load_sound file_name] Load sound from file*)

val load_sound_from_wave : Wave.t -> Sound.t
(** [load_sound_from_wave wave] Load sound from wave data*)

val load_sound_alias : Sound.t -> Sound.t
(** [load_sound_alias source] Create a new sound that shares the same sample data as the source sound, does not own the sound data*)

val is_sound_ready : Sound.t -> bool
(** [is_sound_ready sound] Checks if a sound is ready*)

val update_sound : Sound.t -> unit ptr -> int -> unit
(** [update_sound sound data sample_count] Update sound buffer with new data*)

val unload_wave : Wave.t -> unit
(** [unload_wave wave] Unload wave data*)

val unload_sound : Sound.t -> unit
(** [unload_sound sound] Unload sound*)

val unload_sound_alias : Sound.t -> unit
(** [unload_sound_alias alias] Unload a sound alias (does not deallocate sample data)*)

val export_wave : Wave.t -> string -> bool
(** [export_wave wave file_name] Export wave data to file, returns true on success*)

val export_wave_as_code : Wave.t -> string -> bool
(** [export_wave_as_code wave file_name] Export wave sample data to code (.h), returns true on success*)

(** {3 Wave/Sound management functions} *)

val play_sound : Sound.t -> unit
(** [play_sound sound] Play a sound*)

val stop_sound : Sound.t -> unit
(** [stop_sound sound] Stop playing a sound*)

val pause_sound : Sound.t -> unit
(** [pause_sound sound] Pause a sound*)

val resume_sound : Sound.t -> unit
(** [resume_sound sound] Resume a paused sound*)

val is_sound_playing : Sound.t -> bool
(** [is_sound_playing sound] Check if a sound is currently playing*)

val set_sound_volume : Sound.t -> float -> unit
(** [set_sound_volume sound volume] Set volume for a sound (1.0 is max level)*)

val set_sound_pitch : Sound.t -> float -> unit
(** [set_sound_pitch sound pitch] Set pitch for a sound (1.0 is base level)*)

val set_sound_pan : Sound.t -> float -> unit
(** [set_sound_pan sound pan] Set pan for a sound (0.5 is center)*)

val wave_copy : Wave.t -> Wave.t
(** [wave_copy wave] Copy a wave to a new wave*)

val wave_crop : Wave.t ptr -> int -> int -> unit
(** [wave_crop wave init_sample final_sample] Crop a wave to defined samples range*)

val wave_format : Wave.t ptr -> int -> int -> int -> unit
(** [wave_format wave sample_rate sample_size channels] Convert wave data to desired format*)

val load_wave_samples : Wave.t -> float ptr
(** [load_wave_samples wave] Load samples data from wave as a 32bit float data array*)

val unload_wave_samples : float ptr -> unit
(** [unload_wave_samples samples] Unload samples data loaded with LoadWaveSamples()*)

val load_music_stream : string -> Music.t
(** [load_music_stream file_name] Load music stream from file*)

val load_music_stream_from_memory : string -> string -> int -> Music.t
(** [load_music_stream_from_memory file_type data data_size] Load music stream from data*)

val is_music_ready : Music.t -> bool
(** [is_music_ready music] Checks if a music stream is ready*)

val unload_music_stream : Music.t -> unit
(** [unload_music_stream music] Unload music stream*)

val play_music_stream : Music.t -> unit
(** [play_music_stream music] Start music playing*)

val is_music_stream_playing : Music.t -> bool
(** [is_music_stream_playing music] Check if music is playing*)

val update_music_stream : Music.t -> unit
(** [update_music_stream music] Updates buffers for music streaming*)

val stop_music_stream : Music.t -> unit
(** [stop_music_stream music] Stop music playing*)

val pause_music_stream : Music.t -> unit
(** [pause_music_stream music] Pause music playing*)

val resume_music_stream : Music.t -> unit
(** [resume_music_stream music] Resume playing paused music*)

val seek_music_stream : Music.t -> float -> unit
(** [seek_music_stream music position] Seek music to a position (in seconds)*)

val set_music_volume : Music.t -> float -> unit
(** [set_music_volume music volume] Set volume for music (1.0 is max level)*)

val set_music_pitch : Music.t -> float -> unit
(** [set_music_pitch music pitch] Set pitch for a music (1.0 is base level)*)

val set_music_pan : Music.t -> float -> unit
(** [set_music_pan music pan] Set pan for a music (0.5 is center)*)

val get_music_time_length : Music.t -> float
(** [get_music_time_length music] Get music time length (in seconds)*)

val get_music_time_played : Music.t -> float
(** [get_music_time_played music] Get current music time played (in seconds)*)

val load_audio_stream : int -> int -> int -> AudioStream.t
(** [load_audio_stream sample_rate sample_size channels] Load audio stream (to stream raw audio pcm data)*)

(** {3 AudioStream management functions} *)

val is_audio_stream_ready : AudioStream.t -> bool
(** [is_audio_stream_ready stream] Checks if an audio stream is ready*)

val unload_audio_stream : AudioStream.t -> unit
(** [unload_audio_stream stream] Unload audio stream and free memory*)

val update_audio_stream : AudioStream.t -> unit ptr -> int -> unit
(** [update_audio_stream stream data frame_count] Update audio stream buffers with data*)

val is_audio_stream_processed : AudioStream.t -> bool
(** [is_audio_stream_processed stream] Check if any audio stream buffers requires refill*)

val play_audio_stream : AudioStream.t -> unit
(** [play_audio_stream stream] Play audio stream*)

val pause_audio_stream : AudioStream.t -> unit
(** [pause_audio_stream stream] Pause audio stream*)

val resume_audio_stream : AudioStream.t -> unit
(** [resume_audio_stream stream] Resume audio stream*)

val is_audio_stream_playing : AudioStream.t -> bool
(** [is_audio_stream_playing stream] Check if audio stream is playing*)

val stop_audio_stream : AudioStream.t -> unit
(** [stop_audio_stream stream] Stop audio stream*)

val set_audio_stream_volume : AudioStream.t -> float -> unit
(** [set_audio_stream_volume stream volume] Set volume for audio stream (1.0 is max level)*)

val set_audio_stream_pitch : AudioStream.t -> float -> unit
(** [set_audio_stream_pitch stream pitch] Set pitch for audio stream (1.0 is base level)*)

val set_audio_stream_pan : AudioStream.t -> float -> unit
(** [set_audio_stream_pan stream pan] Set pan for audio stream (0.5 is centered)*)

val set_audio_stream_buffer_size_default : int -> unit
(** [set_audio_stream_buffer_size_default size] Default size for new audio streams*)
