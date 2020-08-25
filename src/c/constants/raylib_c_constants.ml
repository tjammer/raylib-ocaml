let%c () = header "#include <raylib.h>"

module Key = struct
  (* TODO make CamelCase *)
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
    | PageUp [@cname "KEY_PAGE_UP"]
    | PageDown [@cname "KEY_PAGE_DOWN"]
    | Home [@cname "KEY_HOME"]
    | End [@cname "KEY_END"]
    | CapsLock [@cname "KEY_CAPS_LOCK"]
    | ScrollLock [@cname "KEY_SCROLL_LOCK"]
    | NumLock [@cname "KEY_NUM_LOCK"]
    | PrintScreen [@cname "KEY_PRINT_SCREEN"]
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
    | LeftShift [@cname "KEY_LEFT_SHIFT"]
    | LeftControl [@cname "KEY_LEFT_CONTROL"]
    | LeftAlt [@cname "KEY_LEFT_ALT"]
    | LeftSuper [@cname "KEY_LEFT_SUPER"]
    | RightShift [@cname "KEY_RIGHT_SHIFT"]
    | RightControl [@cname "KEY_RIGHT_CONTROL"]
    | RightAlt [@cname "KEY_RIGHT_ALT"]
    | RightSuper [@cname "KEY_RIGHT_SUPER"]
    | KbMenu [@cname "KEY_KB_MENU"]
    | LeftBracket [@cname "KEY_LEFT_BRACKET"]
    | Backslash [@cname "KEY_BACKSLASH"]
    | RightBracket [@cname "KEY_RIGHT_BRACKET"]
    | Grave [@cname "KEY_GRAVE"]
    (* Keypad keys *)
    | Kp0 [@cname "KEY_KP_0"]
    | Kp1 [@cname "KEY_KP_1"]
    | Kp2 [@cname "KEY_KP_2"]
    | Kp3 [@cname "KEY_KP_3"]
    | Kp4 [@cname "KEY_KP_4"]
    | Kp5 [@cname "KEY_KP_5"]
    | Kp6 [@cname "KEY_KP_6"]
    | Kp7 [@cname "KEY_KP_7"]
    | Kp8 [@cname "KEY_KP_8"]
    | Kp9 [@cname "KEY_KP_9"]
    | KpDecimal [@cname "KEY_KP_DECIMAL"]
    | KpDivide [@cname "KEY_KP_DIVIDE"]
    | KpMultiply [@cname "KEY_KP_MULTIPLY"]
    | KpSubtract [@cname "KEY_KP_SUBTRACT"]
    | KpAdd [@cname "KEY_KP_ADD"]
    | KpEnter [@cname "KEY_KP_ENTER"]
    | KpEqual [@cname "KEY_KP_EQUAL"]
  [@@cname "KeyboardKey"] [@@typedef]
end

module MouseButton = struct
  type%c t =
    | Left [@cname "MOUSE_LEFT_BUTTON"]
    | Right [@cname "MOUSE_RIGHT_BUTTON"]
    | Middle [@cname "MOUSE_MIDDLE_BUTTON"]
  [@@cname "MouseButton"] [@@typedef]
end

module GamepadNumber = struct
  type%c t =
    | Player1 [@cname "GAMEPAD_PLAYER1"]
    | Player2 [@cname "GAMEPAD_PLAYER2"]
    | Player3 [@cname "GAMEPAD_PLAYER3"]
    | Player4 [@cname "GAMEPAD_PLAYER4"]
  [@@cname "GamepadNumber"] [@@typedef]
end

module GamepadButton = struct
  type%c t =
    (* This is here just for error checking *)
    | Unknown [@cname "GAMEPAD_BUTTON_UNKNOWN"]
    (* This is normally a DPAD *)
    | LeftFaceUp [@cname "GAMEPAD_BUTTON_LEFT_FACE_UP"]
    | LeftFaceRight [@cname "GAMEPAD_BUTTON_LEFT_FACE_RIGHT"]
    | LeftFaceDown [@cname "GAMEPAD_BUTTON_LEFT_FACE_DOWN"]
    | LeftFaceLeft [@cname "GAMEPAD_BUTTON_LEFT_FACE_LEFT"]
    (* This normally corresponds with PlayStation and Xbox controllers *)
    (* XBOX: [Y,X,A,B]
     * PS3: [Triangle,Square,Cross,Circle] *)
    (* No support for 6 button controllers though.. *)
    | RightFaceUp [@cname "GAMEPAD_BUTTON_RIGHT_FACE_UP"]
    | RightFaceRight [@cname "GAMEPAD_BUTTON_RIGHT_FACE_RIGHT"]
    | RightFaceDown [@cname "GAMEPAD_BUTTON_RIGHT_FACE_DOWN"]
    | RightFaceLeft [@cname "GAMEPAD_BUTTON_RIGHT_FACE_LEFT"]
    (* Triggers *)
    | LeftTrigger1 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_1"]
    | LeftTrigger2 [@cname "GAMEPAD_BUTTON_LEFT_TRIGGER_2"]
    | RightTrigger1 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_1"]
    | RightTrigger2 [@cname "GAMEPAD_BUTTON_RIGHT_TRIGGER_2"]
    (* These are buttons in the center of the gamepad *)
    | MiddleLeft [@cname "GAMEPAD_BUTTON_MIDDLE_LEFT"]
    | Middle [@cname "GAMEPAD_BUTTON_MIDDLE"]
    | MiddleRight [@cname "GAMEPAD_BUTTON_MIDDLE_RIGHT"]
    (* These are the joystick press in buttons *)
    | LeftThumb [@cname "GAMEPAD_BUTTON_LEFT_THUMB"]
    | RightThumb [@cname "GAMEPAD_BUTTON_RIGHT_THUMB"]
  [@@cname "GamepadButton"] [@@typedef]
end

module GamepadAxis = struct
  type%c t =
    (* This is here just for error checking *)
    | Unknown [@cname "GAMEPAD_AXIS_UNKNOWN"]
    (* Left stick *)
    | LeftX [@cname "GAMEPAD_AXIS_LEFT_X"]
    | LeftY [@cname "GAMEPAD_AXIS_LEFT_Y"]
    (* Right stick *)
    | RightX [@cname "GAMEPAD_AXIS_RIGHT_X"]
    | RightY [@cname "GAMEPAD_AXIS_RIGHT_Y"]
    (* Pressure levels for the back triggers *)
    | LeftTrigger [@cname "GAMEPAD_AXIS_LEFT_TRIGGER"]
    | RightTrigger [@cname "GAMEPAD_AXIS_RIGHT_TRIGGER"]
  [@@cname "GamepadAxis"] [@@typedef]
end

module ShaderLocation = struct
  type%c t =
    | LocVertexPosition [@cname "LOC_VERTEX_POSITION"]
    | LocVertexTexcoord01 [@cname "LOC_VERTEX_TEXCOORD01"]
    | LocVertexTexcoord02 [@cname "LOC_VERTEX_TEXCOORD02"]
    | LocVertexNormal [@cname "LOC_VERTEX_NORMAL"]
    | LocVertexTangent [@cname "LOC_VERTEX_TANGENT"]
    | LocVertexColor [@cname "LOC_VERTEX_COLOR"]
    | LocMatrixMvp [@cname "LOC_MATRIX_MVP"]
    | LocMatrixModel [@cname "LOC_MATRIX_MODEL"]
    | LocMatrixView [@cname "LOC_MATRIX_VIEW"]
    | LocMatrixProjection [@cname "LOC_MATRIX_PROJECTION"]
    | LocVectorView [@cname "LOC_VECTOR_VIEW"]
    | LocColorDiffuse [@cname "LOC_COLOR_DIFFUSE"]
    | LocColorSpecular [@cname "LOC_COLOR_SPECULAR"]
    | LocColorAmbient [@cname "LOC_COLOR_AMBIENT"]
    | Albedo [@cname "LOC_MAP_ALBEDO"]
    | Metalness [@cname "LOC_MAP_METALNESS"]
    | Normal [@cname "LOC_MAP_NORMAL"]
    | Roughness [@cname "LOC_MAP_ROUGHNESS"]
    | Occlusion [@cname "LOC_MAP_OCCLUSION"]
    | Emission [@cname "LOC_MAP_EMISSION"]
    | Height [@cname "LOC_MAP_HEIGHT"]
    | Cubemap [@cname "LOC_MAP_CUBEMAP"]
    | Irradiance [@cname "LOC_MAP_IRRADIANCE"]
    | Prefilter [@cname "LOC_MAP_PREFILTER"]
    | Brdf [@cname "LOC_MAP_BRDF"]
  [@@cname "ShaderLocationIndex"] [@@typedef]
end

module ShaderUniformData = struct
  type%c t =
    | Float [@cname "UNIFORM_FLOAT"]
    | Vec2 [@cname "UNIFORM_VEC2"]
    | Vec3 [@cname "UNIFORM_VEC3"]
    | Vec4 [@cname "UNIFORM_VEC4"]
    | Int [@cname "UNIFORM_INT"]
    | Ivec2 [@cname "UNIFORM_IVEC2"]
    | Ivec3 [@cname "UNIFORM_IVEC3"]
    | Ivec4 [@cname "UNIFORM_IVEC4"]
    | Sampler2D [@cname "UNIFORM_SAMPLER2D"]
  [@@cname "ShaderUniformDataType"] [@@typedef]
end

module MaterialMap = struct
  type%c t =
    | Albedo [@cname "MAP_ALBEDO"]
    | Metalness [@cname "MAP_METALNESS"]
    | Normal [@cname "MAP_NORMAL"]
    | Roughness [@cname "MAP_ROUGHNESS"]
    | Occlusion [@cname "MAP_OCCLUSION"]
    | Emission [@cname "MAP_EMISSION"]
    | Height [@cname "MAP_HEIGHT"]
    | Cube [@cname "MAP_CUBEMAP"]
    | Irradiance [@cname "MAP_IRRADIANCE"]
    | Prefilter [@cname "MAP_PREFILTER"]
    | Brdf [@cname "MAP_BRDF"]
  [@@cname "MaterialMapType"] [@@typedef]
end

module PixelFormat = struct
  type%c t =
    | UncompressedGrayscale [@cname "UNCOMPRESSED_GRAYSCALE"]
    | UncompressedGrayAlpha [@cname "UNCOMPRESSED_GRAY_ALPHA"]
    | UncompressedR5G6B5 [@cname "UNCOMPRESSED_R5G6B5"]
    | UncompressedR8G8B8 [@cname "UNCOMPRESSED_R8G8B8"]
    | UncompressedR5G5B5A1 [@cname "UNCOMPRESSED_R5G5B5A1"]
    | UncompressedR4G4B4A4 [@cname "UNCOMPRESSED_R4G4B4A4"]
    | UncompressedR8G8B8A8 [@cname "UNCOMPRESSED_R8G8B8A8"]
    | UncompressedR32 [@cname "UNCOMPRESSED_R32"]
    | UncompressedR32G32B32 [@cname "UNCOMPRESSED_R32G32B32"]
    | UncompressedR32G32B32A32 [@cname "UNCOMPRESSED_R32G32B32A32"]
    | CompressedDxt1Rgb [@cname "COMPRESSED_DXT1_RGB"]
    | CompressedDxt1Rgba [@cname "COMPRESSED_DXT1_RGBA"]
    | CompressedDxt3Rgba [@cname "COMPRESSED_DXT3_RGBA"]
    | CompressedDxt5Rgba [@cname "COMPRESSED_DXT5_RGBA"]
    | CompressedEtc1Rgb [@cname "COMPRESSED_ETC1_RGB"]
    | CompressedEtc2Rgb [@cname "COMPRESSED_ETC2_RGB"]
    | CompressedEtc2EacRgba [@cname "COMPRESSED_ETC2_EAC_RGBA"]
    | CompressedPvrtRgb [@cname "COMPRESSED_PVRT_RGB"]
    | CompressedPvrtRgba [@cname "COMPRESSED_PVRT_RGBA"]
    | CompressedAstc4X4Rgba [@cname "COMPRESSED_ASTC_4x4_RGBA"]
    | CompressedAstc8X8Rgba [@cname "COMPRESSED_ASTC_8x8_RGBA"]
  [@@cname "PixelFormat"] [@@typedef]
end

module TextureFilterMode = struct
  type%c t =
    | Point [@cname "FILTER_POINT"]
    | Bilinear [@cname "FILTER_BILINEAR"]
    | Trilinear [@cname "FILTER_TRILINEAR"]
    | Anisotropic4X [@cname "FILTER_ANISOTROPIC_4X"]
    | Anisotropic8X [@cname "FILTER_ANISOTROPIC_8X"]
    | Anisotropic16X [@cname "FILTER_ANISOTROPIC_16X"]
  [@@cname "TextureFilterMode"] [@@typedef]
end

module CubemapLayout = struct
  type%c t =
    | AutoDetect [@cname "CUBEMAP_AUTO_DETECT"]
    | LineVertical [@cname "CUBEMAP_LINE_VERTICAL"]
    | LineHorizontal [@cname "CUBEMAP_LINE_HORIZONTAL"]
    | CrossThreeByFour [@cname "CUBEMAP_CROSS_THREE_BY_FOUR"]
    | CrossFourByThree [@cname "CUBEMAP_CROSS_FOUR_BY_THREE"]
    | Panorama [@cname "CUBEMAP_PANORAMA"]
  [@@cname "CubemapLayoutType"] [@@typedef]
end

module TextureWrapMode = struct
  type%c t =
    | Repeat [@cname "WRAP_REPEAT"]
    | Clamp [@cname "WRAP_CLAMP"]
    | MirrorRepeat [@cname "WRAP_MIRROR_REPEAT"]
    | MirrorClamp [@cname "WRAP_MIRROR_CLAMP"]
  [@@cname "TextureWrapMode"] [@@typedef]
end

module FontType = struct
  type%c t =
    | Default [@cname "FONT_DEFAULT"]
    | Bitmap [@cname "FONT_BITMAP"]
    | Sdf [@cname "FONT_SDF"]
  [@@cname "FontType"] [@@typedef]
end

module BlendMode = struct
  type%c t =
    | Alpha [@cname "BLEND_ALPHA"]
    | Additive [@cname "BLEND_ADDITIVE"]
    | Multiplied [@cname "BLEND_MULTIPLIED"]
  [@@cname "BlendMode"] [@@typedef]
end

module Gesture = struct
  type%c t =
    | None [@cname "GESTURE_NONE"]
    | Tap [@cname "GESTURE_TAP"]
    | Doubletap [@cname "GESTURE_DOUBLETAP"]
    | Hold [@cname "GESTURE_HOLD"]
    | Drag [@cname "GESTURE_DRAG"]
    | SwipeRight [@cname "GESTURE_SWIPE_RIGHT"]
    | SwipeLeft [@cname "GESTURE_SWIPE_LEFT"]
    | SwipeUp [@cname "GESTURE_SWIPE_UP"]
    | SwipeDown [@cname "GESTURE_SWIPE_DOWN"]
    | PinchIn [@cname "GESTURE_PINCH_IN"]
    | PinchOut [@cname "GESTURE_PINCH_OUT"]
  [@@cname "GestureType"] [@@typedef]
end

module CameraMode = struct
  type%c t =
    | Custom [@cname "CAMERA_CUSTOM"]
    | Free [@cname "CAMERA_FREE"]
    | Orbital [@cname "CAMERA_ORBITAL"]
    | FirstPerson [@cname "CAMERA_FIRST_PERSON"]
    | ThirdPerson [@cname "CAMERA_THIRD_PERSON"]
  [@@cname "CameraMode"] [@@typedef]
end

module Camera = struct
  type%c t =
    | Perspective [@cname "CAMERA_PERSPECTIVE"]
    | Orthographic [@cname "CAMERA_ORTHOGRAPHIC"]
  [@@cname "CameraType"] [@@typedef]
end

module NPatch = struct
  type%c t =
    | NinePatch [@cname "NPT_9PATCH"]
    | ThreePatchVertical [@cname "NPT_3PATCH_VERTICAL"]
    | ThreePatchHorizontal [@cname "NPT_3PATCH_HORIZONTAL"]
  [@@cname "NPatchType"] [@@typedef]
end
