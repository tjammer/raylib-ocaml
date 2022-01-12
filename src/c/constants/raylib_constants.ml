let%c () = header "#include <raylib.h>\n#include <config.h>"

module ConfigFlags = struct
  type%c t =
    | Vsync_hint [@cname "FLAG_VSYNC_HINT"]
    | Fullscreen_mode [@cname "FLAG_FULLSCREEN_MODE"]
    | Window_resizable [@cname "FLAG_WINDOW_RESIZABLE"]
    | Window_undecorated [@cname "FLAG_WINDOW_UNDECORATED"]
    | Window_hidden [@cname "FLAG_WINDOW_HIDDEN"]
    | Window_minimized [@cname "FLAG_WINDOW_MINIMIZED"]
    | Window_maximized [@cname "FLAG_WINDOW_MAXIMIZED"]
    | Window_unfocused [@cname "FLAG_WINDOW_UNFOCUSED"]
    | Window_topmost [@cname "FLAG_WINDOW_TOPMOST"]
    | Window_always_run [@cname "FLAG_WINDOW_ALWAYS_RUN"]
    | Window_transparent [@cname "FLAG_WINDOW_TRANSPARENT"]
    | Window_highdpi [@cname "FLAG_WINDOW_HIGHDPI"]
    | Msaa_4x_hint [@cname "FLAG_MSAA_4X_HINT"]
    | Interlaced_hint [@cname "FLAG_INTERLACED_HINT"]
  [@@cname "ConfigFlags"] [@@typedef] [@@with_bitmask]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TraceLogLevel = struct
  type%c t =
    | All [@cname "LOG_ALL"]
    | Trace [@cname "LOG_TRACE"]
    | Debug [@cname "LOG_DEBUG"]
    | Info [@cname "LOG_INFO"]
    | Warning [@cname "LOG_WARNING"]
    | Error [@cname "LOG_ERROR"]
    | Fatal [@cname "LOG_FATAL"]
    | None [@cname "LOG_NONE"]
  [@@cname "TraceLogLevel"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Key = struct
  type%c t =
    | Null [@cname "KEY_NULL"]
    | Apostrophe [@cname "KEY_APOSTROPHE"]
    | Comma [@cname "KEY_COMMA"]
    | Minus [@cname "KEY_MINUS"]
    | Period [@cname "KEY_PERIOD"]
    | Slash [@cname "KEY_SLASH"]
    | Zero [@cname "KEY_ZERO"]
    | One [@cname "KEY_ONE"]
    | Two [@cname "KEY_TWO"]
    | Three [@cname "KEY_THREE"]
    | Four [@cname "KEY_FOUR"]
    | Five [@cname "KEY_FIVE"]
    | Six [@cname "KEY_SIX"]
    | Seven [@cname "KEY_SEVEN"]
    | Eight [@cname "KEY_EIGHT"]
    | Nine [@cname "KEY_NINE"]
    | Semicolon [@cname "KEY_SEMICOLON"]
    | Equal [@cname "KEY_EQUAL"]
    | A [@cname "KEY_A"]
    | B [@cname "KEY_B"]
    | C [@cname "KEY_C"]
    | D [@cname "KEY_D"]
    | E [@cname "KEY_E"]
    | F [@cname "KEY_F"]
    | G [@cname "KEY_G"]
    | H [@cname "KEY_H"]
    | I [@cname "KEY_I"]
    | J [@cname "KEY_J"]
    | K [@cname "KEY_K"]
    | L [@cname "KEY_L"]
    | M [@cname "KEY_M"]
    | N [@cname "KEY_N"]
    | O [@cname "KEY_O"]
    | P [@cname "KEY_P"]
    | Q [@cname "KEY_Q"]
    | R [@cname "KEY_R"]
    | S [@cname "KEY_S"]
    | T [@cname "KEY_T"]
    | U [@cname "KEY_U"]
    | V [@cname "KEY_V"]
    | W [@cname "KEY_W"]
    | X [@cname "KEY_X"]
    | Y [@cname "KEY_Y"]
    | Z [@cname "KEY_Z"]
    | Left_bracket [@cname "KEY_LEFT_BRACKET"]
    | Backslash [@cname "KEY_BACKSLASH"]
    | Right_bracket [@cname "KEY_RIGHT_BRACKET"]
    | Grave [@cname "KEY_GRAVE"]
    | Space [@cname "KEY_SPACE"]
    | Escape [@cname "KEY_ESCAPE"]
    | Enter [@cname "KEY_ENTER"]
    | Tab [@cname "KEY_TAB"]
    | Backspace [@cname "KEY_BACKSPACE"]
    | Insert [@cname "KEY_INSERT"]
    | Delete [@cname "KEY_DELETE"]
    | Right [@cname "KEY_RIGHT"]
    | Left [@cname "KEY_LEFT"]
    | Down [@cname "KEY_DOWN"]
    | Up [@cname "KEY_UP"]
    | Page_up [@cname "KEY_PAGE_UP"]
    | Page_down [@cname "KEY_PAGE_DOWN"]
    | Home [@cname "KEY_HOME"]
    | End [@cname "KEY_END"]
    | Caps_lock [@cname "KEY_CAPS_LOCK"]
    | Scroll_lock [@cname "KEY_SCROLL_LOCK"]
    | Num_lock [@cname "KEY_NUM_LOCK"]
    | Print_screen [@cname "KEY_PRINT_SCREEN"]
    | Pause [@cname "KEY_PAUSE"]
    | F1 [@cname "KEY_F1"]
    | F2 [@cname "KEY_F2"]
    | F3 [@cname "KEY_F3"]
    | F4 [@cname "KEY_F4"]
    | F5 [@cname "KEY_F5"]
    | F6 [@cname "KEY_F6"]
    | F7 [@cname "KEY_F7"]
    | F8 [@cname "KEY_F8"]
    | F9 [@cname "KEY_F9"]
    | F10 [@cname "KEY_F10"]
    | F11 [@cname "KEY_F11"]
    | F12 [@cname "KEY_F12"]
    | Left_shift [@cname "KEY_LEFT_SHIFT"]
    | Left_control [@cname "KEY_LEFT_CONTROL"]
    | Left_alt [@cname "KEY_LEFT_ALT"]
    | Left_super [@cname "KEY_LEFT_SUPER"]
    | Right_shift [@cname "KEY_RIGHT_SHIFT"]
    | Right_control [@cname "KEY_RIGHT_CONTROL"]
    | Right_alt [@cname "KEY_RIGHT_ALT"]
    | Right_super [@cname "KEY_RIGHT_SUPER"]
    | Kb_menu [@cname "KEY_KB_MENU"]
    | Kp_0 [@cname "KEY_KP_0"]
    | Kp_1 [@cname "KEY_KP_1"]
    | Kp_2 [@cname "KEY_KP_2"]
    | Kp_3 [@cname "KEY_KP_3"]
    | Kp_4 [@cname "KEY_KP_4"]
    | Kp_5 [@cname "KEY_KP_5"]
    | Kp_6 [@cname "KEY_KP_6"]
    | Kp_7 [@cname "KEY_KP_7"]
    | Kp_8 [@cname "KEY_KP_8"]
    | Kp_9 [@cname "KEY_KP_9"]
    | Kp_decimal [@cname "KEY_KP_DECIMAL"]
    | Kp_divide [@cname "KEY_KP_DIVIDE"]
    | Kp_multiply [@cname "KEY_KP_MULTIPLY"]
    | Kp_subtract [@cname "KEY_KP_SUBTRACT"]
    | Kp_add [@cname "KEY_KP_ADD"]
    | Kp_enter [@cname "KEY_KP_ENTER"]
    | Kp_equal [@cname "KEY_KP_EQUAL"]
    | Back [@cname "KEY_BACK"]
    | Menu [@cname "KEY_MENU"]
    | Volume_up [@cname "KEY_VOLUME_UP"]
    | Volume_down [@cname "KEY_VOLUME_DOWN"]
  [@@cname "KeyboardKey"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseButton = struct
  type%c t =
    | Left [@cname "MOUSE_BUTTON_LEFT"]
    | Right [@cname "MOUSE_BUTTON_RIGHT"]
    | Middle [@cname "MOUSE_BUTTON_MIDDLE"]
    | Side [@cname "MOUSE_BUTTON_SIDE"]
    | Extra [@cname "MOUSE_BUTTON_EXTRA"]
    | Forward [@cname "MOUSE_BUTTON_FORWARD"]
    | Back [@cname "MOUSE_BUTTON_BACK"]
  [@@cname "MouseButton"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseCursor = struct
  type%c t =
    | Default [@cname "MOUSE_CURSOR_DEFAULT"]
    | Arrow [@cname "MOUSE_CURSOR_ARROW"]
    | Ibeam [@cname "MOUSE_CURSOR_IBEAM"]
    | Crosshair [@cname "MOUSE_CURSOR_CROSSHAIR"]
    | Pointing_hand [@cname "MOUSE_CURSOR_POINTING_HAND"]
    | Resize_ew [@cname "MOUSE_CURSOR_RESIZE_EW"]
    | Resize_ns [@cname "MOUSE_CURSOR_RESIZE_NS"]
    | Resize_nwse [@cname "MOUSE_CURSOR_RESIZE_NWSE"]
    | Resize_nesw [@cname "MOUSE_CURSOR_RESIZE_NESW"]
    | Resize_all [@cname "MOUSE_CURSOR_RESIZE_ALL"]
    | Not_allowed [@cname "MOUSE_CURSOR_NOT_ALLOWED"]
  [@@cname "MouseCursor"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadButton = struct
  type%c t =
    | Unknown [@cname "GAMEPAD_BUTTON_UNKNOWN"]
    | Left_face_up [@cname "GAMEPAD_BUTTON_LEFT_FACE_UP"]
    | Left_face_right [@cname "GAMEPAD_BUTTON_LEFT_FACE_RIGHT"]
    | Left_face_down [@cname "GAMEPAD_BUTTON_LEFT_FACE_DOWN"]
    | Left_face_left [@cname "GAMEPAD_BUTTON_LEFT_FACE_LEFT"]
    | Right_face_up [@cname "GAMEPAD_BUTTON_RIGHT_FACE_UP"]
    | Right_face_right [@cname "GAMEPAD_BUTTON_RIGHT_FACE_RIGHT"]
    | Right_face_down [@cname "GAMEPAD_BUTTON_RIGHT_FACE_DOWN"]
    | Right_face_left [@cname "GAMEPAD_BUTTON_RIGHT_FACE_LEFT"]
    | Left_trigger_1 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_1"]
    | Left_trigger_2 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_2"]
    | Right_trigger_1 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_1"]
    | Right_trigger_2 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_2"]
    | Middle_left [@cname "GAMEPAD_BUTTON_MIDDLE_LEFT"]
    | Middle [@cname "GAMEPAD_BUTTON_MIDDLE"]
    | Middle_right [@cname "GAMEPAD_BUTTON_MIDDLE_RIGHT"]
    | Left_thumb [@cname "GAMEPAD_BUTTON_LEFT_THUMB"]
    | Right_thumb [@cname "GAMEPAD_BUTTON_RIGHT_THUMB"]
  [@@cname "GamepadButton"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadAxis = struct
  type%c t =
    | Left_x [@cname "GAMEPAD_AXIS_LEFT_X"]
    | Left_y [@cname "GAMEPAD_AXIS_LEFT_Y"]
    | Right_x [@cname "GAMEPAD_AXIS_RIGHT_X"]
    | Right_y [@cname "GAMEPAD_AXIS_RIGHT_Y"]
    | Left_trigger [@cname "GAMEPAD_AXIS_LEFT_TRIGGER"]
    | Right_trigger [@cname "GAMEPAD_AXIS_RIGHT_TRIGGER"]
  [@@cname "GamepadAxis"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MaterialMapIndex = struct
  type%c t =
    | Albedo [@cname "MATERIAL_MAP_ALBEDO"]
    | Metalness [@cname "MATERIAL_MAP_METALNESS"]
    | Normal [@cname "MATERIAL_MAP_NORMAL"]
    | Roughness [@cname "MATERIAL_MAP_ROUGHNESS"]
    | Occlusion [@cname "MATERIAL_MAP_OCCLUSION"]
    | Emission [@cname "MATERIAL_MAP_EMISSION"]
    | Height [@cname "MATERIAL_MAP_HEIGHT"]
    | Cubemap [@cname "MATERIAL_MAP_CUBEMAP"]
    | Irradiance [@cname "MATERIAL_MAP_IRRADIANCE"]
    | Prefilter [@cname "MATERIAL_MAP_PREFILTER"]
    | Brdf [@cname "MATERIAL_MAP_BRDF"]
  [@@cname "MaterialMapIndex"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderLocationIndex = struct
  type%c t =
    | Vertex_position [@cname "SHADER_LOC_VERTEX_POSITION"]
    | Vertex_texcoord01 [@cname "SHADER_LOC_VERTEX_TEXCOORD01"]
    | Vertex_texcoord02 [@cname "SHADER_LOC_VERTEX_TEXCOORD02"]
    | Vertex_normal [@cname "SHADER_LOC_VERTEX_NORMAL"]
    | Vertex_tangent [@cname "SHADER_LOC_VERTEX_TANGENT"]
    | Vertex_color [@cname "SHADER_LOC_VERTEX_COLOR"]
    | Matrix_mvp [@cname "SHADER_LOC_MATRIX_MVP"]
    | Matrix_view [@cname "SHADER_LOC_MATRIX_VIEW"]
    | Matrix_projection [@cname "SHADER_LOC_MATRIX_PROJECTION"]
    | Matrix_model [@cname "SHADER_LOC_MATRIX_MODEL"]
    | Matrix_normal [@cname "SHADER_LOC_MATRIX_NORMAL"]
    | Vector_view [@cname "SHADER_LOC_VECTOR_VIEW"]
    | Color_diffuse [@cname "SHADER_LOC_COLOR_DIFFUSE"]
    | Color_specular [@cname "SHADER_LOC_COLOR_SPECULAR"]
    | Color_ambient [@cname "SHADER_LOC_COLOR_AMBIENT"]
    | Map_albedo [@cname "SHADER_LOC_MAP_ALBEDO"]
    | Map_metalness [@cname "SHADER_LOC_MAP_METALNESS"]
    | Map_normal [@cname "SHADER_LOC_MAP_NORMAL"]
    | Map_roughness [@cname "SHADER_LOC_MAP_ROUGHNESS"]
    | Map_occlusion [@cname "SHADER_LOC_MAP_OCCLUSION"]
    | Map_emission [@cname "SHADER_LOC_MAP_EMISSION"]
    | Map_height [@cname "SHADER_LOC_MAP_HEIGHT"]
    | Map_cubemap [@cname "SHADER_LOC_MAP_CUBEMAP"]
    | Map_irradiance [@cname "SHADER_LOC_MAP_IRRADIANCE"]
    | Map_prefilter [@cname "SHADER_LOC_MAP_PREFILTER"]
    | Map_brdf [@cname "SHADER_LOC_MAP_BRDF"]
  [@@cname "ShaderLocationIndex"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderUniformDataType = struct
  type%c t =
    | Float [@cname "SHADER_UNIFORM_FLOAT"]
    | Vec2 [@cname "SHADER_UNIFORM_VEC2"]
    | Vec3 [@cname "SHADER_UNIFORM_VEC3"]
    | Vec4 [@cname "SHADER_UNIFORM_VEC4"]
    | Int [@cname "SHADER_UNIFORM_INT"]
    | Ivec2 [@cname "SHADER_UNIFORM_IVEC2"]
    | Ivec3 [@cname "SHADER_UNIFORM_IVEC3"]
    | Ivec4 [@cname "SHADER_UNIFORM_IVEC4"]
    | Sampler2d [@cname "SHADER_UNIFORM_SAMPLER2D"]
  [@@cname "ShaderUniformDataType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderAttributeDataType = struct
  type%c t =
    | Float [@cname "SHADER_ATTRIB_FLOAT"]
    | Vec2 [@cname "SHADER_ATTRIB_VEC2"]
    | Vec3 [@cname "SHADER_ATTRIB_VEC3"]
    | Vec4 [@cname "SHADER_ATTRIB_VEC4"]
  [@@cname "ShaderAttributeDataType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module PixelFormat = struct
  type%c t =
    | Uncompressed_grayscale [@cname "PIXELFORMAT_UNCOMPRESSED_GRAYSCALE"]
    | Uncompressed_gray_alpha [@cname "PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA"]
    | Uncompressed_r5g6b5 [@cname "PIXELFORMAT_UNCOMPRESSED_R5G6B5"]
    | Uncompressed_r8g8b8 [@cname "PIXELFORMAT_UNCOMPRESSED_R8G8B8"]
    | Uncompressed_r5g5b5a1 [@cname "PIXELFORMAT_UNCOMPRESSED_R5G5B5A1"]
    | Uncompressed_r4g4b4a4 [@cname "PIXELFORMAT_UNCOMPRESSED_R4G4B4A4"]
    | Uncompressed_r8g8b8a8 [@cname "PIXELFORMAT_UNCOMPRESSED_R8G8B8A8"]
    | Uncompressed_r32 [@cname "PIXELFORMAT_UNCOMPRESSED_R32"]
    | Uncompressed_r32g32b32 [@cname "PIXELFORMAT_UNCOMPRESSED_R32G32B32"]
    | Uncompressed_r32g32b32a32 [@cname "PIXELFORMAT_UNCOMPRESSED_R32G32B32A32"]
    | Compressed_dxt1_rgb [@cname "PIXELFORMAT_COMPRESSED_DXT1_RGB"]
    | Compressed_dxt1_rgba [@cname "PIXELFORMAT_COMPRESSED_DXT1_RGBA"]
    | Compressed_dxt3_rgba [@cname "PIXELFORMAT_COMPRESSED_DXT3_RGBA"]
    | Compressed_dxt5_rgba [@cname "PIXELFORMAT_COMPRESSED_DXT5_RGBA"]
    | Compressed_etc1_rgb [@cname "PIXELFORMAT_COMPRESSED_ETC1_RGB"]
    | Compressed_etc2_rgb [@cname "PIXELFORMAT_COMPRESSED_ETC2_RGB"]
    | Compressed_etc2_eac_rgba [@cname "PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA"]
    | Compressed_pvrt_rgb [@cname "PIXELFORMAT_COMPRESSED_PVRT_RGB"]
    | Compressed_pvrt_rgba [@cname "PIXELFORMAT_COMPRESSED_PVRT_RGBA"]
    | Compressed_astc_4x4_rgba [@cname "PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA"]
    | Compressed_astc_8x8_rgba [@cname "PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA"]
  [@@cname "PixelFormat"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureFilter = struct
  type%c t =
    | Point [@cname "TEXTURE_FILTER_POINT"]
    | Bilinear [@cname "TEXTURE_FILTER_BILINEAR"]
    | Trilinear [@cname "TEXTURE_FILTER_TRILINEAR"]
    | Anisotropic_4x [@cname "TEXTURE_FILTER_ANISOTROPIC_4X"]
    | Anisotropic_8x [@cname "TEXTURE_FILTER_ANISOTROPIC_8X"]
    | Anisotropic_16x [@cname "TEXTURE_FILTER_ANISOTROPIC_16X"]
  [@@cname "TextureFilter"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureWrap = struct
  type%c t =
    | Repeat [@cname "TEXTURE_WRAP_REPEAT"]
    | Clamp [@cname "TEXTURE_WRAP_CLAMP"]
    | Mirror_repeat [@cname "TEXTURE_WRAP_MIRROR_REPEAT"]
    | Mirror_clamp [@cname "TEXTURE_WRAP_MIRROR_CLAMP"]
  [@@cname "TextureWrap"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CubemapLayout = struct
  type%c t =
    | Auto_detect [@cname "CUBEMAP_LAYOUT_AUTO_DETECT"]
    | Line_vertical [@cname "CUBEMAP_LAYOUT_LINE_VERTICAL"]
    | Line_horizontal [@cname "CUBEMAP_LAYOUT_LINE_HORIZONTAL"]
    | Cross_three_by_four [@cname "CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR"]
    | Cross_four_by_three [@cname "CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE"]
    | Panorama [@cname "CUBEMAP_LAYOUT_PANORAMA"]
  [@@cname "CubemapLayout"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module FontType = struct
  type%c t =
    | Default [@cname "FONT_DEFAULT"]
    | Bitmap [@cname "FONT_BITMAP"]
    | Sdf [@cname "FONT_SDF"]
  [@@cname "FontType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module BlendMode = struct
  type%c t =
    | Alpha [@cname "BLEND_ALPHA"]
    | Additive [@cname "BLEND_ADDITIVE"]
    | Multiplied [@cname "BLEND_MULTIPLIED"]
    | Add_colors [@cname "BLEND_ADD_COLORS"]
    | Subtract_colors [@cname "BLEND_SUBTRACT_COLORS"]
    | Custom [@cname "BLEND_CUSTOM"]
  [@@cname "BlendMode"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Gesture = struct
  type%c t =
    | None [@cname "GESTURE_NONE"]
    | Tap [@cname "GESTURE_TAP"]
    | Doubletap [@cname "GESTURE_DOUBLETAP"]
    | Hold [@cname "GESTURE_HOLD"]
    | Drag [@cname "GESTURE_DRAG"]
    | Swipe_right [@cname "GESTURE_SWIPE_RIGHT"]
    | Swipe_left [@cname "GESTURE_SWIPE_LEFT"]
    | Swipe_up [@cname "GESTURE_SWIPE_UP"]
    | Swipe_down [@cname "GESTURE_SWIPE_DOWN"]
    | Pinch_in [@cname "GESTURE_PINCH_IN"]
    | Pinch_out [@cname "GESTURE_PINCH_OUT"]
  [@@cname "Gesture"] [@@typedef] [@@with_bitmask]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraMode = struct
  type%c t =
    | Custom [@cname "CAMERA_CUSTOM"]
    | Free [@cname "CAMERA_FREE"]
    | Orbital [@cname "CAMERA_ORBITAL"]
    | First_person [@cname "CAMERA_FIRST_PERSON"]
    | Third_person [@cname "CAMERA_THIRD_PERSON"]
  [@@cname "CameraMode"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CameraProjection = struct
  type%c t =
    | Perspective [@cname "CAMERA_PERSPECTIVE"]
    | Orthographic [@cname "CAMERA_ORTHOGRAPHIC"]
  [@@cname "CameraProjection"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module NPatchLayout = struct
  type%c t =
    | Nine_patch [@cname "NPATCH_NINE_PATCH"]
    | Three_patch_vertical [@cname "NPATCH_THREE_PATCH_VERTICAL"]
    | Three_patch_horizontal [@cname "NPATCH_THREE_PATCH_HORIZONTAL"]
  [@@cname "NPatchLayout"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)
  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

let max_material_maps = [%c constant "MAX_MATERIAL_MAPS" camlint]
let max_shader_locations = [%c constant "RL_MAX_SHADER_LOCATIONS" camlint]
