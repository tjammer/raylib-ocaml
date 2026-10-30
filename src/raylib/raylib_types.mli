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
end

module Vector3 : sig
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
end

module Vector4 : sig
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
end

module Matrix : sig
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

  val set_id : t -> FramebufferId.t -> unit
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
  (** Camera offset (screen space offset from window origin, unscaled by DPI,
      real pixel size) *)

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
  val count : t -> int
  val paths : t -> string ptr
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
