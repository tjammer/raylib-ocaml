let%c () = header "#include <raylib.h>\n#include <rlgl.h>"

module ConfigFlag = struct
  type%c t =
    | VSync_hint [@cname "FLAG_VSYNC_HINT"]
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
    | MSAA_4X_hint [@cname "FLAG_MSAA_4X_HINT"]
    | Window_interlaced_hint [@cname "FLAG_INTERLACED_HINT"]
  [@@cname "ConfigFlag"] [@@typedef] [@@with_bitmask]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TraceLogType = struct
  type%c t =
    | All [@cname "LOG_ALL"]
    | Trace [@cname "LOG_TRACE"]
    | Debug [@cname "LOG_DEBUG"]
    | Info [@cname "LOG_INFO"]
    | Warning [@cname "LOG_WARNING"]
    | Error [@cname "LOG_ERROR"]
    | Fatal [@cname "LOG_FATAL"]
    | None [@cname "LOG_NONE"]
  [@@cname "TraceLogType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module Key = struct
  type%c t =
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
    (* Function keys *)
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
    | Keyboard_menu [@cname "KEY_KB_MENU"]
    | Left_bracket [@cname "KEY_LEFT_BRACKET"]
    | Backslash [@cname "KEY_BACKSLASH"]
    | Right_bracket [@cname "KEY_RIGHT_BRACKET"]
    | Grave [@cname "KEY_GRAVE"]
    (* Keypad keys *)
    | Keypad_0 [@cname "KEY_KP_0"]
    | Keypad_1 [@cname "KEY_KP_1"]
    | Keypad_2 [@cname "KEY_KP_2"]
    | Keypad_3 [@cname "KEY_KP_3"]
    | Keypad_4 [@cname "KEY_KP_4"]
    | Keypad_5 [@cname "KEY_KP_5"]
    | Keypad_6 [@cname "KEY_KP_6"]
    | Keypad_7 [@cname "KEY_KP_7"]
    | Keypad_8 [@cname "KEY_KP_8"]
    | Keypad_9 [@cname "KEY_KP_9"]
    | Keypad_decimal [@cname "KEY_KP_DECIMAL"]
    | Keypad_divide [@cname "KEY_KP_DIVIDE"]
    | Keypad_multiply [@cname "KEY_KP_MULTIPLY"]
    | Keypad_subtract [@cname "KEY_KP_SUBTRACT"]
    | Keypad_add [@cname "KEY_KP_ADD"]
    | Keypad_enter [@cname "KEY_KP_ENTER"]
    | Keypad_equal [@cname "KEY_KP_EQUAL"]
  [@@cname "KeyboardKey"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module AndroidButton = struct
  type%c t =
    | Back [@cname "KEY_BACK"]
    | Menu [@cname "KEY_MENU"]
    | Volume_up [@cname "KEY_VOLUME_UP"]
    | Volume_down [@cname "KEY_VOLUME_DOWN"]
  [@@cname "AndroidButton"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MouseButton = struct
  type%c t =
    | Left [@cname "MOUSE_LEFT_BUTTON"]
    | Right [@cname "MOUSE_RIGHT_BUTTON"]
    | Middle [@cname "MOUSE_MIDDLE_BUTTON"]
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
    | Resize_EW [@cname "MOUSE_CURSOR_RESIZE_EW"]
    | Resize_NS [@cname "MOUSE_CURSOR_RESIZE_NS"]
    | Resize_NWSE [@cname "MOUSE_CURSOR_RESIZE_NWSE"]
    | Resize_NESW [@cname "MOUSE_CURSOR_RESIZE_NESW"]
    | Resize_All [@cname "MOUSE_CURSOR_RESIZE_ALL"]
    | Not_allowed [@cname "MOUSE_CURSOR_NOT_ALLOWED"]
  [@@cname "MouseCursor"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadNumber = struct
  type%c t =
    | Player1 [@cname "GAMEPAD_PLAYER1"]
    | Player2 [@cname "GAMEPAD_PLAYER2"]
    | Player3 [@cname "GAMEPAD_PLAYER3"]
    | Player4 [@cname "GAMEPAD_PLAYER4"]
  [@@cname "GamepadNumber"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadButton = struct
  type%c t =
    (* This is here just for error checking *)
    | Unknown [@cname "GAMEPAD_BUTTON_UNKNOWN"]
    (* This is normally a DPAD *)
    | Left_face_up [@cname "GAMEPAD_BUTTON_LEFT_FACE_UP"]
    | Left_face_right [@cname "GAMEPAD_BUTTON_LEFT_FACE_RIGHT"]
    | Left_face_down [@cname "GAMEPAD_BUTTON_LEFT_FACE_DOWN"]
    | Left_face_left [@cname "GAMEPAD_BUTTON_LEFT_FACE_LEFT"]
    (* This normally corresponds with PlayStation and Xbox controllers *)
    (* XBOX: [Y,X,A,B]
     * PS3: [Triangle,Square,Cross,Circle] *)
    (* No support for 6 button controllers though.. *)
    | Right_face_up [@cname "GAMEPAD_BUTTON_RIGHT_FACE_UP"]
    | Right_face_right [@cname "GAMEPAD_BUTTON_RIGHT_FACE_RIGHT"]
    | Right_face_down [@cname "GAMEPAD_BUTTON_RIGHT_FACE_DOWN"]
    | Right_face_left [@cname "GAMEPAD_BUTTON_RIGHT_FACE_LEFT"]
    (* Triggers *)
    | Left_trigger_1 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_1"]
    | Left_trigger_2 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_2"]
    | Right_trigger_1 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_1"]
    | Right_trigger_2 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_2"]
    (* These are buttons in the center of the gamepad *)
    | Middle_left [@cname "GAMEPAD_BUTTON_MIDDLE_LEFT"]
    | Middle [@cname "GAMEPAD_BUTTON_MIDDLE"]
    | Middle_right [@cname "GAMEPAD_BUTTON_MIDDLE_RIGHT"]
    (* These are the joystick press in buttons *)
    | Left_thumb [@cname "GAMEPAD_BUTTON_LEFT_THUMB"]
    | Right_thumb [@cname "GAMEPAD_BUTTON_RIGHT_THUMB"]
  [@@cname "GamepadButton"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module GamepadAxis = struct
  type%c t =
    (* Left stick *)
    | Left_x [@cname "GAMEPAD_AXIS_LEFT_X"]
    | Left_y [@cname "GAMEPAD_AXIS_LEFT_Y"]
    (* Right stick *)
    | Right_x [@cname "GAMEPAD_AXIS_RIGHT_X"]
    | Right_y [@cname "GAMEPAD_AXIS_RIGHT_Y"]
    (* Pressure levels for the back triggers *)
    | Left_trigger [@cname "GAMEPAD_AXIS_LEFT_TRIGGER"]
    | Right_trigger [@cname "GAMEPAD_AXIS_RIGHT_TRIGGER"]
  [@@cname "GamepadAxis"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderLocationIndex = struct
  type%c t =
    | Vertex_position [@cname "LOC_VERTEX_POSITION"]
    | Vertex_texcoord01 [@cname "LOC_VERTEX_TEXCOORD01"]
    | Vertex_texcoord02 [@cname "LOC_VERTEX_TEXCOORD02"]
    | Vertex_normal [@cname "LOC_VERTEX_NORMAL"]
    | Vertex_tangent [@cname "LOC_VERTEX_TANGENT"]
    | Vertex_color [@cname "LOC_VERTEX_COLOR"]
    | Matrix_mvp [@cname "LOC_MATRIX_MVP"]
    | Matrix_model [@cname "LOC_MATRIX_MODEL"]
    | Matrix_view [@cname "LOC_MATRIX_VIEW"]
    | Matrix_projection [@cname "LOC_MATRIX_PROJECTION"]
    | Vector_view [@cname "LOC_VECTOR_VIEW"]
    | Color_diffuse [@cname "LOC_COLOR_DIFFUSE"]
    | Color_specular [@cname "LOC_COLOR_SPECULAR"]
    | Color_ambient [@cname "LOC_COLOR_AMBIENT"]
    | Map_albedo [@cname "LOC_MAP_ALBEDO"]
    | Map_metalness [@cname "LOC_MAP_METALNESS"]
    | Map_normal [@cname "LOC_MAP_NORMAL"]
    | Map_roughness [@cname "LOC_MAP_ROUGHNESS"]
    | Map_occlusion [@cname "LOC_MAP_OCCLUSION"]
    | Map_emission [@cname "LOC_MAP_EMISSION"]
    | Map_height [@cname "LOC_MAP_HEIGHT"]
    | Map_cubemap [@cname "LOC_MAP_CUBEMAP"]
    | Map_irradiance [@cname "LOC_MAP_IRRADIANCE"]
    | Map_prefilter [@cname "LOC_MAP_PREFILTER"]
    | Map_BRDF [@cname "LOC_MAP_BRDF"]
    | Map_diffuse [@cname "LOC_MAP_ALBEDO"]
    | Map_specular [@cname "LOC_MAP_METALNESS"]
  [@@cname "ShaderLocationIndex"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module ShaderUniformDataType = struct
  type%c t =
    | Float [@cname "UNIFORM_FLOAT"]
    | Vec2 [@cname "UNIFORM_VEC2"]
    | Vec3 [@cname "UNIFORM_VEC3"]
    | Vec4 [@cname "UNIFORM_VEC4"]
    | Int [@cname "UNIFORM_INT"]
    | IVec2 [@cname "UNIFORM_IVEC2"]
    | IVec3 [@cname "UNIFORM_IVEC3"]
    | IVec4 [@cname "UNIFORM_IVEC4"]
    | Sampler2D [@cname "UNIFORM_SAMPLER2D"]
  [@@cname "ShaderUniformDataType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module MaterialMapType = struct
  type%c t =
    | Albedo [@cname "MAP_ALBEDO"]
    | Metalness [@cname "MAP_METALNESS"]
    | Normal [@cname "MAP_NORMAL"]
    | Roughness [@cname "MAP_ROUGHNESS"]
    | Occlusion [@cname "MAP_OCCLUSION"]
    | Emission [@cname "MAP_EMISSION"]
    | Height [@cname "MAP_HEIGHT"]
    | Cubemap [@cname "MAP_CUBEMAP"]
    | Irradiance [@cname "MAP_IRRADIANCE"]
    | Prefilter [@cname "MAP_PREFILTER"]
    | BRDF [@cname "MAP_BRDF"]
    | Diffuse [@cname "MAP_ALBEDO"]
    | Specular [@cname "MAP_METALNESS"]
  [@@cname "MaterialMapType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module PixelFormat = struct
  type%c t =
    | Uncompressed_grayscale [@cname "UNCOMPRESSED_GRAYSCALE"]
    | Uncompressed_gray_alpha [@cname "UNCOMPRESSED_GRAY_ALPHA"]
    | Uncompressed_R5G6B5 [@cname "UNCOMPRESSED_R5G6B5"]
    | Uncompressed_R8G8B8 [@cname "UNCOMPRESSED_R8G8B8"]
    | Uncompressed_R5G5B5A1 [@cname "UNCOMPRESSED_R5G5B5A1"]
    | Uncompressed_R4G4B4A4 [@cname "UNCOMPRESSED_R4G4B4A4"]
    | Uncompressed_R8G8B8A8 [@cname "UNCOMPRESSED_R8G8B8A8"]
    | Uncompressed_R32 [@cname "UNCOMPRESSED_R32"]
    | Uncompressed_R32G32B32 [@cname "UNCOMPRESSED_R32G32B32"]
    | Uncompressed_R32G32B32A32 [@cname "UNCOMPRESSED_R32G32B32A32"]
    | Compressed_DXT1_RGB [@cname "COMPRESSED_DXT1_RGB"]
    | Compressed_DXT1_RGBA [@cname "COMPRESSED_DXT1_RGBA"]
    | Compressed_DXT3_RGBA [@cname "COMPRESSED_DXT3_RGBA"]
    | Compressed_DXT5_RGBA [@cname "COMPRESSED_DXT5_RGBA"]
    | Compressed_ETC1_RGB [@cname "COMPRESSED_ETC1_RGB"]
    | Compressed_ETC2_RGB [@cname "COMPRESSED_ETC2_RGB"]
    | Compressed_ETC2_EAC_RGBA [@cname "COMPRESSED_ETC2_EAC_RGBA"]
    | Compressed_PVRT_RGB [@cname "COMPRESSED_PVRT_RGB"]
    | Compressed_PVRT_RGBA [@cname "COMPRESSED_PVRT_RGBA"]
    | Compressed_ASTC_4x4_RGBA [@cname "COMPRESSED_ASTC_4x4_RGBA"]
    | Compressed_ASTC_8x8_RGBA [@cname "COMPRESSED_ASTC_8x8_RGBA"]
  [@@cname "PixelFormat"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureFilterMode = struct
  type%c t =
    | Point [@cname "FILTER_POINT"]
    | Bilinear [@cname "FILTER_BILINEAR"]
    | Trilinear [@cname "FILTER_TRILINEAR"]
    | Anisotropic_4X [@cname "FILTER_ANISOTROPIC_4X"]
    | Anisotropic_8X [@cname "FILTER_ANISOTROPIC_8X"]
    | Anisotropic_16X [@cname "FILTER_ANISOTROPIC_16X"]
  [@@cname "TextureFilterMode"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module CubemapLayoutType = struct
  type%c t =
    | Auto_detect [@cname "CUBEMAP_AUTO_DETECT"]
    | Line_vertical [@cname "CUBEMAP_LINE_VERTICAL"]
    | Line_horizontal [@cname "CUBEMAP_LINE_HORIZONTAL"]
    | Cross_three_by_four [@cname "CUBEMAP_CROSS_THREE_BY_FOUR"]
    | Cross_four_by_three [@cname "CUBEMAP_CROSS_FOUR_BY_THREE"]
    | Panorama [@cname "CUBEMAP_PANORAMA"]
  [@@cname "CubemapLayoutType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module TextureWrapMode = struct
  type%c t =
    | Repeat [@cname "WRAP_REPEAT"]
    | Clamp [@cname "WRAP_CLAMP"]
    | Mirror_repeat [@cname "WRAP_MIRROR_REPEAT"]
    | Mirror_clamp [@cname "WRAP_MIRROR_CLAMP"]
  [@@cname "TextureWrapMode"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module FontType = struct
  type%c t =
    | Default [@cname "FONT_DEFAULT"]
    | Bitmap [@cname "FONT_BITMAP"]
    | SDF [@cname "FONT_SDF"]
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

module GestureType = struct
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
  [@@cname "GestureType"] [@@typedef] [@@with_bitmask]

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

module CameraType = struct
  type%c t =
    | Perspective [@cname "CAMERA_PERSPECTIVE"]
    | Orthographic [@cname "CAMERA_ORTHOGRAPHIC"]
  [@@cname "CameraType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

module NPatchType = struct
  type%c t =
    | Nine_patch [@cname "NPT_9PATCH"]
    | Three_patch_vertical [@cname "NPT_3PATCH_VERTICAL"]
    | Three_patch_horizontal [@cname "NPT_3PATCH_HORIZONTAL"]
  [@@cname "NPatchType"] [@@typedef]

  let to_int x = Unsigned.UInt32.to_int Ctypes.(coerce t uint32_t x)

  let of_int i = Ctypes.(coerce uint32_t t (Unsigned.UInt32.of_int i))
end

let max_material_maps = [%c constant "MAX_MATERIAL_MAPS" camlint]

let max_shader_locations = [%c constant "MAX_SHADER_LOCATIONS" camlint]
