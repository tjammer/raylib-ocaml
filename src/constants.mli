module ConfigFlag : sig
  type t =
    | Reserved
    | Fullscreen_mode
    | Window_resizable
    | Window_undecorated
    | Window_transparent
    | Window_hidden
    | Window_always_run
    | MSAA_4X_hint
    | VSync_hint

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
  type t =
    | Unknown
    | Left_x
    | Left_y
    | Right_x
    | Right_y
    | Left_trigger
    | Right_trigger

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
  type t = Alpha | Additive | Multiplied

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
