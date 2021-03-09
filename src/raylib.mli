(** {1 Ctypes reexports}

  Basic types and utility functions shared by the following modules *)

type 'a ctyp

type 'a ptr

val addr : 'a ctyp -> 'a ctyp ptr

val to_voidp : 'a ptr -> unit ptr

val ptr_of_int : int -> int ptr

val ptr_of_uint : Unsigned.uint -> Unsigned.uint ptr

val void_ptr_of_int : int -> unit ptr

module CArray = Ctypes.CArray

(** {1 Constants} *)

module ConfigFlag : sig
  type t =
    | VSync_hint
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
    | MSAA_4X_hint
    | Window_interlaced_hint

  val to_int : t -> int

  val of_int : int -> t
end

module TraceLogType : sig
  type t = All | Trace | Debug | Info | Warning | Error | Fatal | None

  val to_int : t -> int

  val of_int : int -> t
end

module Key : sig
  type t =
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
    | Keyboard_menu
    | Left_bracket
    | Backslash
    | Right_bracket
    | Grave
    | Keypad_0
    | Keypad_1
    | Keypad_2
    | Keypad_3
    | Keypad_4
    | Keypad_5
    | Keypad_6
    | Keypad_7
    | Keypad_8
    | Keypad_9
    | Keypad_decimal
    | Keypad_divide
    | Keypad_multiply
    | Keypad_subtract
    | Keypad_add
    | Keypad_enter
    | Keypad_equal

  val to_int : t -> int

  val of_int : int -> t
end

module AndroidButton : sig
  type t = Back | Menu | Volume_up | Volume_down

  val to_int : t -> int

  val of_int : int -> t
end

module MouseButton : sig
  type t = Left | Right | Middle

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
    | Resize_EW
    | Resize_NS
    | Resize_NWSE
    | Resize_NESW
    | Resize_All
    | Not_allowed

  val to_int : t -> int

  val of_int : int -> t
end

module GamepadNumber : sig
  type t = Player1 | Player2 | Player3 | Player4

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

module ShaderLocationIndex : sig
  type t =
    | Vertex_position
    | Vertex_texcoord01
    | Vertex_texcoord02
    | Vertex_normal
    | Vertex_tangent
    | Vertex_color
    | Matrix_mvp
    | Matrix_model
    | Matrix_view
    | Matrix_projection
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
    | Map_BRDF
    | Map_diffuse
    | Map_specular

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
    | IVec2
    | IVec3
    | IVec4
    | Sampler2D

  val to_int : t -> int

  val of_int : int -> t
end

module MaterialMapType : sig
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
    | BRDF
    | Diffuse
    | Specular

  val to_int : t -> int

  val of_int : int -> t
end

module PixelFormat : sig
  type t =
    | Uncompressed_grayscale
    | Uncompressed_gray_alpha
    | Uncompressed_R5G6B5
    | Uncompressed_R8G8B8
    | Uncompressed_R5G5B5A1
    | Uncompressed_R4G4B4A4
    | Uncompressed_R8G8B8A8
    | Uncompressed_R32
    | Uncompressed_R32G32B32
    | Uncompressed_R32G32B32A32
    | Compressed_DXT1_RGB
    | Compressed_DXT1_RGBA
    | Compressed_DXT3_RGBA
    | Compressed_DXT5_RGBA
    | Compressed_ETC1_RGB
    | Compressed_ETC2_RGB
    | Compressed_ETC2_EAC_RGBA
    | Compressed_PVRT_RGB
    | Compressed_PVRT_RGBA
    | Compressed_ASTC_4x4_RGBA
    | Compressed_ASTC_8x8_RGBA

  val to_int : t -> int

  val of_int : int -> t
end

module TextureFilterMode : sig
  type t =
    | Point
    | Bilinear
    | Trilinear
    | Anisotropic_4X
    | Anisotropic_8X
    | Anisotropic_16X

  val to_int : t -> int

  val of_int : int -> t
end

module CubemapLayoutType : sig
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

module TextureWrapMode : sig
  type t = Repeat | Clamp | Mirror_repeat | Mirror_clamp

  val to_int : t -> int

  val of_int : int -> t
end

module FontType : sig
  type t = Default | Bitmap | SDF

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
    | Custom

  val to_int : t -> int

  val of_int : int -> t
end

module GestureType : sig
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

module CameraType : sig
  type t = Perspective | Orthographic

  val to_int : t -> int

  val of_int : int -> t
end

module NPatchType : sig
  type t = Nine_patch | Three_patch_vertical | Three_patch_horizontal

  val to_int : t -> int

  val of_int : int -> t
end

val max_material_maps : int

val max_shader_locations : int

(** {1 Types} *)

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

  val create : float -> float -> float -> float -> t

  val x : t -> float

  val y : t -> float

  val z : t -> float

  val w : t -> float

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
  type t'

  type t = t' ctyp

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

  val create : float -> float -> float -> float -> t
  (** [create x y width height] creates a rectangle with given dimensions. *)

  val x : t -> float

  val y : t -> float

  val width : t -> float

  val height : t -> float

  val set_x : t -> float -> unit

  val set_y : t -> float -> unit

  val set_width : t -> float -> unit

  val set_height : t -> float -> unit
end

module Texture : sig
  type t'

  type t = t' ctyp

  val id : t -> Unsigned.uint

  val width : t -> int

  val height : t -> int

  val mipmaps : t -> int

  val format : t -> PixelFormat.t
end

module Texture2D = Texture

module Image : sig
  type t'

  type t = t' ctyp

  val width : Texture.t -> int

  val height : Texture.t -> int

  val mipmaps : Texture.t -> int

  val format : Texture.t -> PixelFormat.t
end

module RenderTexture : sig
  type t'

  type t = t' ctyp

  val texture : t -> Texture.t

  val depth : t -> Texture.t
end

module RenderTexture2D = RenderTexture

module NPatchInfo : sig
  type t'

  type t = t' ctyp

  val create : Rectangle.t -> int -> int -> int -> int -> NPatchType.t -> t
  (** [create source left top right bottom type] returns a N-Patch layout info. *)

  val source : t -> Rectangle.t

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

  val chars_padding : t -> int

  val texture : t -> Texture.t

  val recs : t -> Rectangle.t ptr

  val chars : t -> CharInfo.t CArray.t
end

module Camera3D : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector3.t -> Vector3.t -> float -> CameraType.t -> t
  (** [create position target up fovy] defines a camera position/orientation in 3d space *)

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
  (** [create offset target rotation zoom] defines a 2d camera *)

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

  val locs : t -> int CArray.t

  val set_loc : t -> ShaderLocationIndex.t -> int -> unit

  val set_locs : t -> int CArray.t -> unit
end

module MaterialMap : sig
  type t'

  type t = t' ctyp

  val create : Texture.t -> Color.t -> float -> t
  (** [create texture color value] returns a material texture map *)

  val texture : t -> Texture.t

  val color : t -> Color.t

  val value : t -> float

  val set_texture : t -> Texture.t -> unit

  val set_color : t -> Color.t -> unit

  val set_value : t -> float -> unit
end

module Material : sig
  type t'

  type t = t' ctyp

  val create : Shader.t -> MaterialMap.t ptr -> float ptr -> t

  val shader : t -> Shader.t

  val maps : t -> MaterialMap.t CArray.t

  val params : t -> float CArray.t

  val set_shader : t -> Shader.t -> unit

  val set_maps : t -> MaterialMap.t CArray.t -> unit
end

module Transform : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector4.t -> Vector3.t -> t
  (** [create translation rotation scale] returns transformation properties *)

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

  val meshes : t -> Mesh.t CArray.t

  val materials : t -> Material.t CArray.t

  val bones : t -> BoneInfo.t CArray.t

  val bind_pose : t -> Transform.t ptr

  val set_transform : t -> Matrix.t -> unit

  val set_meshes : t -> Mesh.t CArray.t -> unit

  val set_materials : t -> Material.t CArray.t -> unit

  val set_bones : t -> BoneInfo.t CArray.t -> unit

  val set_bind_pose : t -> Transform.t ptr -> unit
end

module ModelAnimation : sig
  type t'

  type t = t' ctyp

  val bones : t -> BoneInfo.t CArray.t

  val bone_count : t -> int

  val frame_count : t -> int

  val frame_pose_at : t -> int -> Transform.t CArray.t
end

module Ray : sig
  type t'

  type t = t' ctyp

  val create : Vector3.t -> Vector3.t -> t
  (** [create position direction] returns a ray type for raycasting. *)

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
  (** [create min max] returns a bounding box. *)

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

(** {1 Functions}
  {2 Window and Graphics Device Functions (Module: core) }
  {3 Window-related functions }
   *)

val init_window : int -> int -> string -> unit
(** [init_window width heigth title] initializes window and OpenGL context *)

val window_should_close : unit -> bool
(** Check if KEY_ESCAPE pressed or Close icon pressed *)

val close_window : unit -> unit
(** Close window and unload OpenGL context *)

val is_window_ready : unit -> bool
(** Check if window has been initialized successfully *)

val is_window_fullscreen : unit -> bool
(** Check if window is currently fullscreen *)

val is_window_hidden : unit -> bool
(** Check if window is currently hidden (only PLATFORM_DESKTOP *)

val is_window_minimized : unit -> bool
(** Check if window has been minimized (or lost focus) *)

val is_window_maximized : unit -> bool
(** Check if window is currently maximized (only PLATFORM_DESKTOP) *)

val is_window_focused : unit -> bool
(** Check if window is currently focused (only PLATFORM_DESKTOP *)

val is_window_resized : unit -> bool
(** Check if window has been resized last frame *)

val is_window_state : ConfigFlag.t -> bool
(** Check if one specific window flag is enabled *)

val set_window_state : ConfigFlag.t list -> unit
(** Set window configuration state using flags *)

val clear_window_state : ConfigFlag.t list -> unit
(** Clear window configuration state flags   *)

val toggle_fullscreen : unit -> unit
(** Toggle fullscreen mode (only PLATFORM_DESKTOP) *)

val maximize_window : unit -> unit
(** Set window state: maximized, if resizable (only PLATFORM_DESKTOP *)

val minimize_window : unit -> unit
(** Set window state: minimized, if resizable (only PLATFORM_DESKTOP *)

val restore_window : unit -> unit
(** Set window state: not minimized/maximized (only PLATFORM_DESKTOP *)

val set_window_icon : Image.t -> unit
(**  Set icon for window (only PLATFORM_DESKTOP) *)

val set_window_title : string -> unit
(** Set title for window (only PLATFORM_DESKTOP) *)

val set_window_position : int -> int -> unit
(** [set_window_position x y] sets window position on screen (only PLATFORM_DESKTOP) *)

val set_window_monitor : int -> unit
(** Set monitor for the current window (fullscreen mode) *)

val set_window_min_size : int -> int -> unit
(** [set_window_min_size width height] sets window minimum dimensions (for FLAG_WINDOW_RESIZABLE) *)

val set_window_size : int -> int -> unit
(** [set_window_size width height] sets window dimensions *)

val get_window_handle : unit -> unit ptr option
(** Get native window handle *)

val get_screen_width : unit -> int
(** Get current screen width *)

val get_screen_height : unit -> int
(** Get current screen height *)

val get_monitor_count : unit -> int
(** Get number of connected monitors *)

val get_monitor_position : int -> Vector2.t
(** Get specified monitor position *)

val get_monitor_width : int -> int
(** Get specified monitor width *)

val get_monitor_height : int -> int
(** Get specified monitor height *)

val get_monitor_physical_width : int -> int
(** Get specified monitor physical width in millimetres *)

val get_monitor_physical_height : int -> int
(** Get specified monitor physical height in millimetres *)

val get_monitor_refresh_rate : int -> int
(** Get specified monitor refresh rate *)

val get_window_position : unit -> Vector2.t
(** Get window position XY on monitor *)

val get_window_scale_dpi : unit -> Vector2.t
(** Get window scale DPI factor *)

val get_monitor_name : int -> string
(** Get the human-readable, UTF-8 encoded name of the primary monitor *)

val set_clipboard_text : string -> unit
(** Set clipboard text content *)

val get_clipboard_text : unit -> string option
(** Get clipboard text content *)

(** {3 Cursor-related functions} *)

val show_cursor : unit -> unit
(** Shows cursor *)

val hide_cursor : unit -> unit
(** Hides cursor *)

val is_cursor_hidden : unit -> bool
(** Check if cursor is not visible *)

val enable_cursor : unit -> unit
(** Enables cursor (unlock cursor) *)

val disable_cursor : unit -> unit
(** Disables cursor (lock cursor) *)

val is_cursor_on_screen : unit -> bool
(** Check if cursor is on the current screen *)

(** {3 Drawing-related functions} *)

val clear_background : Color.t -> unit
(** Set background color (framebuffer clear color) *)

val begin_drawing : unit -> unit
(** Setup canvas (framebuffer) to start drawing *)

val end_drawing : unit -> unit
(** End canvas drawing and swap buffers (double buffering) *)

val begin_mode_2d : Camera2D.t -> unit
(** Initialize 2D mode with custom camera (2D) *)

val end_mode_2d : unit -> unit
(** Ends 2D mode with custom camera *)

val begin_mode_3d : Camera3D.t -> unit
(** Initializes 3D mode with custom camera (3D) *)

val end_mode_3d : unit -> unit
(** Ends 3D mode and returns to default 2D orthographic mode *)

val begin_texture_mode : RenderTexture.t -> unit
(** Initializes render texture for drawing *)

val end_texture_mode : unit -> unit
(** Ends drawing to render texture *)

val begin_scissor_mode : int -> int -> int -> int -> unit
(** [begin_scissor_mode x y width height] defines screen area for following drawing *)

val end_scissor_mode : unit -> unit
(** End scissor mode *)

(** {3 Screen-space-related functions} *)

val get_mouse_ray : Vector2.t -> Camera3D.t -> Ray.t
(** Returns a ray trace from mouse position *)

val get_camera_matrix : Camera3D.t -> Matrix.t
(** Returns camera transform matrix (view matrix) *)

val get_camera_matrix_2d : Camera2D.t -> Matrix.t
(** Returns camera 2d transform matrix *)

val get_world_to_screen : Vector3.t -> Camera3D.t -> Vector2.t
(** Returns the screen space position for a 3d world space position *)

val get_world_to_screen_ex : Vector3.t -> Camera3D.t -> int -> int -> Vector2.t
(** [get_world_to_screen_ex position camera width height] returns size position for a 3d world space position *)

val get_world_to_screen_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** Returns the screen space position for a 2d camera world space position *)

val get_screen_to_world_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** Returns the world space position for a 2d camera screen space position *)

(** {3 Timing-related functions} *)

val set_target_fps : int -> unit
(** Set target FPS (maximum) *)

val get_fps : unit -> int
(** Returns current FPS *)

val get_frame_time : unit -> float
(** Returns time in seconds for last frame drawn *)

val get_time : unit -> float
(** Returns elapsed time in seconds since InitWindow() *)

(** {3 Misc. functions} *)

val set_config_flags : ConfigFlag.t list -> unit
(** Setup init configuration flags (view FLAGS) *)

val set_trace_log_level : TraceLogType.t -> unit
(** Set the current threshold (minimum) log level *)

val set_trace_log_exit : TraceLogType.t -> unit
(** Set the exit threshold (minimum) log level *)

val trace_log : TraceLogType.t -> string -> unit
(** Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR) *)

val take_screenshot : string -> unit
(** Takes a screenshot of current screen (saved a .png) *)

val get_random_value : int -> int -> int
(** Returns a random value between min and max (both included) *)

(** {3 Files management functions} *)

val load_file_data : string -> Unsigned.uchar CArray.t
(** Load file data as byte array (read) *)

val unload_file_data : string -> unit
(** Unload file data allocated by load_file_data *)

val save_file_data : string -> 'a CArray.t -> unit
(** Save data to file from byte array (write) *)

val load_file_text : string -> string
(** Load text data from file (read), returns a '' terminated string *)

val unload_file_text : string -> unit
(** Unload file text data allocated by load_file_text *)

val save_file_text : string -> string -> unit
(** [save_file_text filename text] saves text data to file (write), string must be '\0' terminated *)

val file_exists : string -> bool
(** Check if file exists *)

val directory_exists : string -> bool
(** Check if a directory path exists *)

val is_file_extension : string -> string -> bool
(** [is_file_extension filename ext] checks file extension *)

val get_file_extension : string -> string
(** Get extension for a filename string (including point: ".png") *)

val get_file_name : string -> string
(** Get pointer to filename for a path string *)

val get_file_name_without_ext : string -> string
(** Get filename string without extension (uses static string) *)

val get_directory_path : string -> string
(** Get full path for a given fileName with path (uses static string) *)

val get_prev_directory_path : string -> string
(** Get previous directory path for a given path (uses static string) *)

val get_working_directory : unit -> string
(** Get current working directory (uses static string) *)

val get_directory_files : string -> string CArray.t
(** Get filenames in a directory path (memory should be freed) *)

val clear_directory_files : unit -> unit
(** Clear directory files paths buffers (free memory) *)

val change_directory : string -> bool
(** Change working directory, return true on success *)

val is_file_dropped : unit -> bool
(** Check if a file has been dropped into window *)

val get_dropped_files : unit -> string CArray.t
(** Get dropped files names (memory should be freed) *)

val clear_dropped_files : unit -> unit
(** Clear dropped files paths buffer (free memory) *)

val get_file_mod_time : string -> Signed.long
(** Get file modification time (last write time) *)

val compress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** Compress data (DEFLATE algorithm) *)

val decompress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** Decompress data (DEFLATE algorithm) *)

(** {3 Persistent storage management} *)

val save_storage_value : int -> int -> unit
(** [save_storage_value position value] saves integer value to storage file (to defined position), returns true on success *)

val load_storage_value : int -> int
(** Load integer value from storage file (from defined position) *)

val open_url : string -> unit
(** Open URL with default system browser (if available) *)

(** {2 Input Handling Functions (Module: core)} *)

(** {3 Input-related functions: keyboard} *)

val is_key_pressed : Key.t -> bool
(** Detect if a key has been pressed once *)

val is_key_down : Key.t -> bool
(** Detect if a key is being pressed *)

val is_key_released : Key.t -> bool
(** Detect if a key has been released once *)

val is_key_up : Key.t -> bool
(** Detect if a key is NOT being pressed *)

val set_exit_key : Key.t -> unit
(** Set a custom key to exit program (default is ESC) *)

val get_key_pressed : unit -> Key.t
(** Get key pressed (keycode), call it multiple times for keys queued *)

val get_char_pressed : unit -> int
(** Get char pressed (unicode), call it multiple times for chars queued *)

(** {3 Input-related functions: gamepads} *)

val is_gamepad_available : GamepadNumber.t -> bool
(** Detect if a gamepad is available *)

val is_gamepad_name : GamepadNumber.t -> string -> bool
(** Check gamepad name (if available) *)

val get_gamepad_name : GamepadNumber.t -> string
(** Return gamepad internal name id *)

val is_gamepad_button_pressed : GamepadNumber.t -> GamepadButton.t -> bool
(** Detect if a gamepad button has been pressed once *)

val is_gamepad_button_down : GamepadNumber.t -> GamepadButton.t -> bool
(** Detect if a gamepad button is being pressed *)

val is_gamepad_button_released : GamepadNumber.t -> GamepadButton.t -> bool
(** Detect if a gamepad button has been released once *)

val is_gamepad_button_up : GamepadNumber.t -> GamepadButton.t -> bool
(** Detect if a gamepad button is NOT being pressed *)

val get_gamepad_button_pressed : unit -> GamepadButton.t
(** Get the last gamepad button pressed *)

val get_gamepad_axis_count : GamepadNumber.t -> int
(** Return gamepad axis count for a gamepad *)

val get_gamepad_axis_movement : GamepadNumber.t -> GamepadAxis.t -> float
(** Return axis movement value for a gamepad axis *)

(** {3 Input-related functions: mouse} *)

val is_mouse_button_pressed : MouseButton.t -> bool
(** Detect if a mouse button has been pressed once *)

val is_mouse_button_down : MouseButton.t -> bool
(** Detect if a mouse button is being pressed *)

val is_mouse_button_released : MouseButton.t -> bool
(** Detect if a mouse button has been released once *)

val is_mouse_button_up : MouseButton.t -> bool
(** Detect if a mouse button is NOT being pressed *)

val get_mouse_x : unit -> int
(** Returns mouse position X *)

val get_mouse_y : unit -> int
(** Returns mouse position Y *)

val get_mouse_position : unit -> Vector2.t
(** Returns mouse position XY *)

val set_mouse_position : int -> int -> unit
(** [set_mouse_position x y ] sets mouse position XY *)

val set_mouse_offset : int -> int -> unit
(** [set_mouse_offset ofs_x ofs_y] sets mouse offset *)

val set_mouse_scale : float -> float -> unit
(** [set_mouse_scale scale_x scale_y] sets mouse scaling *)

val get_mouse_wheel_move : unit -> float
(** Returns mouse wheel movement Y *)

val get_mouse_cursor : unit -> MouseCursor.t
(** Returns mouse cursor if (MouseCursor enum *)

val set_mouse_cursor : MouseCursor.t -> unit
(** Set mouse cursor *)

(** {3 Input-related functions: touch} *)

val get_touch_x : unit -> int
(** Returns touch position X for touch point 0 (relative to screen size) *)

val get_touch_y : unit -> int
(** Returns touch position Y for touch point 0 (relative to screen size) *)

val get_touch_position : int -> Vector2.t
(** Returns touch position XY for a touch point index (relative to screen size) *)

(** {3 Gestures and Touch Handling Functions (Module: gestures)} *)

val is_gesture_detected : int -> bool
(** Check if a gesture have been detected *)

val get_gesture_detected : unit -> int
(** Get latest detected gesture *)

val get_touch_points_count : unit -> int
(** Get touch points count *)

val get_gesture_hold_duration : unit -> float
(** Get gesture hold time in milliseconds *)

val get_gesture_drag_vector : unit -> Vector2.t
(** Get gesture drag vector *)

val get_gesture_drag_angle : unit -> float
(** Get gesture drag angle *)

val get_gesture_pinch_vector : unit -> Vector2.t
(** Get gesture pinch delta *)

val get_gesture_pinch_angle : unit -> float
(** Get gesture pinch angle *)

(** {3 Camera System Functions (Module: camera)} *)

val set_camera_mode : Camera3D.t -> CameraMode.t -> unit
(** Set camera mode (multiple camera modes available) *)

val update_camera : Camera3D.t ptr -> unit
(** Update camera position for selected mode *)

val set_camera_pan_control : Key.t -> unit
(** Set camera pan key to combine with mouse movement (free camera) *)

val set_camera_alt_control : Key.t -> unit
(** Set camera alt key to combine with mouse movement (free camera) *)

val set_camera_smooth_zoom_control : Key.t -> unit
(** Set camera smooth zoom key to combine with mouse (free camera) *)

val set_camera_move_controls :
  Key.t -> Key.t -> Key.t -> Key.t -> Key.t -> Key.t -> unit
(** [set_camera_move_controls front back right left up down] sets camera move controls (1st person and 3rd person cameras) *)

(** {2 Basic Shapes Drawing Functions (Module: shapes)} *)

(** {3 Basic shapes drawing functions} *)

val draw_pixel : int -> int -> Color.t -> unit
(** [draw_pixel x y color] draws a pixel at [x, y] *)

val draw_pixel_v : Vector2.t -> Color.t -> unit
(** Draw a pixel (Vector version) *)

val draw_line : int -> int -> int -> int -> Color.t -> unit
(** [draw_line start_x start_y end_x end_y color] draws a line *)

val draw_line_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_line_v start end color] draws a line (Vector version) *)

val draw_line_ex : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_v start end thickness color] draws a line defining thickness *)

val draw_line_bezier : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_bezier start end thickness color] draws a line using cubic-bezier curves in-out *)

val draw_line_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_line_strip points pointsCount color] draws lines sequence *)

val draw_circle : int -> int -> float -> Color.t -> unit
(** [draw_circle center_x center_y radius color] draws a color-filled circle *)

val draw_circle_sector :
  Vector2.t -> float -> int -> int -> int -> Color.t -> unit
(** [draw_circle_sector center radius start_angle end_angle segments color] draws a piece of a circle *)

val draw_circle_sector_lines :
  Vector2.t -> float -> int -> int -> int -> Color.t -> unit
(** [draw_circle_sector_lines center radius startAngle endAngle segments color]  draws circle sector outline *)

val draw_circle_gradient : int -> int -> float -> Color.t -> Color.t -> unit
(** [draw_circle_gradient centerX centerY radius color1 color2] draws a gradient-filled circle *)

val draw_circle_v : Vector2.t -> float -> Color.t -> unit
(** [draw_circle_v center radius color] draws a color-filled circle (Vector version) *)

val draw_circle_lines : int -> int -> float -> Color.t -> unit
(** [draw_circle_lines centerX centerY radius color] draws circle outline *)

val draw_ellipse : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse centerX centerY radiusH radiusV color] draws ellipse *)

val draw_ellipse_lines : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse_lines centerX centerY radiusH radiusV color] draws ellipse outline *)

val draw_ring :
  Vector2.t -> float -> float -> int -> int -> int -> Color.t -> unit
(** [draw_ring center innerRadius outerRadius startAngle endAngle segments color] draws ring *)

val draw_ring_lines :
  Vector2.t -> float -> float -> int -> int -> int -> Color.t -> unit
(** [draw_ring_lines center innerRadius outerRadius startAngle endAngle segments color] draws ring outline *)

val draw_rectangle : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle posX posY width height color] draws a color-filled rectangle *)

val draw_rectangle_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_rectangle_v position size color] draws a color-filled rectangle (Vector version) *)

val draw_rectangle_rec : Rectangle.t -> Color.t -> unit
(** [draw_rectangle_rec position size color] draws a color-filled rectangle *)

val draw_rectangle_pro : Rectangle.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_rectangle_pro rec origin rotation color] draws a color-filled rectangle with pro parameters *)

val draw_rectangle_gradient_v :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_v posX posY width height color1 color2] draws a vertical-gradient-filled rectangle *)

val draw_rectangle_gradient_h :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_h posX posY width height color1 color2] draws a horizontal-gradient-filled rectangle *)

val draw_rectangle_gradient_ex :
  Rectangle.t -> Color.t -> Color.t -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_ex rec col1 col2 col3 col4] draws a gradient-filled rectangle with custom vertex colors *)

val draw_rectangle_lines : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle_lines posX posY width height color] draws rectangle outline *)

val draw_rectangle_lines_ex : Rectangle.t -> int -> Color.t -> unit
(** [draw_rectangle_lines_ex rec lineThick color] draws rectangle outline with extended parameters *)

val draw_rectangle_rounded : Rectangle.t -> float -> int -> Color.t -> unit
(** [draw_rectangle_rounded rec roundness segments color] draws rectangle with rounded edges *)

val draw_rectangle_rounded_lines :
  Rectangle.t -> float -> int -> int -> Color.t -> unit
(** [draw_rectangle_rounded_lines rec roundness segments lineThick color] draws rectangle with rounded edges outline *)

val draw_triangle : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle v1 v2 v3 color] draws a color-filled triangle (vertex in counter-clockwise order!) *)

val draw_triangle_lines : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle_lines v1 v2 v3 color] draws triangle outline (vertex in counter-clockwise order!) *)

val draw_triangle_fan : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_fan points pointsCount color] draws a triangle fan defined by points (first vertex is the center) *)

val draw_triangle_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip points pointsCount color] draws a triangle strip defined by points *)

val draw_poly : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly center sides radius rotation color] draws a regular polygon (Vector version) *)

val draw_poly_lines : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly_lines center sides radius rotation color] draws a polygon outline of n sides *)

(** {3 Basic shapes collision detection functions} *)

val check_collision_recs : Rectangle.t -> Rectangle.t -> bool
(** Check collision between two rectangles *)

val check_collision_circles : Vector2.t -> float -> Vector2.t -> float -> bool
(** Check collision between two circles *)

val check_collision_circle_rec : Vector2.t -> float -> Rectangle.t -> bool
(** Check collision between circle and rectangle *)

val check_collision_point_rec : Vector2.t -> Rectangle.t -> bool
(** Check if point is inside rectangle *)

val check_collision_point_circle : Vector2.t -> Vector2.t -> float -> bool
(** [check_collision_point_circle point center radius] checks if point is inside circle *)

val check_collision_point_triangle :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> bool
(** [check_collision_point_triangle point p1 p2 p3] checks if point is inside a triangle *)

(* TODO maybe GetCollisionLines *)

val get_collision_rec : Rectangle.t -> Rectangle.t -> Rectangle.t
(** Get collision rectangle for two rectangles collision *)

(** {2 Texture Loading and Drawing Functions (Module: textures)} *)

(** {3 Image loading functions} *)

val load_image : string -> Image.t
(** Load image from file into CPU memory (RAM) *)

val load_image_raw : string -> int -> int -> PixelFormat.t -> int -> Image.t
(** [load_image_raw fileName width height format headerSize] loads image from RAW file data *)

val unload_image : Image.t -> unit
(** Unload image from CPU memory (RAM) *)

val export_image : Image.t -> string -> bool
(** Export image data to file *)

val export_image_as_code : Image.t -> string -> bool
(** [export_image_as_code image filename] exports image as code file defining an array of bytes, returns true on success *)

val gen_image_color : int -> int -> Color.t -> Image.t
(** Generate image: plain color *)

val gen_image_gradient_v : int -> int -> Color.t -> Color.t -> Image.t
(** Generate image: vertical gradient *)

val gen_image_gradient_h : int -> int -> Color.t -> Color.t -> Image.t
(** Generate image: horizontal gradient *)

val gen_image_gradient_radial :
  int -> int -> float -> Color.t -> Color.t -> Image.t
(** Generate image: radial gradient *)

val gen_image_checked :
  int -> int -> int -> int -> Color.t -> Color.t -> Image.t
(** Generate image: checked *)

val gen_image_white_noise : int -> int -> float -> Image.t
(** Generate image: white noise *)

val gen_image_perlin_noise : int -> int -> int -> int -> float -> Image.t
(** Generate image: perlin noise *)

val gen_image_cellular : int -> int -> int -> Image.t
(** Generate image: cellular algorithm. Bigger tileSize means bigger cells *)

(** {3 Image manipulation functions} *)

val image_copy : Image.t -> Image.t
(** Create an image duplicate (useful for transformations) *)

val image_from_image : Image.t -> Rectangle.t -> Image.t
(** Create an image from another image piece *)

val image_text : string -> int -> Color.t -> Image.t
(** Create an image from text (default font) *)

val image_text_ex : Font.t -> string -> float -> float -> Color.t -> Image.t
(** Create an image from text (custom sprite font) *)

val image_format : Image.t ptr -> int -> unit
(** Convert image data to desired format *)

val image_to_pot : Image.t ptr -> Color.t -> unit
(** Convert image to POT (power-of-two) *)

val image_crop : Image.t ptr -> Rectangle.t -> unit
(** Crop an image to a defined rectangle *)

val image_alpha_crop : Image.t ptr -> float -> unit
(** Crop image depending on alpha value *)

val image_alpha_mask : Image.t ptr -> Image.t -> unit
(** Apply alpha mask to image *)

val image_alpha_clear : Image.t ptr -> Color.t -> float -> unit
(** Clear alpha channel to desired color *)

val image_alpha_premultiply : Image.t ptr -> unit
(** Premultiply alpha channel *)

val image_resize : Image.t ptr -> int -> int -> unit
(** Resize image (Bicubic scaling algorithm) *)

val image_resize_nn : Image.t ptr -> int -> int -> unit
(** Resize image (Nearest-Neighbor scaling algorithm) *)

val image_resize_canvas :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** Resize canvas and fill with color *)

val image_mipmaps : Image.t ptr -> unit
(** Generate all mipmap levels for a provided image *)

val image_dither : Image.t ptr -> int -> int -> int -> int -> unit
(** Dither image data to 16bpp or lower (Floyd-Steinberg dithering) *)

val image_flip_vertical : Image.t ptr -> unit
(** Flip image vertically *)

val image_flip_horizontal : Image.t ptr -> unit
(** Flip image horizontally *)

val image_rotate_cw : Image.t ptr -> unit
(** Rotate image clockwise 90deg *)

val image_rotate_ccw : Image.t ptr -> unit
(** Rotate image counter-clockwise 90deg *)

val image_color_tint : Image.t ptr -> Color.t -> unit
(** Modify image color: tint *)

val image_color_invert : Image.t ptr -> unit
(** Modify image color: invert *)

val image_color_grayscale : Image.t ptr -> unit
(** Modify image color: grayscale *)

val image_color_contrast : Image.t ptr -> float -> unit
(** Modify image color: contrast (-100 to 100) *)

val image_color_brightness : Image.t ptr -> int -> unit
(** Modify image color: brightness (-255 to 255) *)

val image_color_replace : Image.t ptr -> Color.t -> Color.t -> unit
(** Modify image color: replace color *)

val get_image_alpha_border : Image.t -> float -> Rectangle.t
(** Get image alpha border rectangle *)

(** {3 Image drawing functions} *)

val image_clear_background : Image.t ptr -> Color.t -> unit
(** Clear image background with given color *)

val image_draw_pixel : Image.t ptr -> int -> int -> Color.t -> unit
(** Draw pixel within an image *)

val image_draw_pixel_v : Image.t ptr -> Vector2.t -> Color.t -> unit
(** Draw pixel within an image (Vector version) *)

val image_draw_line : Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** Draw line within an image *)

val image_draw_line_v : Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** Draw line within an image (Vector version) *)

val image_draw_circle : Image.t ptr -> int -> int -> int -> Color.t -> unit
(** Draw circle within an image *)

val image_draw_circle_v : Image.t ptr -> Vector2.t -> int -> Color.t -> unit
(** Draw circle within an image (Vector version) *)

val image_draw_rectangle :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** Draw rectangle within an image *)

val image_draw_rectangle_v :
  Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** Draw rectangle within an image (Vector version) *)

val image_draw_rectangle_rec : Image.t ptr -> Rectangle.t -> Color.t -> unit
(** Draw rectangle within an image  *)

val image_draw_rectangle_lines :
  Image.t ptr -> Rectangle.t -> int -> Color.t -> unit
(** Draw rectangle lines within an image *)

val image_draw :
  Image.t ptr -> Image.t -> Rectangle.t -> Rectangle.t -> Color.t -> unit
(** Draw a source image within a destination image (tint applied to source) *)

val image_draw_text :
  Image.t ptr -> string -> int -> int -> int -> Color.t -> unit
(** [image_draw_text dst text posX posY fontSize color]  draws text (using default font) within an image (destination) *)

val image_draw_text_ex :
  Image.t ptr ->
  Font.t ->
  string ->
  Vector2.t ->
  float ->
  float ->
  Color.t ->
  unit
(** [image_draw_text_ex dst font text position fontSize spacing tint] draws text (custom sprite font) within an image (destination) *)

(** {3 Texture loading functions} *)

val load_texture : string -> Texture.t
(** Load texture from file into GPU memory (VRAM) *)

val load_texture_from_image : Image.t -> Texture.t
(** Load texture from image data *)

val load_texture_cubemap : Image.t -> int -> Texture.t
(** Load cubemap from image, multiple image cubemap layouts supported *)

val load_render_texture : int -> int -> RenderTexture.t
(** Load texture for rendering (framebuffer) *)

val unload_texture : Texture.t -> unit
(** Unload texture from GPU memory (VRAM) *)

val unload_render_texture : RenderTexture.t -> unit
(** Unload render texture from GPU memory (VRAM) *)

val update_texture : Texture.t -> unit ptr -> unit
(** [update_texture texture pixels]  updates GPU texture with new data *)

val update_texture_rec : Texture.t -> Rectangle.t -> unit ptr -> unit
(** [update_texture_rec texture rec pixels] updates GPU texture rectangle with new data *)

val get_texture_data : Texture.t -> Image.t
(** Get pixel data from GPU texture and return an Image *)

val get_screen_data : unit -> Image.t
(** Get pixel data from screen buffer and return an Image (screenshot) *)

(** {3 Texture configuration functions} *)

val gen_texture_mipmaps : Texture.t ptr -> unit
(** Generate GPU mipmaps for a texture *)

val set_texture_filter : Texture.t -> TextureFilterMode.t -> unit
(** Set texture scaling filter mode *)

val set_texture_wrap : Texture.t -> TextureWrapMode.t -> unit
(** Set texture wrapping mode *)

(** {3 Texture drawing functions} *)

val draw_texture : Texture.t -> int -> int -> Color.t -> unit
(** [draw_texture texture posX posY tint] draws a Texture *)

val draw_texture_v : Texture.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_v texture position tint] draws a Texture with position defined as Vector2 *)

val draw_texture_ex :
  Texture.t -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_texture_ex texture position rotation scale tint] draws a Texture with extended parameters *)

val draw_texture_rec : Texture.t -> Rectangle.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_rec texture source position tint] draws a part of a texture defined by a rectangle *)

val draw_texture_quad :
  Texture.t -> Vector2.t -> Vector2.t -> Rectangle.t -> Color.t -> unit
(** [draw_texture_quad texture tiling offset quad tint] draws texture quad with tiling and offset parameters *)

val draw_texture_tiled :
  Texture.t ->
  Rectangle.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  float ->
  Color.t ->
  unit
(** [draw_texture_tiled texture source dest origin rotation scale tint] draws part of a texture (defined by a rectangle) with rotation and scale tiled into dest *)

val draw_texture_pro :
  Texture.t ->
  Rectangle.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_pro texture source dest origin rotation tint] draws a part of a texture defined by a rectangle with 'pro' parameters *)

val draw_texture_n_patch :
  Texture.t ->
  NPatchInfo.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_n_patch texture nPatchInfo dest origin rotation tint] draws a texture (or part of it) that stretches or shrinks nicely *)

(** {3 Color/Pixel related functions} *)

val fade : Color.t -> float -> Color.t
(** Color fade-in or fade-out, alpha goes from 0.0f to 1.0f *)

val color_to_int : Color.t -> int
(** Returns hexadecimal value for a Color *)

val color_normalize : Color.t -> Vector4.t
(** Returns color normalized as float [0..1] *)

val color_from_normalized : Vector4.t -> Color.t
(** Returns color from normalized values [0..1] *)

val color_to_hsv : Color.t -> Vector3.t
(** Returns HSV values for a Color *)

val color_from_hsv : float -> float -> float -> Color.t
(** [color_from_hsv hue saturation value] returns a Color from HSV values *)

val color_alpha : Color.t -> float -> Color.t
(** [color_alpha color alpha] returns color with alpha applied, alpha goes from 0.0f to 1.0f *)

val color_alpha_blend : Color.t -> Color.t -> Color.t -> Color.t
(** [color_alpha_blend dst src tint] returns src alpha-blended into dst color with tint                                                 *)

val get_color : int -> Color.t
(** Returns a Color struct from hexadecimal value *)

val get_pixel_color : unit ptr -> PixelFormat.t -> Color.t
(** Get Color from a source pixel pointer of certain format *)

val set_pixel_color : unit ptr -> Color.t -> PixelFormat.t -> unit
(** Set color formatted into destination pixel pointer *)

val get_pixel_data_size : int -> int -> PixelFormat.t -> int
(** [get_pixel_data_size width height format] gets pixel data size in bytes (image or texture) *)

(** {2 Font Loading and Text Drawing Functions (Module: text)} *)

(** {3 Font loading/unloading functions} *)

val get_font_default : unit -> Font.t
(** Get the default Font *)

val load_font : string -> Font.t
(** Load font from file into GPU memory (VRAM) *)

val load_font_ex : string -> int -> int ptr -> int -> Font.t
(** [load_font_ex fileName fontSize fontChars charsCount] loads font from file with extended parameters *)

val load_font_from_image : Image.t -> Color.t -> int -> Font.t
(** [load_font_from_image image kay firstChar] loads font from Image (XNA style) *)

val load_font_data :
  Unsigned.uchar ptr -> int -> int -> int ptr -> int -> int -> CharInfo.t ptr
(** [load_font_data fileData dataSize fontSize fontChars charsCount type] loads font data for further use *)

val unload_font_data : CharInfo.t ptr -> int -> unit
(** [unload_font_data chars charsCount] Unload font chars info data (RAM) *)

val unload_font : Font.t -> unit
(** Unload Font from GPU memory (VRAM) *)

(** {3 Text drawing functions} *)

val draw_fps : int -> int -> unit
(** [draw_fps posX posY] shows current FPS *)

val draw_text : string -> int -> int -> int -> Color.t -> unit
(** [draw_text text posX posY fontSize color] draws text (using default font) *)

val draw_text_ex :
  Font.t -> string -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_text_ex font text position fontSize spacing tint] draws text using font and additional parameters *)

val draw_text_rec :
  Font.t -> string -> Rectangle.t -> float -> float -> bool -> Color.t -> unit
(** [draw_text_rec font text rec fontSize spacing wordWrap tint] draws text using font inside rectangle limits *)

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
(** [draw_text_rec_ex font text rec fontSize spacing wordWrap tint selectStart selectLength selectTint selectBackTint]
  draws text using font inside rectangle limits with support for text selection *)

val draw_text_codepoint : Font.t -> int -> Vector2.t -> float -> Color.t -> unit
(** [draw_text_codepoint font codepoint position fontSize tint] draws one character (codepoint) *)

(** {3 Text misc. functions} *)

val measure_text : string -> int -> int
(** Measure string width for default font *)

val measure_text_ex : Font.t -> string -> float -> float -> Vector2.t
(** Measure string size for Font *)

val get_glyph_index : Font.t -> int -> int
(** Get index position for a unicode character on font *)

(** {3 Text strings management functions (no utf8 strings, only byte chars)} *)

val text_copy : string -> string -> int
(** Copy one string to another, returns bytes copied *)

val text_is_equal : string -> string -> bool
(** Check if two text string are equal *)

val text_length : string -> int
(** Get text length, checks for '' ending *)

(**  {3 Text formatting with variables (sprintf style)} *)

val text_subtext : string -> int -> int -> string
(** Get a piece of a text string *)

val text_replace : string -> string -> string -> string
(** Replace text string (memory must be freed!) *)

val text_insert : string -> string -> int -> string
(** Insert text in a position (memory must be freed!) *)

val text_append : string -> string -> int ptr -> unit
(** Append text at specific position and move cursor! *)

val text_find_index : string -> string -> int
(** Find first text occurrence within a string *)

val text_to_upper : string -> string
(** Get upper case version of provided string *)

val text_to_lower : string -> string
(** Get lower case version of provided string *)

val text_to_pascal : string -> string
(** Get Pascal case notation version of provided string *)

val text_to_integer : string -> int
(** Get integer value from text (negative values not supported) *)

val text_to_utf8 : int ptr -> int -> string
(** Encode text codepoint into utf8 text (memory must be freed!) *)

(** {3 UTF8 text strings management functions} *)

val get_codepoints : string -> int ptr -> int ptr
(** Get all codepoints in a string, codepoints count returned by parameters *)

val get_codepoints_count : string -> int
(** Get total number of characters (codepoints) in a UTF8 encoded string *)

val get_next_codepoint : string -> int ptr -> int
(** Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure *)

val codepoint_to_utf8 : int -> int ptr -> string
(** Encode codepoint into utf8 text (char array length returned as parameter) *)

(** {2 Basic 3d Shapes Drawing Functions (Module: models)} *)

(** {3 Basic geometric 3D shapes drawing functions} *)

val draw_line_3d : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_line_3d startPos endPos color] draws a line in 3D world space *)

val draw_point_3d : Vector3.t -> Color.t -> unit
(** [draw_point_3d position color] draws a point in 3D space, actually a small line *)

val draw_circle_3d : Vector3.t -> float -> Vector3.t -> float -> Color.t -> unit
(** [draw_circle_3d center radius rotationAxis rotationAngle color] draws a circle in 3D world space *)

val draw_triangle_3d : Vector3.t -> Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_triangle_3d v1 v2 v3 color] draws a triangle strip defined by points *)

val draw_triangle_strip_3d : Vector3.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip_3d points pointsCount color] draws a triangle strip defined by points *)

(* TODO make carray *)

val draw_cube : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube position width height length color] draws cube *)

val draw_cube_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_v position size color] draws cube (Vector version) *)

val draw_cube_wires : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube_wires position width height length color] draws cube wires *)

val draw_cube_wires_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_wires_v position size color] draws cube wires (Vector version) *)

val draw_cube_texture :
  Texture.t -> Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube_texture texture position width height length color] draws cube textured *)

val draw_sphere : Vector3.t -> float -> Color.t -> unit
(** [draw_sphere centerPos radius color] draws sphere *)

val draw_sphere_ex : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_ex centerPos radius rings slices color] draws sphere with extended parameters *)

val draw_sphere_wires : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_wires centerPos radius rings slices color] draws sphere wires *)

val draw_cylinder :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder position radiusTop radiusBottom height slices color] draws a cylinder/cone *)

val draw_cylinder_wires :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_wires position radiusTop radiusBottom height slices color] draws a cylinder/cone wires *)

val draw_plane : Vector3.t -> Vector2.t -> Color.t -> unit
(** [draw_plane centerPos size color] draws a plane XZ *)

val draw_ray : Ray.t -> Color.t -> unit
(** [draw_ray ray color] draws a ray line *)

val draw_grid : int -> float -> unit
(** [draw_grid slices spacing] draws a grid (centered at (0, 0, 0)) *)

val draw_gizmo : Vector3.t -> unit
(** [draw_gizmo position] draws simple gizmo *)

(** {3 Model loading/unloading functions} *)

val load_model : string -> Model.t
(** Load model from files (meshes and materials) *)

val load_model_from_mesh : Mesh.t -> Model.t
(** Load model from generated mesh (default material) *)

val unload_model : Model.t -> unit
(** Unload model (including meshes) from memory (RAM and/or VRAM) *)

val unload_model_keep_meshes : Model.t -> unit
(** Unload model (but not meshes) from memory (RAM and/or VRAM) *)

val load_meshes : string -> int ptr -> Mesh.t ptr option
(** Load meshes from model file *)

val unload_mesh : Mesh.t -> unit
(** Unload mesh from memory (RAM and/or VRAM) *)

val export_mesh : Mesh.t -> string -> unit
(** Export mesh data to file *)

(** {3 Material loading/unloading functions} *)

val load_materials : string -> int ptr -> Material.t ptr
(** Load materials from model file *)

val load_material_default : unit -> Material.t
(** Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) *)

val unload_material : Material.t -> unit
(** Unload material from GPU memory (VRAM) *)

val set_material_texture :
  Material.t ptr -> MaterialMapType.t -> Texture.t -> unit
(** Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...) *)

val set_model_mesh_material : Model.t ptr -> int -> int -> unit
(** Set material for a mesh *)

(** {3 Model animations loading/unloading functions} *)

val load_model_animations : string -> ModelAnimation.t CArray.t
(** Load model animations from file *)

val update_model_animation : Model.t -> ModelAnimation.t -> int -> unit
(** Update model animation pose *)

val unload_model_animation : ModelAnimation.t -> unit
(** Unload animation data *)

val is_model_animation_valid : Model.t -> ModelAnimation.t -> bool
(** Check model animation skeleton match *)

(** {3 Mesh generation functions} *)

val gen_mesh_poly : int -> float -> Mesh.t
(** Generate polygonal mesh *)

val gen_mesh_plane : float -> float -> int -> int -> Mesh.t
(** Generate plane mesh (with subdivisions) *)

val gen_mesh_cube : float -> float -> float -> Mesh.t
(** Generate cuboid mesh *)

val gen_mesh_sphere : float -> int -> int -> Mesh.t
(** Generate sphere mesh (standard sphere) *)

val gen_mesh_hemi_sphere : float -> int -> int -> Mesh.t
(** Generate half-sphere mesh (no bottom cap) *)

val gen_mesh_cylinder : float -> float -> int -> Mesh.t
(** Generate cylinder mesh *)

val gen_mesh_torus : float -> float -> int -> int -> Mesh.t
(** Generate torus mesh *)

val gen_mesh_knot : float -> float -> int -> int -> Mesh.t
(** Generate trefoil knot mesh *)

val gen_mesh_heightmap : Image.t -> Vector3.t -> Mesh.t
(** Generate heightmap mesh from image data *)

val gen_mesh_cubicmap : Image.t -> Vector3.t -> Mesh.t
(** Generate cubes-based map mesh from image data *)

(** {3 Mesh manipulation functions} *)

val mesh_bounding_box : Mesh.t -> BoundingBox.t
(** Compute mesh bounding box limits *)

val mesh_tangents : Mesh.t ptr -> unit
(** Compute mesh tangents *)

val mesh_binormals : Mesh.t ptr -> unit
(** Compute mesh binormals *)

val mesh_normals_smooth : Mesh.t ptr -> unit
(** Smooth (average) vertex normals *)

(** {3 Model drawing functions} *)

val draw_model : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model model position scale tint] draws a model (with texture if set) *)

val draw_model_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_ex model position rotationAxis rotationAngle scale tint] draws a model with extended parameters *)

val draw_model_wires : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model_wires model position scale tint] draws a model wires (with texture if set) *)

val draw_model_wires_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_wires_ex model position rotationAxis rotationAngle scale tint] draws a model wires (with texture if set) with extended parameters *)

val draw_bounding_box : BoundingBox.t -> Color.t -> unit
(** [draw_bounding_box box color] draws bounding box (wires) *)

val draw_billboard :
  Camera3D.t -> Texture.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_billboard camera texture center size tint] draws a billboard texture *)

val draw_billboard_rec :
  Camera3D.t ->
  Texture.t ->
  Rectangle.t ->
  Vector3.t ->
  float ->
  Color.t ->
  unit
(** [draw_billboard_rec camera texture source center size tint] draws a billboard texture defined by sourceRec *)

(** {3 Collision detection functions} *)

val check_collision_spheres : Vector3.t -> float -> Vector3.t -> float -> bool
(** Detect collision between two spheres *)

val check_collision_boxes : BoundingBox.t -> BoundingBox.t -> bool
(** Detect collision between two bounding boxes *)

val check_collision_box_sphere : BoundingBox.t -> Vector3.t -> float -> bool
(** Detect collision between box and sphere *)

val check_collision_ray_sphere : Ray.t -> Vector3.t -> float -> bool
(** Detect collision between ray and sphere *)

val check_collision_ray_sphere_ex :
  Ray.t -> Vector3.t -> float -> Vector3.t ptr -> bool
(** Detect collision between ray and sphere, returns collision point *)

val check_collision_ray_box : Ray.t -> BoundingBox.t -> bool
(** Detect collision between ray and box *)

val get_collision_ray_mesh : Ray.t -> Mesh.t -> Matrix.t -> RayHitInfo.t
(** [get_collision_ray_mesh ray mesh transform] gets collision info between ray and mesh *)

val get_collision_ray_model : Ray.t -> Model.t -> RayHitInfo.t
(** Get collision info between ray and model *)

val get_collision_ray_triangle :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayHitInfo.t
(** Get collision info between ray and triangle *)

val get_collision_ray_ground : Ray.t -> float -> RayHitInfo.t
(** Get collision info between ray and ground plane (Y-normal plane) *)

(** {2 Shaders System Functions (Module: rlgl)} *)

(** {3 Shader loading/unloading functions} *)

val load_shader : string -> string -> Shader.t
(** Load shader from files and bind default locations *)

val load_shader_code : string -> string -> Shader.t
(** Load shader from code strings and bind default locations *)

val unload_shader : Shader.t -> unit
(** Unload shader from GPU memory (VRAM) *)

val get_shader_default : unit -> Shader.t
(** Get default shader *)

val get_texture_default : unit -> Texture.t
(** Get default texture *)

val get_shapes_texture : unit -> Texture.t
(** Get texture to draw shapes *)

val get_shapes_texture_rec : unit -> Rectangle.t
(** Get texture rectangle to draw shapes *)

val set_shapes_texture : Texture.t -> Rectangle.t -> unit
(** Define default texture used to draw shapes *)

(** {3 Shader configuration functions} *)

val get_shader_location : Shader.t -> string -> ShaderLocationIndex.t
(** Get shader uniform location *)

val get_shader_location_attrib : Shader.t -> string -> ShaderLocationIndex.t
(** Get shader attribute location *)

val set_shader_value :
  Shader.t ->
  ShaderLocationIndex.t ->
  unit ptr ->
  ShaderUniformDataType.t ->
  unit
(** Set shader uniform value *)

val set_shader_value_v :
  Shader.t ->
  ShaderLocationIndex.t ->
  unit ptr ->
  ShaderUniformDataType.t ->
  int ->
  unit
(** Set shader uniform value vector *)

val set_shader_value_matrix :
  Shader.t -> ShaderLocationIndex.t -> Matrix.t -> unit
(** Set shader uniform value (matrix 4x4) *)

val set_shader_value_texture :
  Shader.t -> ShaderLocationIndex.t -> Texture.t -> unit
(** Set shader uniform value for texture *)

val set_matrix_projection : Matrix.t -> unit
(** Set a custom projection matrix (replaces internal projection matrix) *)

val set_matrix_modelview : Matrix.t -> unit
(** Set a custom modelview matrix (replaces internal modelview matrix) *)

val get_matrix_modelview : unit -> Matrix.t
(** Get internal modelview matrix *)

val get_matrix_projection : unit -> Matrix.t
(** Get internal projection matrix *)

(** {3 Texture maps generation (PBR)} *)

val gen_texture_cubemap :
  Shader.t -> Texture.t -> int -> PixelFormat.t -> Texture.t
(** Generate cubemap texture from 2D texture *)

val gen_texture_irradiance : Shader.t -> Texture.t -> int -> Texture.t
(** Generate irradiance texture using cubemap data *)

val gen_texture_prefilter : Shader.t -> Texture.t -> int -> Texture.t
(** Generate prefilter texture using cubemap data *)

val gen_texture_b_r_d_f : Shader.t -> int -> Texture.t
(** Generate BRDF texture *)

(** {3 Shading begin/end functions} *)

val begin_shader_mode : Shader.t -> unit
(** Begin custom shader drawing *)

val end_shader_mode : unit -> unit
(** End custom shader drawing (use default shader) *)

val begin_blend_mode : BlendMode.t -> unit
(** Begin blending mode (alpha, additive, multiplied) *)

val end_blend_mode : unit -> unit
(** End blending mode (reset to default: alpha blending) *)

(** {3 VR control functions} *)

val init_vr_simulator : unit -> unit
(** Init VR simulator for selected device parameters *)

val close_vr_simulator : unit -> unit
(** Close VR simulator for current device *)

val update_vr_tracking : Camera3D.t ptr -> unit
(** Update VR tracking (position and orientation) and camera *)

val set_vr_configuration : VrDeviceInfo.t -> Shader.t -> unit
(** Set stereo rendering configuration parameters *)

val is_vr_simulator_ready : unit -> bool
(** Detect if VR simulator is ready *)

val toggle_vr_mode : unit -> unit
(** Enable/Disable VR experience *)

val begin_vr_drawing : unit -> unit
(** Begin VR simulator stereo rendering *)

val end_vr_drawing : unit -> unit
(** End VR simulator stereo rendering *)

(** {2 Audio Loading and Playing Functions (Module: audio)} *)

(** {3 Audio device management functions} *)

val init_audio_device : unit -> unit
(** Initialize audio device and context *)

val close_audio_device : unit -> unit
(** Close the audio device and context *)

val is_audio_device_ready : unit -> bool
(** Check if audio device has been initialized successfully *)

val set_master_volume : float -> unit
(** Set master volume (listener) *)

(** {3 Wave/Sound loading/unloading functions} *)

val load_wave : string -> Wave.t
(** Load wave data from file *)

val load_wave_from_memory : string -> Unsigned.uchar ptr -> int -> Wave.t
(** Load wave from memory buffer, fileType refers to extension: i.e. "wav" *)

(* TODO carray *)

val load_sound : string -> Sound.t
(** Load sound from file *)

val load_sound_from_wave : Wave.t -> Sound.t
(** Load sound from wave data *)

val update_sound : Sound.t -> unit ptr -> int -> unit
(** Update sound buffer with new data *)

val unload_wave : Wave.t -> unit
(** Unload wave data *)

val unload_sound : Sound.t -> unit
(** Unload sound *)

val export_wave : Wave.t -> string -> bool
(** Export wave data to file, returns true on success *)

val export_wave_as_code : Wave.t -> string -> bool
(** Export wave sample data to code (.h), returns true on success *)

(** {3 Wave/Sound management functions} *)

val play_sound : Sound.t -> unit
(** Play a sound *)

val stop_sound : Sound.t -> unit
(** Stop playing a sound *)

val pause_sound : Sound.t -> unit
(** Pause a sound *)

val resume_sound : Sound.t -> unit
(** Resume a paused sound *)

val play_sound_multi : Sound.t -> unit
(** Play a sound (using multichannel buffer pool) *)

val stop_sound_multi : unit -> unit
(** Stop any sound playing (using multichannel buffer pool) *)

val get_sounds_playing : unit -> int
(** Get number of sounds playing in the multichannel *)

val is_sound_playing : Sound.t -> bool
(** Check if a sound is currently playing *)

val set_sound_volume : Sound.t -> float -> unit
(** Set volume for a sound (1.0 is max level) *)

val set_sound_pitch : Sound.t -> float -> unit
(** Set pitch for a sound (1.0 is base level) *)

val wave_format : Wave.t ptr -> int -> int -> int -> unit
(** Convert wave data to desired format *)

val wave_copy : Wave.t -> Wave.t
(** Copy a wave to a new wave *)

val wave_crop : Wave.t ptr -> int -> int -> unit
(** Crop a wave to defined samples range *)

val load_wave_samples : Wave.t -> float ptr
(** Load samples data from wave as a floats array *)

val unload_wave_samples : float ptr -> unit
(** Unload samples data loaded with load_wave_data *)

(** {3 Music management functions} *)

val load_music_stream : string -> Music.t
(** Load music stream from file *)

val unload_music_stream : Music.t -> unit
(** Unload music stream *)

val play_music_stream : Music.t -> unit
(** Start music playing *)

val update_music_stream : Music.t -> unit
(** Updates buffers for music streaming *)

val stop_music_stream : Music.t -> unit
(** Stop music playing *)

val pause_music_stream : Music.t -> unit
(** Pause music playing *)

val resume_music_stream : Music.t -> unit
(** Resume playing paused music *)

val is_music_playing : Music.t -> bool
(** Check if music is playing *)

val set_music_volume : Music.t -> float -> unit
(** Set volume for music (1.0 is max level) *)

val set_music_pitch : Music.t -> float -> unit
(** Set pitch for a music (1.0 is base level) *)

val get_music_time_length : Music.t -> float
(** Get music time length (in seconds) *)

val get_music_time_played : Music.t -> float
(** Get current music time played (in seconds) *)

(** {3 AudioStream management functions} *)

val init_audio_stream : int -> int -> int -> AudioStream.t
(** Init audio stream (to stream raw audio pcm data) *)

val update_audio_stream : AudioStream.t -> unit ptr -> int -> unit
(** Update audio stream buffers with data *)

val close_audio_stream : AudioStream.t -> unit
(** Close audio stream and free memory *)

val is_audio_stream_processed : AudioStream.t -> bool
(** Check if any audio stream buffers requires refill *)

val play_audio_stream : AudioStream.t -> unit
(** Play audio stream *)

val pause_audio_stream : AudioStream.t -> unit
(** Pause audio stream *)

val resume_audio_stream : AudioStream.t -> unit
(** Resume audio stream *)

val is_audio_stream_playing : AudioStream.t -> bool
(** Check if audio stream is playing *)

val stop_audio_stream : AudioStream.t -> unit
(** Stop audio stream *)

val set_audio_stream_volume : AudioStream.t -> float -> unit
(** Set volume for audio stream (1.0 is max level) *)

val set_audio_stream_pitch : AudioStream.t -> float -> unit
(** Set pitch for audio stream (1.0 is base level) *)

val set_audio_stream_buffer_size_default : int -> unit
(** Default size for new audio streams *)
