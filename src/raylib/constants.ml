module Constants = Raylib_generated_constants

module ConfigFlag = struct
  type t = Constants.ConfigFlag.t =
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

  let t = Constants.ConfigFlag.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TraceLogType = struct
  type t = Constants.TraceLogType.t =
    | All
    | Trace
    | Debug
    | Info
    | Warning
    | Error
    | Fatal
    | None

  let t = Constants.TraceLogType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Key = struct
  type t = Constants.Key.t =
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
    (* Function keys *)
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
    (* Keypad keys *)
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

  let t = Constants.Key.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module AndroidButton = struct
  type t = Constants.AndroidButton.t = Back | Menu | Volume_up | Volume_down

  let t = Constants.AndroidButton.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseButton = struct
  type t = Constants.MouseButton.t = Left | Right | Middle

  let t = Constants.MouseButton.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseCursor = struct
  type t = Constants.MouseCursor.t =
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

  let t = Constants.MouseCursor.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadNumber = struct
  type t = Constants.GamepadNumber.t = Player1 | Player2 | Player3 | Player4

  let t = Constants.GamepadNumber.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadButton = struct
  type t = Constants.GamepadButton.t =
    (* This is here just for error checking *)
    | Unknown
    (* This is normally a DPAD *)
    | Left_face_up
    | Left_face_right
    | Left_face_down
    | Left_face_left
    (* This normally corresponds with PlayStation and Xbox controllers *)
    (* XBOX: [Y,X,A,B]
     * PS3: [Triangle,Square,Cross,Circle] *)
    (* No support for 6 button controllers though.. *)
    | Right_face_up
    | Right_face_right
    | Right_face_down
    | Right_face_left
    (* Triggers *)
    | Left_trigger_1
    | Left_trigger_2
    | Right_trigger_1
    | Right_trigger_2
    (* These are buttons in the center of the gamepad *)
    | Middle_left
    | Middle
    | Middle_right
    (* These are the joystick press in buttons *)
    | Left_thumb
    | Right_thumb

  let t = Constants.GamepadButton.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadAxis = struct
  type t = Constants.GamepadAxis.t =
    (* Left stick *)
    | Left_x
    | Left_y
    (* Right stick *)
    | Right_x
    | Right_y
    (* Pressure levels for the back triggers *)
    | Left_trigger
    | Right_trigger

  let t = Constants.GamepadAxis.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderLocationIndex = struct
  type t = Constants.ShaderLocationIndex.t =
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

  let t = Constants.ShaderLocationIndex.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderUniformDataType = struct
  type t = Constants.ShaderUniformDataType.t =
    | Float
    | Vec2
    | Vec3
    | Vec4
    | Int
    | IVec2
    | IVec3
    | IVec4
    | Sampler2D

  let t = Constants.ShaderUniformDataType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MaterialMapType = struct
  type t = Constants.MaterialMapType.t =
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

  let t = Constants.MaterialMapType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module PixelFormat = struct
  type t = Constants.PixelFormat.t =
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

  let t = Constants.PixelFormat.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureFilterMode = struct
  type t = Constants.TextureFilterMode.t =
    | Point
    | Bilinear
    | Trilinear
    | Anisotropic_4X
    | Anisotropic_8X
    | Anisotropic_16X

  let t = Constants.TextureFilterMode.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CubemapLayoutType = struct
  type t = Constants.CubemapLayoutType.t =
    | Auto_detect
    | Line_vertical
    | Line_horizontal
    | Cross_three_by_four
    | Cross_four_by_three
    | Panorama

  let t = Constants.CubemapLayoutType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureWrapMode = struct
  type t = Constants.TextureWrapMode.t =
    | Repeat
    | Clamp
    | Mirror_repeat
    | Mirror_clamp

  let t = Constants.TextureWrapMode.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module FontType = struct
  type t = Constants.FontType.t = Default | Bitmap | SDF

  let t = Constants.FontType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module BlendMode = struct
  type t = Constants.BlendMode.t =
    | Alpha
    | Additive
    | Multiplied
    | Add_colors
    | Subtract_colors
    | Custom

  let t = Constants.BlendMode.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GestureType = struct
  type t = Constants.GestureType.t =
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

  let t = Constants.GestureType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraMode = struct
  type t = Constants.CameraMode.t =
    | Custom
    | Free
    | Orbital
    | First_person
    | Third_person

  let t = Constants.CameraMode.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraType = struct
  type t = Constants.CameraType.t = Perspective | Orthographic

  let t = Constants.CameraType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module NPatchType = struct
  type t = Constants.NPatchType.t =
    | Nine_patch
    | Three_patch_vertical
    | Three_patch_horizontal

  let t = Constants.NPatchType.t

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

let max_material_maps = Constants.max_material_maps

let max_shader_locations = Constants.max_shader_locations
