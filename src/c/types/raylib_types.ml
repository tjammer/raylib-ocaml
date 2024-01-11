module Types (F : Ctypes.TYPE) = struct
  open F

  module ConfigFlags = struct
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

    let vals =
      [
        (Vsync_hint, constant "FLAG_VSYNC_HINT" int64_t);
        (Fullscreen_mode, constant "FLAG_FULLSCREEN_MODE" int64_t);
        (Window_resizable, constant "FLAG_WINDOW_RESIZABLE" int64_t);
        (Window_undecorated, constant "FLAG_WINDOW_UNDECORATED" int64_t);
        (Window_hidden, constant "FLAG_WINDOW_HIDDEN" int64_t);
        (Window_minimized, constant "FLAG_WINDOW_MINIMIZED" int64_t);
        (Window_maximized, constant "FLAG_WINDOW_MAXIMIZED" int64_t);
        (Window_unfocused, constant "FLAG_WINDOW_UNFOCUSED" int64_t);
        (Window_topmost, constant "FLAG_WINDOW_TOPMOST" int64_t);
        (Window_always_run, constant "FLAG_WINDOW_ALWAYS_RUN" int64_t);
        (Window_transparent, constant "FLAG_WINDOW_TRANSPARENT" int64_t);
        (Window_highdpi, constant "FLAG_WINDOW_HIGHDPI" int64_t);
        ( Window_mouse_passthrough,
          constant "FLAG_WINDOW_MOUSE_PASSTHROUGH" int64_t );
        ( Borderless_windowed_mode,
          constant "FLAG_BORDERLESS_WINDOWED_MODE" int64_t );
        (Msaa_4x_hint, constant "FLAG_MSAA_4X_HINT" int64_t);
        (Interlaced_hint, constant "FLAG_INTERLACED_HINT" int64_t);
      ]

    let t = enum "ConfigFlags" ~typedef:true vals
  end

  module TraceLogLevel = struct
    type t = All | Trace | Debug | Info | Warning | Error | Fatal | None

    let vals =
      [
        (All, constant "LOG_ALL" int64_t);
        (Trace, constant "LOG_TRACE" int64_t);
        (Debug, constant "LOG_DEBUG" int64_t);
        (Info, constant "LOG_INFO" int64_t);
        (Warning, constant "LOG_WARNING" int64_t);
        (Error, constant "LOG_ERROR" int64_t);
        (Fatal, constant "LOG_FATAL" int64_t);
        (None, constant "LOG_NONE" int64_t);
      ]

    let t = enum "TraceLogLevel" ~typedef:true vals
  end

  module Key = struct
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

    let vals =
      [
        (Null, constant "KEY_NULL" int64_t);
        (Apostrophe, constant "KEY_APOSTROPHE" int64_t);
        (Comma, constant "KEY_COMMA" int64_t);
        (Minus, constant "KEY_MINUS" int64_t);
        (Period, constant "KEY_PERIOD" int64_t);
        (Slash, constant "KEY_SLASH" int64_t);
        (Zero, constant "KEY_ZERO" int64_t);
        (One, constant "KEY_ONE" int64_t);
        (Two, constant "KEY_TWO" int64_t);
        (Three, constant "KEY_THREE" int64_t);
        (Four, constant "KEY_FOUR" int64_t);
        (Five, constant "KEY_FIVE" int64_t);
        (Six, constant "KEY_SIX" int64_t);
        (Seven, constant "KEY_SEVEN" int64_t);
        (Eight, constant "KEY_EIGHT" int64_t);
        (Nine, constant "KEY_NINE" int64_t);
        (Semicolon, constant "KEY_SEMICOLON" int64_t);
        (Equal, constant "KEY_EQUAL" int64_t);
        (A, constant "KEY_A" int64_t);
        (B, constant "KEY_B" int64_t);
        (C, constant "KEY_C" int64_t);
        (D, constant "KEY_D" int64_t);
        (E, constant "KEY_E" int64_t);
        (F, constant "KEY_F" int64_t);
        (G, constant "KEY_G" int64_t);
        (H, constant "KEY_H" int64_t);
        (I, constant "KEY_I" int64_t);
        (J, constant "KEY_J" int64_t);
        (K, constant "KEY_K" int64_t);
        (L, constant "KEY_L" int64_t);
        (M, constant "KEY_M" int64_t);
        (N, constant "KEY_N" int64_t);
        (O, constant "KEY_O" int64_t);
        (P, constant "KEY_P" int64_t);
        (Q, constant "KEY_Q" int64_t);
        (R, constant "KEY_R" int64_t);
        (S, constant "KEY_S" int64_t);
        (T, constant "KEY_T" int64_t);
        (U, constant "KEY_U" int64_t);
        (V, constant "KEY_V" int64_t);
        (W, constant "KEY_W" int64_t);
        (X, constant "KEY_X" int64_t);
        (Y, constant "KEY_Y" int64_t);
        (Z, constant "KEY_Z" int64_t);
        (Left_bracket, constant "KEY_LEFT_BRACKET" int64_t);
        (Backslash, constant "KEY_BACKSLASH" int64_t);
        (Right_bracket, constant "KEY_RIGHT_BRACKET" int64_t);
        (Grave, constant "KEY_GRAVE" int64_t);
        (Space, constant "KEY_SPACE" int64_t);
        (Escape, constant "KEY_ESCAPE" int64_t);
        (Enter, constant "KEY_ENTER" int64_t);
        (Tab, constant "KEY_TAB" int64_t);
        (Backspace, constant "KEY_BACKSPACE" int64_t);
        (Insert, constant "KEY_INSERT" int64_t);
        (Delete, constant "KEY_DELETE" int64_t);
        (Right, constant "KEY_RIGHT" int64_t);
        (Left, constant "KEY_LEFT" int64_t);
        (Down, constant "KEY_DOWN" int64_t);
        (Up, constant "KEY_UP" int64_t);
        (Page_up, constant "KEY_PAGE_UP" int64_t);
        (Page_down, constant "KEY_PAGE_DOWN" int64_t);
        (Home, constant "KEY_HOME" int64_t);
        (End, constant "KEY_END" int64_t);
        (Caps_lock, constant "KEY_CAPS_LOCK" int64_t);
        (Scroll_lock, constant "KEY_SCROLL_LOCK" int64_t);
        (Num_lock, constant "KEY_NUM_LOCK" int64_t);
        (Print_screen, constant "KEY_PRINT_SCREEN" int64_t);
        (Pause, constant "KEY_PAUSE" int64_t);
        (F1, constant "KEY_F1" int64_t);
        (F2, constant "KEY_F2" int64_t);
        (F3, constant "KEY_F3" int64_t);
        (F4, constant "KEY_F4" int64_t);
        (F5, constant "KEY_F5" int64_t);
        (F6, constant "KEY_F6" int64_t);
        (F7, constant "KEY_F7" int64_t);
        (F8, constant "KEY_F8" int64_t);
        (F9, constant "KEY_F9" int64_t);
        (F10, constant "KEY_F10" int64_t);
        (F11, constant "KEY_F11" int64_t);
        (F12, constant "KEY_F12" int64_t);
        (Left_shift, constant "KEY_LEFT_SHIFT" int64_t);
        (Left_control, constant "KEY_LEFT_CONTROL" int64_t);
        (Left_alt, constant "KEY_LEFT_ALT" int64_t);
        (Left_super, constant "KEY_LEFT_SUPER" int64_t);
        (Right_shift, constant "KEY_RIGHT_SHIFT" int64_t);
        (Right_control, constant "KEY_RIGHT_CONTROL" int64_t);
        (Right_alt, constant "KEY_RIGHT_ALT" int64_t);
        (Right_super, constant "KEY_RIGHT_SUPER" int64_t);
        (Kb_menu, constant "KEY_KB_MENU" int64_t);
        (Kp_0, constant "KEY_KP_0" int64_t);
        (Kp_1, constant "KEY_KP_1" int64_t);
        (Kp_2, constant "KEY_KP_2" int64_t);
        (Kp_3, constant "KEY_KP_3" int64_t);
        (Kp_4, constant "KEY_KP_4" int64_t);
        (Kp_5, constant "KEY_KP_5" int64_t);
        (Kp_6, constant "KEY_KP_6" int64_t);
        (Kp_7, constant "KEY_KP_7" int64_t);
        (Kp_8, constant "KEY_KP_8" int64_t);
        (Kp_9, constant "KEY_KP_9" int64_t);
        (Kp_decimal, constant "KEY_KP_DECIMAL" int64_t);
        (Kp_divide, constant "KEY_KP_DIVIDE" int64_t);
        (Kp_multiply, constant "KEY_KP_MULTIPLY" int64_t);
        (Kp_subtract, constant "KEY_KP_SUBTRACT" int64_t);
        (Kp_add, constant "KEY_KP_ADD" int64_t);
        (Kp_enter, constant "KEY_KP_ENTER" int64_t);
        (Kp_equal, constant "KEY_KP_EQUAL" int64_t);
        (Back, constant "KEY_BACK" int64_t);
        (Menu, constant "KEY_MENU" int64_t);
        (Volume_up, constant "KEY_VOLUME_UP" int64_t);
        (Volume_down, constant "KEY_VOLUME_DOWN" int64_t);
      ]

    let t = enum "KeyboardKey" ~typedef:true vals
  end

  module MouseButton = struct
    type t = Left | Right | Middle | Side | Extra | Forward | Back

    let vals =
      [
        (Left, constant "MOUSE_BUTTON_LEFT" int64_t);
        (Right, constant "MOUSE_BUTTON_RIGHT" int64_t);
        (Middle, constant "MOUSE_BUTTON_MIDDLE" int64_t);
        (Side, constant "MOUSE_BUTTON_SIDE" int64_t);
        (Extra, constant "MOUSE_BUTTON_EXTRA" int64_t);
        (Forward, constant "MOUSE_BUTTON_FORWARD" int64_t);
        (Back, constant "MOUSE_BUTTON_BACK" int64_t);
      ]

    let t = enum "MouseButton" ~typedef:true vals
  end

  module MouseCursor = struct
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

    let vals =
      [
        (Default, constant "MOUSE_CURSOR_DEFAULT" int64_t);
        (Arrow, constant "MOUSE_CURSOR_ARROW" int64_t);
        (Ibeam, constant "MOUSE_CURSOR_IBEAM" int64_t);
        (Crosshair, constant "MOUSE_CURSOR_CROSSHAIR" int64_t);
        (Pointing_hand, constant "MOUSE_CURSOR_POINTING_HAND" int64_t);
        (Resize_ew, constant "MOUSE_CURSOR_RESIZE_EW" int64_t);
        (Resize_ns, constant "MOUSE_CURSOR_RESIZE_NS" int64_t);
        (Resize_nwse, constant "MOUSE_CURSOR_RESIZE_NWSE" int64_t);
        (Resize_nesw, constant "MOUSE_CURSOR_RESIZE_NESW" int64_t);
        (Resize_all, constant "MOUSE_CURSOR_RESIZE_ALL" int64_t);
        (Not_allowed, constant "MOUSE_CURSOR_NOT_ALLOWED" int64_t);
      ]

    let t = enum "MouseCursor" ~typedef:true vals
  end

  module GamepadButton = struct
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

    let vals =
      [
        (Unknown, constant "GAMEPAD_BUTTON_UNKNOWN" int64_t);
        (Left_face_up, constant "GAMEPAD_BUTTON_LEFT_FACE_UP" int64_t);
        (Left_face_right, constant "GAMEPAD_BUTTON_LEFT_FACE_RIGHT" int64_t);
        (Left_face_down, constant "GAMEPAD_BUTTON_LEFT_FACE_DOWN" int64_t);
        (Left_face_left, constant "GAMEPAD_BUTTON_LEFT_FACE_LEFT" int64_t);
        (Right_face_up, constant "GAMEPAD_BUTTON_RIGHT_FACE_UP" int64_t);
        (Right_face_right, constant "GAMEPAD_BUTTON_RIGHT_FACE_RIGHT" int64_t);
        (Right_face_down, constant "GAMEPAD_BUTTON_RIGHT_FACE_DOWN" int64_t);
        (Right_face_left, constant "GAMEPAD_BUTTON_RIGHT_FACE_LEFT" int64_t);
        (Left_trigger_1, constant "GAMEPAD_BUTTON_LEFT_TRIGGER_1" int64_t);
        (Left_trigger_2, constant "GAMEPAD_BUTTON_LEFT_TRIGGER_2" int64_t);
        (Right_trigger_1, constant "GAMEPAD_BUTTON_RIGHT_TRIGGER_1" int64_t);
        (Right_trigger_2, constant "GAMEPAD_BUTTON_RIGHT_TRIGGER_2" int64_t);
        (Middle_left, constant "GAMEPAD_BUTTON_MIDDLE_LEFT" int64_t);
        (Middle, constant "GAMEPAD_BUTTON_MIDDLE" int64_t);
        (Middle_right, constant "GAMEPAD_BUTTON_MIDDLE_RIGHT" int64_t);
        (Left_thumb, constant "GAMEPAD_BUTTON_LEFT_THUMB" int64_t);
        (Right_thumb, constant "GAMEPAD_BUTTON_RIGHT_THUMB" int64_t);
      ]

    let t = enum "GamepadButton" ~typedef:true vals
  end

  module GamepadAxis = struct
    type t =
      | Left_x
      | Left_y
      | Right_x
      | Right_y
      | Left_trigger
      | Right_trigger

    let vals =
      [
        (Left_x, constant "GAMEPAD_AXIS_LEFT_X" int64_t);
        (Left_y, constant "GAMEPAD_AXIS_LEFT_Y" int64_t);
        (Right_x, constant "GAMEPAD_AXIS_RIGHT_X" int64_t);
        (Right_y, constant "GAMEPAD_AXIS_RIGHT_Y" int64_t);
        (Left_trigger, constant "GAMEPAD_AXIS_LEFT_TRIGGER" int64_t);
        (Right_trigger, constant "GAMEPAD_AXIS_RIGHT_TRIGGER" int64_t);
      ]

    let t = enum "GamepadAxis" ~typedef:true vals
  end

  module MaterialMapIndex = struct
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

    let vals =
      [
        (Albedo, constant "MATERIAL_MAP_ALBEDO" int64_t);
        (Metalness, constant "MATERIAL_MAP_METALNESS" int64_t);
        (Normal, constant "MATERIAL_MAP_NORMAL" int64_t);
        (Roughness, constant "MATERIAL_MAP_ROUGHNESS" int64_t);
        (Occlusion, constant "MATERIAL_MAP_OCCLUSION" int64_t);
        (Emission, constant "MATERIAL_MAP_EMISSION" int64_t);
        (Height, constant "MATERIAL_MAP_HEIGHT" int64_t);
        (Cubemap, constant "MATERIAL_MAP_CUBEMAP" int64_t);
        (Irradiance, constant "MATERIAL_MAP_IRRADIANCE" int64_t);
        (Prefilter, constant "MATERIAL_MAP_PREFILTER" int64_t);
        (Brdf, constant "MATERIAL_MAP_BRDF" int64_t);
      ]

    let t = enum "MaterialMapIndex" ~typedef:true vals
  end

  module ShaderLocationIndex = struct
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

    let vals =
      [
        (Vertex_position, constant "SHADER_LOC_VERTEX_POSITION" int64_t);
        (Vertex_texcoord01, constant "SHADER_LOC_VERTEX_TEXCOORD01" int64_t);
        (Vertex_texcoord02, constant "SHADER_LOC_VERTEX_TEXCOORD02" int64_t);
        (Vertex_normal, constant "SHADER_LOC_VERTEX_NORMAL" int64_t);
        (Vertex_tangent, constant "SHADER_LOC_VERTEX_TANGENT" int64_t);
        (Vertex_color, constant "SHADER_LOC_VERTEX_COLOR" int64_t);
        (Matrix_mvp, constant "SHADER_LOC_MATRIX_MVP" int64_t);
        (Matrix_view, constant "SHADER_LOC_MATRIX_VIEW" int64_t);
        (Matrix_projection, constant "SHADER_LOC_MATRIX_PROJECTION" int64_t);
        (Matrix_model, constant "SHADER_LOC_MATRIX_MODEL" int64_t);
        (Matrix_normal, constant "SHADER_LOC_MATRIX_NORMAL" int64_t);
        (Vector_view, constant "SHADER_LOC_VECTOR_VIEW" int64_t);
        (Color_diffuse, constant "SHADER_LOC_COLOR_DIFFUSE" int64_t);
        (Color_specular, constant "SHADER_LOC_COLOR_SPECULAR" int64_t);
        (Color_ambient, constant "SHADER_LOC_COLOR_AMBIENT" int64_t);
        (Map_albedo, constant "SHADER_LOC_MAP_ALBEDO" int64_t);
        (Map_metalness, constant "SHADER_LOC_MAP_METALNESS" int64_t);
        (Map_normal, constant "SHADER_LOC_MAP_NORMAL" int64_t);
        (Map_roughness, constant "SHADER_LOC_MAP_ROUGHNESS" int64_t);
        (Map_occlusion, constant "SHADER_LOC_MAP_OCCLUSION" int64_t);
        (Map_emission, constant "SHADER_LOC_MAP_EMISSION" int64_t);
        (Map_height, constant "SHADER_LOC_MAP_HEIGHT" int64_t);
        (Map_cubemap, constant "SHADER_LOC_MAP_CUBEMAP" int64_t);
        (Map_irradiance, constant "SHADER_LOC_MAP_IRRADIANCE" int64_t);
        (Map_prefilter, constant "SHADER_LOC_MAP_PREFILTER" int64_t);
        (Map_brdf, constant "SHADER_LOC_MAP_BRDF" int64_t);
      ]

    let t = enum "ShaderLocationIndex" ~typedef:true vals
  end

  module ShaderUniformDataType = struct
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

    let vals =
      [
        (Float, constant "SHADER_UNIFORM_FLOAT" int64_t);
        (Vec2, constant "SHADER_UNIFORM_VEC2" int64_t);
        (Vec3, constant "SHADER_UNIFORM_VEC3" int64_t);
        (Vec4, constant "SHADER_UNIFORM_VEC4" int64_t);
        (Int, constant "SHADER_UNIFORM_INT" int64_t);
        (Ivec2, constant "SHADER_UNIFORM_IVEC2" int64_t);
        (Ivec3, constant "SHADER_UNIFORM_IVEC3" int64_t);
        (Ivec4, constant "SHADER_UNIFORM_IVEC4" int64_t);
        (Sampler2d, constant "SHADER_UNIFORM_SAMPLER2D" int64_t);
      ]

    let t = enum "ShaderUniformDataType" ~typedef:true vals
  end

  module ShaderAttributeDataType = struct
    type t = Float | Vec2 | Vec3 | Vec4

    let vals =
      [
        (Float, constant "SHADER_ATTRIB_FLOAT" int64_t);
        (Vec2, constant "SHADER_ATTRIB_VEC2" int64_t);
        (Vec3, constant "SHADER_ATTRIB_VEC3" int64_t);
        (Vec4, constant "SHADER_ATTRIB_VEC4" int64_t);
      ]

    let t = enum "ShaderAttributeDataType" ~typedef:true vals
  end

  module PixelFormat = struct
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

    let vals =
      [
        ( Uncompressed_grayscale,
          constant "PIXELFORMAT_UNCOMPRESSED_GRAYSCALE" int64_t );
        ( Uncompressed_gray_alpha,
          constant "PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA" int64_t );
        (Uncompressed_r5g6b5, constant "PIXELFORMAT_UNCOMPRESSED_R5G6B5" int64_t);
        (Uncompressed_r8g8b8, constant "PIXELFORMAT_UNCOMPRESSED_R8G8B8" int64_t);
        ( Uncompressed_r5g5b5a1,
          constant "PIXELFORMAT_UNCOMPRESSED_R5G5B5A1" int64_t );
        ( Uncompressed_r4g4b4a4,
          constant "PIXELFORMAT_UNCOMPRESSED_R4G4B4A4" int64_t );
        ( Uncompressed_r8g8b8a8,
          constant "PIXELFORMAT_UNCOMPRESSED_R8G8B8A8" int64_t );
        (Uncompressed_r32, constant "PIXELFORMAT_UNCOMPRESSED_R32" int64_t);
        ( Uncompressed_r32g32b32,
          constant "PIXELFORMAT_UNCOMPRESSED_R32G32B32" int64_t );
        ( Uncompressed_r32g32b32a32,
          constant "PIXELFORMAT_UNCOMPRESSED_R32G32B32A32" int64_t );
        (Uncompressed_r16, constant "PIXELFORMAT_UNCOMPRESSED_R16" int64_t);
        ( Uncompressed_r16g16b16,
          constant "PIXELFORMAT_UNCOMPRESSED_R16G16B16" int64_t );
        ( Uncompressed_r16g16b16a16,
          constant "PIXELFORMAT_UNCOMPRESSED_R16G16B16A16" int64_t );
        (Compressed_dxt1_rgb, constant "PIXELFORMAT_COMPRESSED_DXT1_RGB" int64_t);
        ( Compressed_dxt1_rgba,
          constant "PIXELFORMAT_COMPRESSED_DXT1_RGBA" int64_t );
        ( Compressed_dxt3_rgba,
          constant "PIXELFORMAT_COMPRESSED_DXT3_RGBA" int64_t );
        ( Compressed_dxt5_rgba,
          constant "PIXELFORMAT_COMPRESSED_DXT5_RGBA" int64_t );
        (Compressed_etc1_rgb, constant "PIXELFORMAT_COMPRESSED_ETC1_RGB" int64_t);
        (Compressed_etc2_rgb, constant "PIXELFORMAT_COMPRESSED_ETC2_RGB" int64_t);
        ( Compressed_etc2_eac_rgba,
          constant "PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA" int64_t );
        (Compressed_pvrt_rgb, constant "PIXELFORMAT_COMPRESSED_PVRT_RGB" int64_t);
        ( Compressed_pvrt_rgba,
          constant "PIXELFORMAT_COMPRESSED_PVRT_RGBA" int64_t );
        ( Compressed_astc_4x4_rgba,
          constant "PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA" int64_t );
        ( Compressed_astc_8x8_rgba,
          constant "PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA" int64_t );
      ]

    let t = enum "PixelFormat" ~typedef:true vals
  end

  module TextureFilter = struct
    type t =
      | Point
      | Bilinear
      | Trilinear
      | Anisotropic_4x
      | Anisotropic_8x
      | Anisotropic_16x

    let vals =
      [
        (Point, constant "TEXTURE_FILTER_POINT" int64_t);
        (Bilinear, constant "TEXTURE_FILTER_BILINEAR" int64_t);
        (Trilinear, constant "TEXTURE_FILTER_TRILINEAR" int64_t);
        (Anisotropic_4x, constant "TEXTURE_FILTER_ANISOTROPIC_4X" int64_t);
        (Anisotropic_8x, constant "TEXTURE_FILTER_ANISOTROPIC_8X" int64_t);
        (Anisotropic_16x, constant "TEXTURE_FILTER_ANISOTROPIC_16X" int64_t);
      ]

    let t = enum "TextureFilter" ~typedef:true vals
  end

  module TextureWrap = struct
    type t = Repeat | Clamp | Mirror_repeat | Mirror_clamp

    let vals =
      [
        (Repeat, constant "TEXTURE_WRAP_REPEAT" int64_t);
        (Clamp, constant "TEXTURE_WRAP_CLAMP" int64_t);
        (Mirror_repeat, constant "TEXTURE_WRAP_MIRROR_REPEAT" int64_t);
        (Mirror_clamp, constant "TEXTURE_WRAP_MIRROR_CLAMP" int64_t);
      ]

    let t = enum "TextureWrap" ~typedef:true vals
  end

  module CubemapLayout = struct
    type t =
      | Auto_detect
      | Line_vertical
      | Line_horizontal
      | Cross_three_by_four
      | Cross_four_by_three
      | Panorama

    let vals =
      [
        (Auto_detect, constant "CUBEMAP_LAYOUT_AUTO_DETECT" int64_t);
        (Line_vertical, constant "CUBEMAP_LAYOUT_LINE_VERTICAL" int64_t);
        (Line_horizontal, constant "CUBEMAP_LAYOUT_LINE_HORIZONTAL" int64_t);
        ( Cross_three_by_four,
          constant "CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR" int64_t );
        ( Cross_four_by_three,
          constant "CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE" int64_t );
        (Panorama, constant "CUBEMAP_LAYOUT_PANORAMA" int64_t);
      ]

    let t = enum "CubemapLayout" ~typedef:true vals
  end

  module FontType = struct
    type t = Default | Bitmap | Sdf

    let vals =
      [
        (Default, constant "FONT_DEFAULT" int64_t);
        (Bitmap, constant "FONT_BITMAP" int64_t);
        (Sdf, constant "FONT_SDF" int64_t);
      ]

    let t = enum "FontType" ~typedef:true vals
  end

  module BlendMode = struct
    type t =
      | Alpha
      | Additive
      | Multiplied
      | Add_colors
      | Subtract_colors
      | Alpha_premultiply
      | Custom
      | Custom_separate

    let vals =
      [
        (Alpha, constant "BLEND_ALPHA" int64_t);
        (Additive, constant "BLEND_ADDITIVE" int64_t);
        (Multiplied, constant "BLEND_MULTIPLIED" int64_t);
        (Add_colors, constant "BLEND_ADD_COLORS" int64_t);
        (Subtract_colors, constant "BLEND_SUBTRACT_COLORS" int64_t);
        (Alpha_premultiply, constant "BLEND_ALPHA_PREMULTIPLY" int64_t);
        (Custom, constant "BLEND_CUSTOM" int64_t);
        (Custom_separate, constant "BLEND_CUSTOM_SEPARATE" int64_t);
      ]

    let t = enum "BlendMode" ~typedef:true vals
  end

  module Gesture = struct
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

    let vals =
      [
        (None, constant "GESTURE_NONE" int64_t);
        (Tap, constant "GESTURE_TAP" int64_t);
        (Doubletap, constant "GESTURE_DOUBLETAP" int64_t);
        (Hold, constant "GESTURE_HOLD" int64_t);
        (Drag, constant "GESTURE_DRAG" int64_t);
        (Swipe_right, constant "GESTURE_SWIPE_RIGHT" int64_t);
        (Swipe_left, constant "GESTURE_SWIPE_LEFT" int64_t);
        (Swipe_up, constant "GESTURE_SWIPE_UP" int64_t);
        (Swipe_down, constant "GESTURE_SWIPE_DOWN" int64_t);
        (Pinch_in, constant "GESTURE_PINCH_IN" int64_t);
        (Pinch_out, constant "GESTURE_PINCH_OUT" int64_t);
      ]

    let t = enum "Gesture" ~typedef:true vals
  end

  module CameraMode = struct
    type t = Custom | Free | Orbital | First_person | Third_person

    let vals =
      [
        (Custom, constant "CAMERA_CUSTOM" int64_t);
        (Free, constant "CAMERA_FREE" int64_t);
        (Orbital, constant "CAMERA_ORBITAL" int64_t);
        (First_person, constant "CAMERA_FIRST_PERSON" int64_t);
        (Third_person, constant "CAMERA_THIRD_PERSON" int64_t);
      ]

    let t = enum "CameraMode" ~typedef:true vals
  end

  module CameraProjection = struct
    type t = Perspective | Orthographic

    let vals =
      [
        (Perspective, constant "CAMERA_PERSPECTIVE" int64_t);
        (Orthographic, constant "CAMERA_ORTHOGRAPHIC" int64_t);
      ]

    let t = enum "CameraProjection" ~typedef:true vals
  end

  module NPatchLayout = struct
    type t = Nine_patch | Three_patch_vertical | Three_patch_horizontal

    let vals =
      [
        (Nine_patch, constant "NPATCH_NINE_PATCH" int64_t);
        (Three_patch_vertical, constant "NPATCH_THREE_PATCH_VERTICAL" int64_t);
        ( Three_patch_horizontal,
          constant "NPATCH_THREE_PATCH_HORIZONTAL" int64_t );
      ]

    let t = enum "NPatchLayout" ~typedef:true vals
  end

  let max_material_maps = constant "MAX_MATERIAL_MAPS" camlint
  let max_shader_locations = constant "RL_MAX_SHADER_LOCATIONS" camlint

  module Vector2 = struct
    type t

    let t : t Ctypes.structure typ = structure "Vector2"
    let x = field t "x" float
    let y = field t "y" float
    let () = seal t
  end

  module Vector3 = struct
    type t

    let t : t Ctypes.structure typ = structure "Vector3"
    let x = field t "x" float
    let y = field t "y" float
    let z = field t "z" float
    let () = seal t
  end

  module Vector4 = struct
    type t

    let t : t Ctypes.structure typ = structure "Vector4"
    let x = field t "x" float
    let y = field t "y" float
    let z = field t "z" float
    let w = field t "w" float
    let () = seal t
  end

  module Matrix = struct
    type t

    let t : t Ctypes.structure typ = structure "Matrix"
    let m0 = field t "m0" float
    let m1 = field t "m1" float
    let m2 = field t "m2" float
    let m3 = field t "m3" float
    let m4 = field t "m4" float
    let m5 = field t "m5" float
    let m6 = field t "m6" float
    let m7 = field t "m7" float
    let m8 = field t "m8" float
    let m9 = field t "m9" float
    let m10 = field t "m10" float
    let m11 = field t "m11" float
    let m12 = field t "m12" float
    let m13 = field t "m13" float
    let m14 = field t "m14" float
    let m15 = field t "m15" float
    let () = seal t
  end

  module Color = struct
    type t

    let t : t Ctypes.structure typ = structure "Color"
    let r = field t "r" uchar
    let g = field t "g" uchar
    let b = field t "b" uchar
    let a = field t "a" uchar
    let () = seal t
  end

  module Rectangle = struct
    type t

    let t : t Ctypes.structure typ = structure "Rectangle"
    let x = field t "x" float
    let y = field t "y" float
    let width = field t "width" float
    let height = field t "height" float
    let () = seal t
  end

  module Image = struct
    type t

    let t : t Ctypes.structure typ = structure "Image"
    let data = field t "data" (ptr void)
    let width = field t "width" int
    let height = field t "height" int
    let mipmaps = field t "mipmaps" int
    let format = field t "format" int
    let () = seal t
  end

  module Texture = struct
    type t

    let t : t Ctypes.structure typ = structure "Texture"
    let id = field t "id" uint
    let width = field t "width" int
    let height = field t "height" int
    let mipmaps = field t "mipmaps" int
    let format = field t "format" int
    let () = seal t
  end

  module RenderTexture = struct
    type t

    let t : t Ctypes.structure typ = structure "RenderTexture"
    let id = field t "id" uint
    let texture = field t "texture" Texture.t
    let depth = field t "depth" Texture.t
    let () = seal t
  end

  module NPatchInfo = struct
    type t

    let t : t Ctypes.structure typ = structure "NPatchInfo"
    let source = field t "source" Rectangle.t
    let left = field t "left" int
    let top = field t "top" int
    let right = field t "right" int
    let bottom = field t "bottom" int
    let layout = field t "layout" int
    let () = seal t
  end

  module GlyphInfo = struct
    type t

    let t : t Ctypes.structure typ = structure "GlyphInfo"
    let value = field t "value" int
    let offset_x = field t "offsetX" int
    let offset_y = field t "offsetY" int
    let advance_x = field t "advanceX" int
    let image = field t "image" Image.t
    let () = seal t
  end

  module Font = struct
    type t

    let t : t Ctypes.structure typ = structure "Font"
    let base_size = field t "baseSize" int
    let glyph_count = field t "glyphCount" int
    let glyph_padding = field t "glyphPadding" int
    let texture = field t "texture" Texture.t
    let recs = field t "recs" (ptr Rectangle.t)
    let glyphs = field t "glyphs" (ptr GlyphInfo.t)
    let () = seal t
  end

  module Camera3D = struct
    type t

    let t : t Ctypes.structure typ = structure "Camera3D"
    let position = field t "position" Vector3.t
    let target = field t "target" Vector3.t
    let up = field t "up" Vector3.t
    let fovy = field t "fovy" float
    let projection = field t "projection" int
    let () = seal t
  end

  module Camera2D = struct
    type t

    let t : t Ctypes.structure typ = structure "Camera2D"
    let offset = field t "offset" Vector2.t
    let target = field t "target" Vector2.t
    let rotation = field t "rotation" float
    let zoom = field t "zoom" float
    let () = seal t
  end

  module Mesh = struct
    type t

    let t : t Ctypes.structure typ = structure "Mesh"
    let vertex_count = field t "vertexCount" int
    let triangle_count = field t "triangleCount" int
    let vertices = field t "vertices" (ptr float)
    let texcoords = field t "texcoords" (ptr float)
    let texcoords2 = field t "texcoords2" (ptr float)
    let normals = field t "normals" (ptr float)
    let tangents = field t "tangents" (ptr float)
    let colors = field t "colors" (ptr uchar)
    let indices = field t "indices" (ptr ushort)
    let anim_vertices = field t "animVertices" (ptr float)
    let anim_normals = field t "animNormals" (ptr float)
    let bone_ids = field t "boneIds" (ptr int)
    let bone_weights = field t "boneWeights" (ptr float)
    let vao_id = field t "vaoId" uint
    let vbo_id = field t "vboId" (ptr uint)
    let () = seal t
  end

  module Shader = struct
    type t

    let t : t Ctypes.structure typ = structure "Shader"
    let id = field t "id" uint
    let locs = field t "locs" (ptr int)
    let () = seal t
  end

  module MaterialMap = struct
    type t

    let t : t Ctypes.structure typ = structure "MaterialMap"
    let texture = field t "texture" Texture.t
    let color = field t "color" Color.t
    let value = field t "value" float
    let () = seal t
  end

  module Material = struct
    let float_array_4 = array 4 float

    type t

    let t : t Ctypes.structure typ = structure "Material"
    let shader = field t "shader" Shader.t
    let maps = field t "maps" (ptr MaterialMap.t)
    let params = field t "params" float_array_4
    let () = seal t
  end

  module Transform = struct
    type t

    let t : t Ctypes.structure typ = structure "Transform"
    let translation = field t "translation" Vector3.t
    let rotation = field t "rotation" Vector4.t
    let scale = field t "scale" Vector3.t
    let () = seal t
  end

  module BoneInfo = struct
    let char_array_32 = array 32 char

    type t

    let t : t Ctypes.structure typ = structure "BoneInfo"
    let name = field t "name" char_array_32
    let parent = field t "parent" int
    let () = seal t
  end

  module Model = struct
    type t

    let t : t Ctypes.structure typ = structure "Model"
    let transform = field t "transform" Matrix.t
    let mesh_count = field t "meshCount" int
    let material_count = field t "materialCount" int
    let meshes = field t "meshes" (ptr Mesh.t)
    let materials = field t "materials" (ptr Material.t)
    let mesh_material = field t "meshMaterial" (ptr int)
    let bone_count = field t "boneCount" int
    let bones = field t "bones" (ptr BoneInfo.t)
    let bind_pose = field t "bindPose" (ptr Transform.t)
    let () = seal t
  end

  module ModelAnimation = struct
    let char_array_32 = array 32 char

    type t

    let t : t Ctypes.structure typ = structure "ModelAnimation"
    let bone_count = field t "boneCount" int
    let frame_count = field t "frameCount" int
    let bones = field t "bones" (ptr BoneInfo.t)
    let frame_poses = field t "framePoses" (ptr (ptr Transform.t))
    let name = field t "name" char_array_32
    let () = seal t
  end

  module Ray = struct
    type t

    let t : t Ctypes.structure typ = structure "Ray"
    let position = field t "position" Vector3.t
    let direction = field t "direction" Vector3.t
    let () = seal t
  end

  module RayCollision = struct
    type t

    let t : t Ctypes.structure typ = structure "RayCollision"
    let hit = field t "hit" bool
    let distance = field t "distance" float
    let point = field t "point" Vector3.t
    let normal = field t "normal" Vector3.t
    let () = seal t
  end

  module BoundingBox = struct
    type t

    let t : t Ctypes.structure typ = structure "BoundingBox"
    let min = field t "min" Vector3.t
    let max = field t "max" Vector3.t
    let () = seal t
  end

  module Wave = struct
    type t

    let t : t Ctypes.structure typ = structure "Wave"
    let frame_count = field t "frameCount" uint
    let sample_rate = field t "sampleRate" uint
    let sample_size = field t "sampleSize" uint
    let channels = field t "channels" uint
    let data = field t "data" (ptr void)
    let () = seal t
  end

  module AudioStream = struct
    let r_audio_buffer : [ `R_audio_buffer ] Ctypes.structure typ =
      structure "rAudioBuffer"

    let r_audio_processor : [ `R_audio_processor ] Ctypes.structure typ =
      structure "rAudioProcessor"

    type t

    let t : t Ctypes.structure typ = structure "AudioStream"
    let buffer = field t "buffer" (ptr r_audio_buffer)
    let processor = field t "processor" (ptr r_audio_processor)
    let sample_rate = field t "sampleRate" uint
    let sample_size = field t "sampleSize" uint
    let channels = field t "channels" uint
    let () = seal t
  end

  module Sound = struct
    type t

    let t : t Ctypes.structure typ = structure "Sound"
    let stream = field t "stream" AudioStream.t
    let frame_count = field t "frameCount" uint
    let () = seal t
  end

  module Music = struct
    type t

    let t : t Ctypes.structure typ = structure "Music"
    let stream = field t "stream" AudioStream.t
    let frame_count = field t "frameCount" uint
    let looping = field t "looping" bool
    let ctx_type = field t "ctxType" int
    let ctx_data = field t "ctxData" (ptr void)
    let () = seal t
  end

  module VrDeviceInfo = struct
    let float_array_4 = array 4 float

    type t

    let t : t Ctypes.structure typ = structure "VrDeviceInfo"
    let h_resolution = field t "hResolution" int
    let v_resolution = field t "vResolution" int
    let h_screen_size = field t "hScreenSize" float
    let v_screen_size = field t "vScreenSize" float
    let v_screen_center = field t "vScreenCenter" float
    let eye_to_screen_distance = field t "eyeToScreenDistance" float
    let lens_separation_distance = field t "lensSeparationDistance" float
    let interpupillary_distance = field t "interpupillaryDistance" float
    let lens_distortion_values = field t "lensDistortionValues" float_array_4
    let chroma_ab_correction = field t "chromaAbCorrection" float_array_4
    let () = seal t
  end

  module VrStereoConfig = struct
    let matrix_array_2 = array 2 Matrix.t
    let float_array_2 = array 2 float

    type t

    let t : t Ctypes.structure typ = structure "VrStereoConfig"
    let projection = field t "projection" matrix_array_2
    let view_offset = field t "viewOffset" matrix_array_2
    let left_lens_center = field t "leftLensCenter" float_array_2
    let right_lens_center = field t "rightLensCenter" float_array_2
    let left_screen_center = field t "leftScreenCenter" float_array_2
    let right_screen_center = field t "rightScreenCenter" float_array_2
    let scale = field t "scale" float_array_2
    let scale_in = field t "scaleIn" float_array_2
    let () = seal t
  end

  module FilePathList = struct
    type t

    let t : t Ctypes.structure typ = structure "FilePathList"
    let capacity = field t "capacity" int
    let count = field t "count" int
    let paths = field t "paths" (ptr string)
    let () = seal t
  end

  module AutomationEvent = struct
    let int_array_4 = array 4 int

    type t

    let t : t Ctypes.structure typ = structure "AutomationEvent"
    let frame = field t "frame" uint
    let typ = field t "type" uint
    let params = field t "params" int_array_4
    let () = seal t
  end

  module AutomationEventList = struct
    type t

    let t : t Ctypes.structure typ = structure "AutomationEventList"
    let capacity = field t "capacity" uint
    let count = field t "count" uint
    let events = field t "events" (ptr AutomationEvent.t)
    let () = seal t
  end
end
