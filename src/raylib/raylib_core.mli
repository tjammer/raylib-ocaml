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
  type t

  val vsync_hint : t
  val fullscreen_mode : t
  val window_resizable : t
  val window_undecorated : t
  val window_hidden : t
  val window_minimized : t
  val window_maximized : t
  val window_unfocused : t
  val window_topmost : t
  val window_always_run : t
  val window_transparent : t
  val window_highdpi : t
  val window_mouse_passthrough : t
  val borderless_windowed_mode : t
  val msaa_4x_hint : t
  val interlaced_hint : t
  val ( + ) : t -> t -> t
  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module TraceLogLevel : sig
  type t = All | Trace | Debug | Info | Warning | Error | Fatal | None

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module MouseButton : sig
  type t = Left | Right | Middle | Side | Extra | Forward | Back

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module GamepadAxis : sig
  type t = Left_x | Left_y | Right_x | Right_y | Left_trigger | Right_trigger

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
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
    | Vertex_boneids
    | Vertex_boneweights
    | Matrix_bonetransforms
    | Vertex_instancetransform

  val t : t Ctypes.typ
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
    | Uint
    | Uivec2
    | Uivec3
    | Uivec4
    | Sampler2d

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module ShaderAttributeDataType : sig
  type t = Float | Vec2 | Vec3 | Vec4

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module TextureWrap : sig
  type t = Repeat | Clamp | Mirror_repeat | Mirror_clamp

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module FontType : sig
  type t = Default | Bitmap | Sdf

  val t : t Ctypes.typ
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

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module Gesture : sig
  type t

  val none : t
  val tap : t
  val doubletap : t
  val hold : t
  val drag : t
  val swipe_right : t
  val swipe_left : t
  val swipe_up : t
  val swipe_down : t
  val pinch_in : t
  val pinch_out : t
  val ( + ) : t -> t -> t
  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module CameraMode : sig
  type t = Custom | Free | Orbital | First_person | Third_person

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module CameraProjection : sig
  type t = Perspective | Orthographic

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module NPatchLayout : sig
  type t = Nine_patch | Three_patch_vertical | Three_patch_horizontal

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module TextureId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module ShaderProgramId : sig
  type t

  val t : t Ctypes.typ
  val is_valid : t -> bool
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module FramebufferId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

val max_shader_locations : int

(** {1 Types} *)

module Vector2 : sig
  type t'
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
  type t'
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
  (** [frustum left right bottom top near far] returns perspective projection
      matrix *)

  val perspective : float -> float -> float -> float -> t
  (** [perspective fovy aspect near far] returns perspective projection matrix
  *)

  val ortho : float -> float -> float -> float -> float -> float -> t
  (** [ortho left right bottom top near far] returns orthographic projection
      matrix *)

  val look_at : Vector3.t -> Vector3.t -> Vector3.t -> t
  (** [look at eye target up] returns camera look-at matrix (view matrix) *)
end

module Color : sig
  type t'
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
  type t'
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
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val create : TextureId.t -> int -> int -> int -> PixelFormat.t -> t
  (** [create id width height mipmaps format] *)

  val id : t -> TextureId.t
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

  val id : t -> FramebufferId.t
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
  type t'
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
  (** Camera field-of-view aperture in Y (degrees) in perspective, used as near
      plane height in world units in orthographic *)

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
  (** Camera offset (screen space offset from window origin) *)

  val target : t -> Vector2.t
  (** Camera target (world space target point that is mapped to screen space
      offset) *)

  val rotation : t -> float
  (** Camera rotation in degrees (pivots around target) *)

  val zoom : t -> float
  (** Camera zoom (scaling around target), must not be set to 0, set to 1.0f for
      no scale *)

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
  (** Vertex texture coordinates (UV - 2 components per vertex) (shader-location
      = 1) *)

  val texcoords2 : t -> float Ctypes_static.carray
  (** Vertex second texture coordinates (useful for lightmaps) (shader-location
      = 5) *)

  val normals : t -> float Ctypes_static.carray
  (** Vertex normals (XYZ - 3 components per vertex) (shader-location = 2) *)

  val tangents : t -> float Ctypes_static.carray
  (** Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4) *)

  val colors : t -> Unsigned.uchar Ctypes_static.carray
  (** Vertex colors (RGBA - 4 components per vertex) (shader-location = 3) *)

  val indices : t -> Unsigned.ushort Ctypes_static.carray
  (** Vertex indices (in case vertex data comes indexed) *)

  val bone_indices : t -> int Ctypes_static.carray
  (** Vertex bone indices, up to 4 bones influence by vertex (skinning)
      (shader-location = 6) *)

  val bone_weights : t -> float Ctypes_static.carray
  (** Vertex bone weight, up to 4 bones influence by vertex (skinning)
      (shader-location = 7) *)

  val anim_vertices : t -> float Ctypes_static.carray
  (** Animated vertex positions (after bones transformations) *)

  val anim_normals : t -> float Ctypes_static.carray
  (** Animated normals (after bones transformations) *)

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
  val set_bone_indices : t -> int Ctypes_static.carray -> unit
  val set_bone_weights : t -> float Ctypes_static.carray -> unit
end

module ShaderLoc : sig
  type t

  val t : t Ctypes.typ
  val to_int : t -> int
  val of_int : int -> t
end

module Shader : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val shader : ShaderProgramId.t -> ShaderLoc.t CArray.t -> t
  val id : t -> ShaderProgramId.t
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

module ModelSkeleton : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val bones : t -> BoneInfo.t CArray.t
  (** Bones information (skeleton) *)

  val bind_pose : t -> Transform.t ptr
  (** Bones base transformation *)

  val set_bones : t -> BoneInfo.t CArray.t -> unit
  val set_bind_pose : t -> Transform.t ptr -> unit
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

  val skeleton : t -> ModelSkeleton.t
  (** Skeleton for animation *)

  val current_pose : t -> Transform.t ptr
  (** Current animation pose *)

  val bone_matrices : t -> Matrix.t CArray.t
  (** Bones animated transformation matrices *)

  val set_transform : t -> Matrix.t -> unit
  val set_meshes : t -> Mesh.t CArray.t -> unit
  val set_materials : t -> Material.t CArray.t -> unit
  val set_current_pose : t -> Transform.t ptr -> unit
  val set_bone_matrices : t -> Matrix.t CArray.t -> unit
end

module ModelAnimation : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val name : t -> string
  (** Animation name *)

  val bone_count : t -> int
  (** Number of bones (per pose) *)

  val keyframe_count : t -> int
  (** Number of animation key frames *)

  val keyframe_poses_at : t -> int -> Transform.t CArray.t
  (** Poses array by frame *)
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
  (** Ray direction (normalized) *)

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

  val frame : t -> Unsigned.uint
  (** Event frame *)

  val typ : t -> Unsigned.uint
  (** Event type (AutomationEventType) *)

  val params : t -> int Ctypes_static.carray
  (** Event parameters (if required) *)

  val set_frame : t -> Unsigned.uint -> unit
  val set_typ : t -> Unsigned.uint -> unit
  val set_params : t -> int -> int -> int -> int -> unit
end

module AutomationEventList : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val capacity : t -> Unsigned.uint
  (** Events max entries (MAX_AUTOMATION_EVENTS) *)

  val count : t -> Unsigned.uint
  (** Events entries count *)

  val events : t -> AutomationEvent.t ptr
  (** Events entries *)

  val set_capacity : t -> Unsigned.uint -> unit
  val set_count : t -> Unsigned.uint -> unit
  val set_events : t -> AutomationEvent.t ptr -> unit
end

(** {1 Functions}*)

(** {2 Window and Graphics Device Functions (Module: core)}*)

val init_window : int -> int -> string -> unit
(** [init_window width height title] Initialize window and OpenGL context*)

val close_window : unit -> unit
(** [close_window ()] Close window and unload OpenGL context*)

val window_should_close : unit -> bool
(** [window_should_close ()] Check if application should close (KEY_ESCAPE
    pressed or windows close icon clicked)*)

val is_window_ready : unit -> bool
(** [is_window_ready ()] Check if window has been initialized successfully*)

val is_window_fullscreen : unit -> bool
(** [is_window_fullscreen ()] Check if window is currently fullscreen*)

val is_window_hidden : unit -> bool
(** [is_window_hidden ()] Check if window is currently hidden*)

val is_window_minimized : unit -> bool
(** [is_window_minimized ()] Check if window is currently minimized*)

val is_window_maximized : unit -> bool
(** [is_window_maximized ()] Check if window is currently maximized*)

val is_window_focused : unit -> bool
(** [is_window_focused ()] Check if window is currently focused*)

val is_window_resized : unit -> bool
(** [is_window_resized ()] Check if window has been resized last frame*)

val is_window_state : ConfigFlags.t -> bool
(** [is_window_state flag] Check if one specific window flag is enabled*)

val set_window_state : ConfigFlags.t -> unit
(** [set_window_state flags] Set window configuration state using flags*)

val clear_window_state : ConfigFlags.t -> unit
(** [clear_window_state flags] Clear window configuration state flags*)

val toggle_fullscreen : unit -> unit
(** [toggle_fullscreen ()] Toggle window state: fullscreen/windowed, resizes
    monitor to match window resolution*)

val toggle_borderless_windowed : unit -> unit
(** [toggle_borderless_windowed ()] Toggle window state: borderless windowed,
    resizes window to match monitor resolution*)

val maximize_window : unit -> unit
(** [maximize_window ()] Set window state: maximized, if resizable*)

val minimize_window : unit -> unit
(** [minimize_window ()] Set window state: minimized, if resizable*)

val restore_window : unit -> unit
(** [restore_window ()] Set window state: not minimized/maximized*)

val set_window_icon : Image.t -> unit
(** [set_window_icon image] Set icon for window (single image, RGBA 32bit)*)

val set_window_icons : Image.t ptr -> int -> unit
(** [set_window_icons images count] Set icon for window (multiple images, RGBA
    32bit)*)

val set_window_title : string -> unit
(** [set_window_title title] Set title for window*)

val set_window_position : int -> int -> unit
(** [set_window_position x y] Set window position on screen*)

val set_window_monitor : int -> unit
(** [set_window_monitor monitor] Set monitor for the current window*)

val set_window_min_size : int -> int -> unit
(** [set_window_min_size width height] Set window minimum dimensions (for
    FLAG_WINDOW_RESIZABLE)*)

val set_window_max_size : int -> int -> unit
(** [set_window_max_size width height] Set window maximum dimensions (for
    FLAG_WINDOW_RESIZABLE)*)

val set_window_size : int -> int -> unit
(** [set_window_size width height] Set window dimensions*)

val set_window_opacity : float -> unit
(** [set_window_opacity opacity] Set window opacity [0.0f..1.0f]*)

val set_window_focused : unit -> unit
(** [set_window_focused ()] Set window focused*)

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
(** [get_current_monitor ()] Get current monitor where window is placed*)

val get_monitor_position : int -> Vector2.t
(** [get_monitor_position monitor] Get specified monitor position*)

val get_monitor_width : int -> int
(** [get_monitor_width monitor] Get specified monitor width (current video mode
    used by monitor)*)

val get_monitor_height : int -> int
(** [get_monitor_height monitor] Get specified monitor height (current video
    mode used by monitor)*)

val get_monitor_physical_width : int -> int
(** [get_monitor_physical_width monitor] Get specified monitor physical width in
    millimetres*)

val get_monitor_physical_height : int -> int
(** [get_monitor_physical_height monitor] Get specified monitor physical height
    in millimetres*)

val get_monitor_refresh_rate : int -> int
(** [get_monitor_refresh_rate monitor] Get specified monitor refresh rate*)

val get_window_position : unit -> Vector2.t
(** [get_window_position ()] Get window position XY on monitor*)

val get_window_scale_dpi : unit -> Vector2.t
(** [get_window_scale_dpi ()] Get window scale DPI factor*)

val get_monitor_name : int -> string
(** [get_monitor_name monitor] Get the human-readable, UTF-8 encoded name of the
    specified monitor*)

val set_clipboard_text : string -> unit
(** [set_clipboard_text text] Set clipboard text content*)

val get_clipboard_text : unit -> string option
(** [get_clipboard_text ()] Get clipboard text content*)

val get_clipboard_image : unit -> Image.t
(** [get_clipboard_image ()] Get clipboard image content*)

val enable_event_waiting : unit -> unit
(** [enable_event_waiting ()] Enable waiting for events on EndDrawing(), no
    automatic event polling*)

val disable_event_waiting : unit -> unit
(** [disable_event_waiting ()] Disable waiting for events on EndDrawing(),
    automatic events polling*)

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
(** [begin_blend_mode mode] Begin blending mode (alpha, additive, multiplied,
    subtract, custom)*)

val end_blend_mode : unit -> unit
(** [end_blend_mode ()] End blending mode (reset to default: alpha blending)*)

val begin_scissor_mode : int -> int -> int -> int -> unit
(** [begin_scissor_mode x y width height] Begin scissor mode (define screen area
    for following drawing)*)

val end_scissor_mode : unit -> unit
(** [end_scissor_mode ()] End scissor mode*)

val begin_vr_stereo_mode : VrStereoConfig.t -> unit
(** [begin_vr_stereo_mode config] Begin stereo rendering (requires VR simulator)*)

val end_vr_stereo_mode : unit -> unit
(** [end_vr_stereo_mode ()] End stereo rendering (requires VR simulator)*)

val load_vr_stereo_config : VrDeviceInfo.t -> VrStereoConfig.t
(** [load_vr_stereo_config device] Load VR stereo config for VR simulator device
    parameters*)

val unload_vr_stereo_config : VrStereoConfig.t -> unit
(** [unload_vr_stereo_config config] Unload VR stereo config*)

val load_shader : string -> string -> Shader.t
(** [load_shader vs_file_name fs_file_name] Load shader from files and bind
    default locations*)

val load_shader_from_memory : string -> string -> Shader.t
(** [load_shader_from_memory vs_code fs_code] Load shader from code strings and
    bind default locations*)

val is_shader_valid : Shader.t -> bool
(** [is_shader_valid shader] Check if a shader is valid (loaded on GPU)*)

val get_shader_location : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location shader uniform_name] Get shader uniform location*)

val get_shader_location_attrib : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location_attrib shader attrib_name] Get shader attribute
    location*)

val set_shader_value :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> unit
(** [set_shader_value shader loc_index value uniform_type] Set shader uniform
    value*)

val set_shader_value_v :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> int -> unit
(** [set_shader_value_v shader loc_index value uniform_type count] Set shader
    uniform value vector*)

val set_shader_value_matrix : Shader.t -> ShaderLoc.t -> Matrix.t -> unit
(** [set_shader_value_matrix shader loc_index mat] Set shader uniform value
    (matrix 4x4)*)

val set_shader_value_texture : Shader.t -> ShaderLoc.t -> Texture.t -> unit
(** [set_shader_value_texture shader loc_index texture] Set shader uniform value
    for texture (sampler2d)*)

val unload_shader : Shader.t -> unit
(** [unload_shader shader] Unload shader from GPU memory (VRAM)*)

(** {3 Screen-space-related functions} *)

val get_screen_to_world_ray : Vector2.t -> Camera3D.t -> Ray.t
(** [get_screen_to_world_ray position camera] Get a ray trace from screen
    position (i.e mouse)*)

val get_screen_to_world_ray_ex : Vector2.t -> Camera3D.t -> int -> int -> Ray.t
(** [get_screen_to_world_ray_ex position camera width height] Get a ray trace
    from screen position (i.e mouse) in a viewport*)

val get_world_to_screen : Vector3.t -> Camera3D.t -> Vector2.t
(** [get_world_to_screen position camera] Get the screen space position for a 3d
    world space position*)

val get_world_to_screen_ex : Vector3.t -> Camera3D.t -> int -> int -> Vector2.t
(** [get_world_to_screen_ex position camera width height] Get size position for
    a 3d world space position*)

val get_world_to_screen_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_world_to_screen_2d position camera] Get the screen space position for a
    2d camera world space position*)

val get_screen_to_world_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_screen_to_world_2d position camera] Get the world space position for a
    2d camera screen space position*)

val get_camera_matrix : Camera3D.t -> Matrix.t
(** [get_camera_matrix camera] Get camera transform matrix (view matrix)*)

val get_camera_matrix_2d : Camera2D.t -> Matrix.t
(** [get_camera_matrix_2d camera] Get camera 2d transform matrix*)

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
(** [get_random_value min max] Get a random value between min and max (both
    included)*)

val load_random_sequence : int -> int -> int -> int ptr
(** [load_random_sequence count min max] Load random values sequence, no values
    repeated*)

val unload_random_sequence : int ptr -> unit
(** [unload_random_sequence sequence] Unload random values sequence*)

val take_screenshot : string -> unit
(** [take_screenshot file_name] Takes a screenshot of current screen (filename
    extension defines format)*)

val set_config_flags : ConfigFlags.t -> unit
(** [set_config_flags flags] Setup init configuration flags (view FLAGS)*)

val open_url : string -> unit
(** [open_url url] Open URL with default system browser (if available)*)

val set_trace_log_level : TraceLogLevel.t -> unit
(** [set_trace_log_level log_level] Set the current threshold (minimum) log
    level*)

val trace_log : TraceLogLevel.t -> string -> unit
(** [trace_log log_level text args] Show trace log messages (LOG_DEBUG,
    LOG_INFO, LOG_WARNING, LOG_ERROR...)*)

val mem_alloc : int -> unit ptr
(** [mem_alloc size] Internal memory allocator*)

val mem_realloc : unit ptr -> int -> unit ptr
(** [mem_realloc ptr size] Internal memory reallocator*)

val mem_free : unit ptr -> unit
(** [mem_free ptr] Internal memory free*)

val load_file_data : string -> string
(** [load_file_data file_name] Load file data as byte array (read)*)

val save_file_data : string -> 'a CArray.t -> bool
(** [save_file_data file_name data data_size] Save data to file from byte array
    (write), returns true on success*)

val export_data_as_code : string -> string -> bool
(** [export_data_as_code data filename] Export data to code (.h), returns true
    on success*)

val load_file_text : string -> string
(** [load_file_text file_name] Load text data from file (read), returns a '\0'
    terminated string*)

val save_file_text : string -> string -> bool
(** [save_file_text file_name text] Save text data to file (write), string must
    be ' 0' terminated, returns true on success*)

val file_rename : string -> string -> int
(** [file_rename file_name file_rename] Rename file (if exists) *)

val file_remove : string -> int
(** [file_remove file_name] Remove file (if exists) *)

val file_copy : string -> string -> int
(** [file_copy src_path dst_path] Copy file from one path to another, dstPath
    created if it doesn't exist *)

val file_move : string -> string -> int
(** [file_move src_path dst_path] Move file from one directory to another,
    dstPath created if it doesn't exist *)

val file_text_replace : string -> string -> string -> int
(** [file_text_replace file_name search replacement] Replace text in an existing
    file *)

val file_text_find_index : string -> string -> int
(** [file_text_find_index file_name search] Find text in existing file *)

val file_exists : string -> bool
(** [file_exists file_name] Check if file exists*)

val directory_exists : string -> bool
(** [directory_exists dir_path] Check if a directory path exists*)

val is_file_extension : string -> string -> bool
(** [is_file_extension file_name ext] Check file extension (including point:
    .png, .wav)*)

val get_file_length : string -> int
(** [get_file_length file_name] Get file length in bytes (NOTE: GetFileSize()
    conflicts with windows.h)*)

val get_file_mod_time : string -> Signed.long
(** [get_file_mod_time file_name] Get file modification time (last write time)*)

val get_file_extension : string -> string
(** [get_file_extension file_name] Get pointer to extension for a filename
    string (includes dot: '.png')*)

val get_file_name : string -> string
(** [get_file_name file_path] Get pointer to filename for a path string*)

val get_file_name_without_ext : string -> string
(** [get_file_name_without_ext file_path] Get filename string without extension
    (uses static string)*)

val get_directory_path : string -> string
(** [get_directory_path file_path] Get full path for a given fileName with path
    (uses static string)*)

val get_prev_directory_path : string -> string
(** [get_prev_directory_path dir_path] Get previous directory path for a given
    path (uses static string)*)

val get_working_directory : unit -> string
(** [get_working_directory ()] Get current working directory (uses static
    string)*)

val get_application_directory : unit -> string
(** [get_application_directory ()] Get the directory of the running application
    (uses static string)*)

val make_directory : string -> int
(** [make_directory dir_path] Create directories (including full path
    requested), returns 0 on success*)

val change_directory : string -> bool
(** [change_directory dir] Change working directory, return true on success*)

val is_path_file : string -> bool
(** [is_path_file path] Check if a given path is a file or a directory*)

val is_file_name_valid : string -> bool
(** [is_file_name_valid file_name] Check if fileName is valid for the
    platform/OS*)

val load_directory_files : string -> FilePathList.t
(** [load_directory_files dir_path] Load directory filepaths*)

val load_directory_files_ex : string -> string -> bool -> FilePathList.t
(** [load_directory_files_ex base_path filter scan_subdirs] Load directory
    filepaths with extension filtering and recursive directory scan. Use 'DIR'
    in the filter string to include directories in the result*)

val unload_directory_files : FilePathList.t -> unit
(** [unload_directory_files files] Unload filepaths*)

val is_file_dropped : unit -> bool
(** [is_file_dropped ()] Check if a file has been dropped into window*)

val load_dropped_files : unit -> FilePathList.t
(** [load_dropped_files ()] Load dropped filepaths*)

val unload_dropped_files : FilePathList.t -> unit
(** [unload_dropped_files files] Unload dropped filepaths*)

val get_directory_file_count : string -> Unsigned.uint
(** [get_directory_file_count dir_path] Get the file count in a directory *)

val get_directory_file_count_ex : string -> string -> bool -> Unsigned.uint
(** [get_directory_file_count_ex base_path filter scan_subdirs] Get the file
    count in a directory with extension filtering and recursive directory scan.
    Use 'DIR' in the filter string to include directories in the result *)

val compress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [compress_data data data_length comp_data_length] Compress data (DEFLATE
    algorithm)*)

val decompress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [decompress_data comp_data comp_data_length data_length] Decompress data
    (DEFLATE algorithm)*)

val load_automation_event_list : string -> AutomationEventList.t
(** [load_automation_event_list file_name] Load automation events list from
    file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS*)

val unload_automation_event_list : AutomationEventList.t -> unit
(** [unload_automation_event_list list] Unload automation events list from file*)

val export_automation_event_list : AutomationEventList.t -> string -> bool
(** [export_automation_event_list list file_name] Export automation events list
    as text file*)

val set_automation_event_list : AutomationEventList.t ptr -> unit
(** [set_automation_event_list list] Set automation event list to record to*)

val set_automation_event_base_frame : int -> unit
(** [set_automation_event_base_frame frame] Set automation event internal base
    frame to start recording*)

val start_automation_event_recording : unit -> unit
(** [start_automation_event_recording ()] Start recording automation events
    (AutomationEventList must be set)*)

val stop_automation_event_recording : unit -> unit
(** [stop_automation_event_recording ()] Stop recording automation events*)

val play_automation_event : AutomationEvent.t -> unit
(** [play_automation_event event] Play a recorded automation event*)

val is_key_pressed : Key.t -> bool
(** [is_key_pressed key] Check if a key has been pressed once*)

val is_key_pressed_repeat : Key.t -> bool
(** [is_key_pressed_repeat key] Check if a key has been pressed again*)

val is_key_down : Key.t -> bool
(** [is_key_down key] Check if a key is being pressed*)

val is_key_released : Key.t -> bool
(** [is_key_released key] Check if a key has been released once*)

val is_key_up : Key.t -> bool
(** [is_key_up key] Check if a key is NOT being pressed*)

val get_key_pressed : unit -> Key.t
(** [get_key_pressed ()] Get key pressed (keycode), call it multiple times for
    keys queued, returns 0 when the queue is empty*)

val get_char_pressed : unit -> Uchar.t
(** [get_char_pressed ()] Get char pressed (unicode), call it multiple times for
    chars queued, returns 0 when the queue is empty*)

val get_key_name : Key.t -> string
(** [get_key_name key] Get name of a QWERTY key on the current keyboard layout
    (eg returns string 'q' for KEY_A on an AZERTY keyboard) *)

val set_exit_key : Key.t -> unit
(** [set_exit_key key] Set a custom key to exit program (default is ESC)*)

val is_gamepad_available : int -> bool
(** [is_gamepad_available gamepad] Check if a gamepad is available*)

val get_gamepad_name : int -> string
(** [get_gamepad_name gamepad] Get gamepad internal name id*)

val is_gamepad_button_pressed : int -> GamepadButton.t -> bool
(** [is_gamepad_button_pressed gamepad button] Check if a gamepad button has
    been pressed once*)

val is_gamepad_button_down : int -> GamepadButton.t -> bool
(** [is_gamepad_button_down gamepad button] Check if a gamepad button is being
    pressed*)

val is_gamepad_button_released : int -> GamepadButton.t -> bool
(** [is_gamepad_button_released gamepad button] Check if a gamepad button has
    been released once*)

val is_gamepad_button_up : int -> GamepadButton.t -> bool
(** [is_gamepad_button_up gamepad button] Check if a gamepad button is NOT being
    pressed*)

val get_gamepad_button_pressed : unit -> GamepadButton.t
(** [get_gamepad_button_pressed ()] Get the last gamepad button pressed*)

val get_gamepad_axis_count : int -> int
(** [get_gamepad_axis_count gamepad] Get gamepad axis count for a gamepad*)

val get_gamepad_axis_movement : int -> GamepadAxis.t -> float
(** [get_gamepad_axis_movement gamepad axis] Get axis movement value for a
    gamepad axis*)

val set_gamepad_mappings : string -> int
(** [set_gamepad_mappings mappings] Set internal gamepad mappings
    (SDL_GameControllerDB)*)

val set_gamepad_vibration : int -> float -> float -> float -> unit
(** [set_gamepad_vibration gamepad left_motor right_motor duration] Set gamepad
    vibration for both motors (duration in seconds)*)

val is_mouse_button_pressed : MouseButton.t -> bool
(** [is_mouse_button_pressed button] Check if a mouse button has been pressed
    once*)

val is_mouse_button_down : MouseButton.t -> bool
(** [is_mouse_button_down button] Check if a mouse button is being pressed*)

val is_mouse_button_released : MouseButton.t -> bool
(** [is_mouse_button_released button] Check if a mouse button has been released
    once*)

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
(** [get_mouse_wheel_move ()] Get mouse wheel movement for X or Y, whichever is
    larger*)

val get_mouse_wheel_move_v : unit -> Vector2.t
(** [get_mouse_wheel_move_v ()] Get mouse wheel movement for both X and Y*)

val set_mouse_cursor : MouseCursor.t -> unit
(** [set_mouse_cursor cursor] Set mouse cursor*)

val get_touch_x : unit -> int
(** [get_touch_x ()] Get touch position X for touch point 0 (relative to screen
    size)*)

val get_touch_y : unit -> int
(** [get_touch_y ()] Get touch position Y for touch point 0 (relative to screen
    size)*)

val get_touch_position : int -> Vector2.t
(** [get_touch_position index] Get touch position XY for a touch point index
    (relative to screen size)*)

val get_touch_point_id : int -> int
(** [get_touch_point_id index] Get touch point identifier for given index*)

val get_touch_point_count : unit -> int
(** [get_touch_point_count ()] Get number of touch points*)

val set_gestures_enabled : Gesture.t -> unit
(** [set_gestures_enabled flags] Enable a set of gestures using flags*)

val is_gesture_detected : Gesture.t -> bool
(** [is_gesture_detected gesture] Check if a gesture have been detected*)

val get_gesture_detected : unit -> Gesture.t
(** [get_gesture_detected ()] Get latest detected gesture*)

val get_gesture_hold_duration : unit -> float
(** [get_gesture_hold_duration ()] Get gesture hold time in seconds*)

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
(** [update_camera_pro camera movement rotation zoom] Update camera
    movement/rotation*)
