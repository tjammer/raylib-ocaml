module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Raylib_types_generated

  let init_window =
    foreign "InitWindow" (int @-> int @-> string @-> returning void)

  let close_window = foreign "CloseWindow" (void @-> returning void)
  let window_should_close = foreign "WindowShouldClose" (void @-> returning bool)
  let is_window_ready = foreign "IsWindowReady" (void @-> returning bool)

  let is_window_fullscreen =
    foreign "IsWindowFullscreen" (void @-> returning bool)

  let is_window_hidden = foreign "IsWindowHidden" (void @-> returning bool)
  let is_window_minimized = foreign "IsWindowMinimized" (void @-> returning bool)
  let is_window_maximized = foreign "IsWindowMaximized" (void @-> returning bool)
  let is_window_focused = foreign "IsWindowFocused" (void @-> returning bool)
  let is_window_resized = foreign "IsWindowResized" (void @-> returning bool)

  let is_window_state =
    foreign "IsWindowState" (ConfigFlags.t @-> returning bool)

  let set_window_state =
    foreign "SetWindowState" (ConfigFlags.t @-> returning void)

  let clear_window_state =
    foreign "ClearWindowState" (ConfigFlags.t @-> returning void)

  let toggle_fullscreen = foreign "ToggleFullscreen" (void @-> returning void)

  let toggle_borderless_windowed =
    foreign "ToggleBorderlessWindowed" (void @-> returning void)

  let maximize_window = foreign "MaximizeWindow" (void @-> returning void)
  let minimize_window = foreign "MinimizeWindow" (void @-> returning void)
  let restore_window = foreign "RestoreWindow" (void @-> returning void)
  let set_window_icon = foreign "SetWindowIcon" (Image.t @-> returning void)

  let set_window_icons =
    foreign "SetWindowIcons" (ptr Image.t @-> int @-> returning void)

  let set_window_title = foreign "SetWindowTitle" (string @-> returning void)

  let set_window_position =
    foreign "SetWindowPosition" (int @-> int @-> returning void)

  let set_window_monitor = foreign "SetWindowMonitor" (int @-> returning void)

  let set_window_min_size =
    foreign "SetWindowMinSize" (int @-> int @-> returning void)

  let set_window_max_size =
    foreign "SetWindowMaxSize" (int @-> int @-> returning void)

  let set_window_size = foreign "SetWindowSize" (int @-> int @-> returning void)
  let set_window_opacity = foreign "SetWindowOpacity" (float @-> returning void)
  let set_window_focused = foreign "SetWindowFocused" (void @-> returning void)

  let get_window_handle =
    foreign "GetWindowHandle" (void @-> returning (ptr_opt void))

  let get_screen_width = foreign "GetScreenWidth" (void @-> returning int)
  let get_screen_height = foreign "GetScreenHeight" (void @-> returning int)
  let get_render_width = foreign "GetRenderWidth" (void @-> returning int)
  let get_render_height = foreign "GetRenderHeight" (void @-> returning int)
  let get_monitor_count = foreign "GetMonitorCount" (void @-> returning int)
  let get_current_monitor = foreign "GetCurrentMonitor" (void @-> returning int)

  let get_monitor_position =
    foreign "GetMonitorPosition" (int @-> returning Vector2.t)

  let get_monitor_width = foreign "GetMonitorWidth" (int @-> returning int)
  let get_monitor_height = foreign "GetMonitorHeight" (int @-> returning int)

  let get_monitor_physical_width =
    foreign "GetMonitorPhysicalWidth" (int @-> returning int)

  let get_monitor_physical_height =
    foreign "GetMonitorPhysicalHeight" (int @-> returning int)

  let get_monitor_refresh_rate =
    foreign "GetMonitorRefreshRate" (int @-> returning int)

  let get_window_position =
    foreign "GetWindowPosition" (void @-> returning Vector2.t)

  let get_window_scale_dpi =
    foreign "GetWindowScaleDPI" (void @-> returning Vector2.t)

  let get_monitor_name = foreign "GetMonitorName" (int @-> returning string)
  let set_clipboard_text = foreign "SetClipboardText" (string @-> returning void)

  let get_clipboard_text =
    foreign "GetClipboardText" (void @-> returning string_opt)

  let get_clipboard_image =
    foreign "GetClipboardImage" (void @-> returning Image.t)

  let enable_event_waiting =
    foreign "EnableEventWaiting" (void @-> returning void)

  let disable_event_waiting =
    foreign "DisableEventWaiting" (void @-> returning void)

  let show_cursor = foreign "ShowCursor" (void @-> returning void)
  let hide_cursor = foreign "HideCursor" (void @-> returning void)
  let is_cursor_hidden = foreign "IsCursorHidden" (void @-> returning bool)
  let enable_cursor = foreign "EnableCursor" (void @-> returning void)
  let disable_cursor = foreign "DisableCursor" (void @-> returning void)
  let is_cursor_on_screen = foreign "IsCursorOnScreen" (void @-> returning bool)
  let clear_background = foreign "ClearBackground" (Color.t @-> returning void)
  let begin_drawing = foreign "BeginDrawing" (void @-> returning void)
  let end_drawing = foreign "EndDrawing" (void @-> returning void)
  let begin_mode_2d = foreign "BeginMode2D" (Camera2D.t @-> returning void)
  let end_mode_2d = foreign "EndMode2D" (void @-> returning void)
  let begin_mode_3d = foreign "BeginMode3D" (Camera3D.t @-> returning void)
  let end_mode_3d = foreign "EndMode3D" (void @-> returning void)

  let begin_texture_mode =
    foreign "BeginTextureMode" (RenderTexture.t @-> returning void)

  let end_texture_mode = foreign "EndTextureMode" (void @-> returning void)
  let begin_shader_mode = foreign "BeginShaderMode" (Shader.t @-> returning void)
  let end_shader_mode = foreign "EndShaderMode" (void @-> returning void)

  let begin_blend_mode =
    foreign "BeginBlendMode" (BlendMode.t @-> returning void)

  let end_blend_mode = foreign "EndBlendMode" (void @-> returning void)

  let begin_scissor_mode =
    foreign "BeginScissorMode" (int @-> int @-> int @-> int @-> returning void)

  let end_scissor_mode = foreign "EndScissorMode" (void @-> returning void)

  let begin_vr_stereo_mode =
    foreign "BeginVrStereoMode" (VrStereoConfig.t @-> returning void)

  let end_vr_stereo_mode = foreign "EndVrStereoMode" (void @-> returning void)

  let load_vr_stereo_config =
    foreign "LoadVrStereoConfig" (VrDeviceInfo.t @-> returning VrStereoConfig.t)

  let unload_vr_stereo_config =
    foreign "UnloadVrStereoConfig" (VrStereoConfig.t @-> returning void)

  let load_shader =
    foreign "LoadShader" (string @-> string @-> returning Shader.t)

  let load_shader_from_memory =
    foreign "LoadShaderFromMemory" (string @-> string @-> returning Shader.t)

  let is_shader_valid = foreign "IsShaderValid" (Shader.t @-> returning bool)

  let get_shader_location =
    foreign "GetShaderLocation" (Shader.t @-> string @-> returning int)

  let get_shader_location_attrib =
    foreign "GetShaderLocationAttrib" (Shader.t @-> string @-> returning int)

  let set_shader_value =
    foreign "SetShaderValue"
      (Shader.t @-> int @-> ptr void @-> ShaderUniformDataType.t
     @-> returning void)

  let set_shader_value_v =
    foreign "SetShaderValueV"
      (Shader.t @-> int @-> ptr void @-> ShaderUniformDataType.t @-> int
     @-> returning void)

  let set_shader_value_matrix =
    foreign "SetShaderValueMatrix"
      (Shader.t @-> int @-> Matrix.t @-> returning void)

  let set_shader_value_texture =
    foreign "SetShaderValueTexture"
      (Shader.t @-> int @-> Texture.t @-> returning void)

  let unload_shader = foreign "UnloadShader" (Shader.t @-> returning void)

  let get_screen_to_world_ray =
    foreign "GetScreenToWorldRay" (Vector2.t @-> Camera3D.t @-> returning Ray.t)

  let get_screen_to_world_ray_ex =
    foreign "GetScreenToWorldRayEx"
      (Vector2.t @-> Camera3D.t @-> int @-> int @-> returning Ray.t)

  let get_world_to_screen =
    foreign "GetWorldToScreen" (Vector3.t @-> Camera3D.t @-> returning Vector2.t)

  let get_world_to_screen_ex =
    foreign "GetWorldToScreenEx"
      (Vector3.t @-> Camera3D.t @-> int @-> int @-> returning Vector2.t)

  let get_screen_to_world_2d =
    foreign "GetScreenToWorld2D"
      (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

  let get_world_to_screen_2d =
    foreign "GetWorldToScreen2D"
      (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

  let get_camera_matrix =
    foreign "GetCameraMatrix" (Camera3D.t @-> returning Matrix.t)

  let get_camera_matrix_2d =
    foreign "GetCameraMatrix2D" (Camera2D.t @-> returning Matrix.t)

  let set_target_fps = foreign "SetTargetFPS" (int @-> returning void)
  let get_frame_time = foreign "GetFrameTime" (void @-> returning float)
  let get_time = foreign "GetTime" (void @-> returning double)
  let get_fps = foreign "GetFPS" (void @-> returning int)
  let swap_screen_buffer = foreign "SwapScreenBuffer" (void @-> returning void)
  let poll_input_events = foreign "PollInputEvents" (void @-> returning void)
  let wait_time = foreign "WaitTime" (double @-> returning void)
  let set_random_seed = foreign "SetRandomSeed" (uint @-> returning void)
  let get_random_value = foreign "GetRandomValue" (int @-> int @-> returning int)

  let load_random_sequence =
    foreign "LoadRandomSequence" (int @-> int @-> int @-> returning (ptr int))

  let unload_random_sequence =
    foreign "UnloadRandomSequence" (ptr int @-> returning void)

  let take_screenshot = foreign "TakeScreenshot" (string @-> returning void)

  let set_config_flags =
    foreign "SetConfigFlags" (ConfigFlags.t @-> returning void)

  let open_url = foreign "OpenURL" (string @-> returning void)

  let set_trace_log_level =
    foreign "SetTraceLogLevel" (TraceLogLevel.t @-> returning void)

  let trace_log = foreign "TraceLog" (int @-> string @-> returning void)

  (* let set_trace_log_callback = *)
  (*   foreign "SetTraceLogCallback" (trace_log_callback @-> returning void) *)

  let mem_alloc = foreign "MemAlloc" (int @-> returning (ptr void))

  let mem_realloc =
    foreign "MemRealloc" (ptr void @-> int @-> returning (ptr void))

  let mem_free = foreign "MemFree" (ptr void @-> returning void)

  let _load_file_data =
    foreign "LoadFileData" (string @-> ptr int @-> returning (ptr char))

  let _unload_file_data = foreign "UnloadFileData" (ptr char @-> returning void)

  let _save_file_data =
    foreign "SaveFileData" (string @-> ptr void @-> int @-> returning bool)

  let _export_data_as_code =
    foreign "ExportDataAsCode" (string @-> int @-> string @-> returning bool)

  let _load_file_text = foreign "LoadFileText" (string @-> returning (ptr char))
  let _unload_file_text = foreign "UnloadFileText" (ptr char @-> returning void)

  let save_file_text =
    foreign "SaveFileText" (string @-> string @-> returning bool)

  let file_rename = foreign "FileRename" (string @-> string @-> returning int)
  let file_remove = foreign "FileRemove" (string @-> returning int)
  let file_copy = foreign "FileCopy" (string @-> string @-> returning int)
  let file_move = foreign "FileMove" (string @-> string @-> returning int)

  let file_text_replace =
    foreign "FileTextReplace" (string @-> string @-> string @-> returning int)

  let file_text_find_index =
    foreign "FileTextFindIndex" (string @-> string @-> returning int)

  let file_exists = foreign "FileExists" (string @-> returning bool)
  let directory_exists = foreign "DirectoryExists" (string @-> returning bool)

  let is_file_extension =
    foreign "IsFileExtension" (string @-> string @-> returning bool)

  let get_file_length = foreign "GetFileLength" (string @-> returning int)
  let get_file_mod_time = foreign "GetFileModTime" (string @-> returning long)

  let get_file_extension =
    foreign "GetFileExtension" (string @-> returning string)

  let get_file_name = foreign "GetFileName" (string @-> returning string)

  let get_file_name_without_ext =
    foreign "GetFileNameWithoutExt" (string @-> returning string)

  let get_directory_path =
    foreign "GetDirectoryPath" (string @-> returning string)

  let get_prev_directory_path =
    foreign "GetPrevDirectoryPath" (string @-> returning string)

  let get_working_directory =
    foreign "GetWorkingDirectory" (void @-> returning string)

  let get_application_directory =
    foreign "GetApplicationDirectory" (void @-> returning string)

  let make_directory = foreign "MakeDirectory" (string @-> returning int)
  let change_directory = foreign "ChangeDirectory" (string @-> returning bool)
  let is_path_file = foreign "IsPathFile" (string @-> returning bool)
  let is_file_name_valid = foreign "IsFileNameValid" (string @-> returning bool)

  let load_directory_files =
    foreign "LoadDirectoryFiles" (string @-> returning FilePathList.t)

  let load_directory_files_ex =
    foreign "LoadDirectoryFilesEx"
      (string @-> string @-> bool @-> returning FilePathList.t)

  let unload_directory_files =
    foreign "UnloadDirectoryFiles" (FilePathList.t @-> returning void)

  let is_file_dropped = foreign "IsFileDropped" (void @-> returning bool)

  let load_dropped_files =
    foreign "LoadDroppedFiles" (void @-> returning FilePathList.t)

  let unload_dropped_files =
    foreign "UnloadDroppedFiles" (FilePathList.t @-> returning void)

  let get_directory_file_count =
    foreign "GetDirectoryFileCount" (string @-> returning uint)

  let get_directory_file_count_ex =
    foreign "GetDirectoryFileCountEx"
      (string @-> string @-> bool @-> returning uint)

  let _compress_data =
    foreign "CompressData"
      (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  let _decompress_data =
    foreign "DecompressData"
      (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  (* let encode_data_base64 = *)
  (*   foreign "EncodeDataBase64" *)
  (*     (string @-> int @-> ptr int @-> returning (ptr char)) *)

  (* let decode_data_base64 = *)
  (*   foreign "DecodeDataBase64" (string @-> ptr int @-> returning (ptr uchar)) *)

  (* let compute_crc32 = *)
  (*   foreign "ComputeCRC32" (ptr uchar @-> int @-> returning uint) *)

  (* let compute_md5 = *)
  (*   foreign "ComputeMD5" (ptr uchar @-> int @-> returning (ptr uint)) *)

  (* let compute_sha1 = *)
  (*   foreign "ComputeSHA1" (ptr uchar @-> int @-> returning (ptr uint)) *)

  (* let compute_sha256 = *)
  (*   foreign "ComputeSHA256" (ptr uchar @-> int @-> returning (ptr uint)) *)

  let load_automation_event_list =
    foreign "LoadAutomationEventList"
      (string @-> returning AutomationEventList.t)

  let unload_automation_event_list =
    foreign "UnloadAutomationEventList"
      (AutomationEventList.t @-> returning void)

  let export_automation_event_list =
    foreign "ExportAutomationEventList"
      (AutomationEventList.t @-> string @-> returning bool)

  let set_automation_event_list =
    foreign "SetAutomationEventList"
      (ptr AutomationEventList.t @-> returning void)

  let set_automation_event_base_frame =
    foreign "SetAutomationEventBaseFrame" (int @-> returning void)

  let start_automation_event_recording =
    foreign "StartAutomationEventRecording" (void @-> returning void)

  let stop_automation_event_recording =
    foreign "StopAutomationEventRecording" (void @-> returning void)

  let play_automation_event =
    foreign "PlayAutomationEvent" (AutomationEvent.t @-> returning void)

  let is_key_pressed = foreign "IsKeyPressed" (Key.t @-> returning bool)

  let is_key_pressed_repeat =
    foreign "IsKeyPressedRepeat" (Key.t @-> returning bool)

  let is_key_down = foreign "IsKeyDown" (Key.t @-> returning bool)
  let is_key_released = foreign "IsKeyReleased" (Key.t @-> returning bool)
  let is_key_up = foreign "IsKeyUp" (Key.t @-> returning bool)
  let get_key_pressed = foreign "GetKeyPressed" (void @-> returning Key.t)
  let _get_char_pressed = foreign "GetCharPressed" (void @-> returning int)
  let get_key_name = foreign "GetKeyName" (Key.t @-> returning string)
  let set_exit_key = foreign "SetExitKey" (Key.t @-> returning void)

  let is_gamepad_available =
    foreign "IsGamepadAvailable" (int @-> returning bool)

  let get_gamepad_name = foreign "GetGamepadName" (int @-> returning string)

  let is_gamepad_button_pressed =
    foreign "IsGamepadButtonPressed" (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_down =
    foreign "IsGamepadButtonDown" (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_released =
    foreign "IsGamepadButtonReleased"
      (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_up =
    foreign "IsGamepadButtonUp" (int @-> GamepadButton.t @-> returning bool)

  let get_gamepad_button_pressed =
    foreign "GetGamepadButtonPressed" (void @-> returning GamepadButton.t)

  let get_gamepad_axis_count =
    foreign "GetGamepadAxisCount" (int @-> returning int)

  let get_gamepad_axis_movement =
    foreign "GetGamepadAxisMovement" (int @-> GamepadAxis.t @-> returning float)

  let set_gamepad_mappings =
    foreign "SetGamepadMappings" (string @-> returning int)

  let set_gamepad_vibration =
    foreign "SetGamepadVibration"
      (int @-> float @-> float @-> float @-> returning void)

  let is_mouse_button_pressed =
    foreign "IsMouseButtonPressed" (MouseButton.t @-> returning bool)

  let is_mouse_button_down =
    foreign "IsMouseButtonDown" (MouseButton.t @-> returning bool)

  let is_mouse_button_released =
    foreign "IsMouseButtonReleased" (MouseButton.t @-> returning bool)

  let is_mouse_button_up =
    foreign "IsMouseButtonUp" (MouseButton.t @-> returning bool)

  let get_mouse_x = foreign "GetMouseX" (void @-> returning int)
  let get_mouse_y = foreign "GetMouseY" (void @-> returning int)

  let get_mouse_position =
    foreign "GetMousePosition" (void @-> returning Vector2.t)

  let get_mouse_delta = foreign "GetMouseDelta" (void @-> returning Vector2.t)

  let set_mouse_position =
    foreign "SetMousePosition" (int @-> int @-> returning void)

  let set_mouse_offset =
    foreign "SetMouseOffset" (int @-> int @-> returning void)

  let set_mouse_scale =
    foreign "SetMouseScale" (float @-> float @-> returning void)

  let get_mouse_wheel_move =
    foreign "GetMouseWheelMove" (void @-> returning float)

  let get_mouse_wheel_move_v =
    foreign "GetMouseWheelMoveV" (void @-> returning Vector2.t)

  let set_mouse_cursor =
    foreign "SetMouseCursor" (MouseCursor.t @-> returning void)

  let get_touch_x = foreign "GetTouchX" (void @-> returning int)
  let get_touch_y = foreign "GetTouchY" (void @-> returning int)

  let get_touch_position =
    foreign "GetTouchPosition" (int @-> returning Vector2.t)

  let get_touch_point_id = foreign "GetTouchPointId" (int @-> returning int)

  let get_touch_point_count =
    foreign "GetTouchPointCount" (void @-> returning int)

  let set_gestures_enabled =
    foreign "SetGesturesEnabled" (Gesture.t @-> returning void)

  let is_gesture_detected =
    foreign "IsGestureDetected" (Gesture.t @-> returning bool)

  let get_gesture_detected =
    foreign "GetGestureDetected" (void @-> returning Gesture.t)

  let get_gesture_hold_duration =
    foreign "GetGestureHoldDuration" (void @-> returning float)

  let get_gesture_drag_vector =
    foreign "GetGestureDragVector" (void @-> returning Vector2.t)

  let get_gesture_drag_angle =
    foreign "GetGestureDragAngle" (void @-> returning float)

  let get_gesture_pinch_vector =
    foreign "GetGesturePinchVector" (void @-> returning Vector2.t)

  let get_gesture_pinch_angle =
    foreign "GetGesturePinchAngle" (void @-> returning float)

  let update_camera =
    foreign "UpdateCamera" (ptr Camera3D.t @-> CameraMode.t @-> returning void)

  let update_camera_pro =
    foreign "UpdateCameraPro"
      (ptr Camera3D.t @-> Vector3.t @-> Vector3.t @-> float @-> returning void)

  (*---------------------------------------------------------------------------------- *)
  (* Module Functions Definition - Utils math *)
  (*---------------------------------------------------------------------------------- *)
  (* Clamp float value *)
  let clamp = foreign "Clamp" (float @-> float @-> float @-> returning float)

  (* Calculate linear interpolation between two floats *)
  let lerp = foreign "Lerp" (float @-> float @-> float @-> returning float)

  module Math = struct
    module Vector2 = struct
      (*---------------------------------------------------------------------------------- *)
      (* Module Functions Definition - Vector2 math *)
      (*---------------------------------------------------------------------------------- *)
      (* Vector with components value 0.0f *)
      let zero =
        foreign "Vector2Zero"
          (void @-> returning Raylib_types_generated.Vector2.t)

      (* Vector with components value 1.0f *)
      let one =
        foreign "Vector2One"
          (void @-> returning Raylib_types_generated.Vector2.t)

      (* Add two vectors (v1 + v2) *)
      let add =
        foreign "Vector2Add"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      let add_value =
        foreign "Vector2AddValue"
          (Raylib_types_generated.Vector2.t @-> float
          @-> returning Raylib_types_generated.Vector2.t)

      (* Subtract two vectors (v1 - v2) *)
      let subtract =
        foreign "Vector2Subtract"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      let subtract_value =
        foreign "Vector2SubtractValue"
          (Raylib_types_generated.Vector2.t @-> float
          @-> returning Raylib_types_generated.Vector2.t)

      (* Calculate vector length *)
      let length =
        foreign "Vector2Length"
          (Raylib_types_generated.Vector2.t @-> returning float)

      let length_sqr =
        foreign "Vector2LengthSqr"
          (Raylib_types_generated.Vector2.t @-> returning float)

      (* Calculate two vectors dot product *)
      let dot_product =
        foreign "Vector2DotProduct"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
         @-> returning float)

      (* Calculate distance between two vectors *)
      let distance =
        foreign "Vector2Distance"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
         @-> returning float)

      (* Calculate angle from two vectors in X-axis *)
      let angle =
        foreign "Vector2Angle"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
         @-> returning float)

      (* Scale vector (multiply by value) *)
      let scale =
        foreign "Vector2Scale"
          (Raylib_types_generated.Vector2.t @-> float
          @-> returning Raylib_types_generated.Vector2.t)

      (* Multiply vector by vector *)
      let multiply =
        foreign "Vector2Multiply"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      (* Negate vector *)
      let negate =
        foreign "Vector2Negate"
          (Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      (* Divide vector by vector *)
      let divide =
        foreign "Vector2Divide"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      (* Normalize provided vector *)
      let normalize =
        foreign "Vector2Normalize"
          (Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      (* Calculate linear interpolation between two vectors *)
      let lerp =
        foreign "Vector2Lerp"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
         @-> float
          @-> returning Raylib_types_generated.Vector2.t)

      let reflect =
        foreign "Vector2Reflect"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
          @-> returning Raylib_types_generated.Vector2.t)

      (* Rotate Vector by float in Degrees. *)
      let rotate =
        foreign "Vector2Rotate"
          (Raylib_types_generated.Vector2.t @-> float
          @-> returning Raylib_types_generated.Vector2.t)

      let move_towards =
        foreign "Vector2MoveTowards"
          (Raylib_types_generated.Vector2.t @-> Raylib_types_generated.Vector2.t
         @-> float
          @-> returning Raylib_types_generated.Vector2.t)
    end

    module Vector3 = struct
      (*---------------------------------------------------------------------------------- *)
      (* Module Functions Definition - Vector3 math *)
      (*---------------------------------------------------------------------------------- *)
      (* Vector with components value 0.0f *)
      let zero =
        foreign "Vector3Zero"
          (void @-> returning Raylib_types_generated.Vector3.t)

      (* Vector with components value 1.0f *)
      let one =
        foreign "Vector3One"
          (void @-> returning Raylib_types_generated.Vector3.t)

      (* Add two vectors *)
      let add =
        foreign "Vector3Add"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      let add_value =
        foreign "Vector3AddValue"
          (Raylib_types_generated.Vector3.t @-> float
          @-> returning Raylib_types_generated.Vector3.t)

      (* Subtract two vectors *)
      let subtract =
        foreign "Vector3Subtract"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      let subtract_value =
        foreign "Vector3SubtractValue"
          (Raylib_types_generated.Vector3.t @-> float
          @-> returning Raylib_types_generated.Vector3.t)

      (* Multiply vector by scalar *)
      let scale =
        foreign "Vector3Scale"
          (Raylib_types_generated.Vector3.t @-> float
          @-> returning Raylib_types_generated.Vector3.t)

      (* Multiply vector by vector *)
      let multiply =
        foreign "Vector3Multiply"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Calculate two vectors cross product *)
      let cross_product =
        foreign "Vector3CrossProduct"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Calculate one vector perpendicular vector *)
      let perpendicular =
        foreign "Vector3Perpendicular"
          (Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Calculate vector length *)
      let length =
        foreign "Vector3Length"
          (Raylib_types_generated.Vector3.t @-> returning float)

      let length_sqr =
        foreign "Vector3LengthSqr"
          (Raylib_types_generated.Vector3.t @-> returning float)

      (* Calculate two vectors dot product *)
      let dot_product =
        foreign "Vector3DotProduct"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
         @-> returning float)

      (* Calculate distance between two vectors *)
      let distance =
        foreign "Vector3Distance"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
         @-> returning float)

      (* Negate provided vector (invert direction) *)
      let negate =
        foreign "Vector3Negate"
          (Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Divide vector by vector *)
      let divide =
        foreign "Vector3Divide"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Normalize provided vector *)
      let normalize =
        foreign "Vector3Normalize"
          (Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Orthonormalize provided vectors *)
      (* Makes vectors normalized and orthogonal to each other *)
      (* Gram-Schmidt function implementation *)
      let ortho_normalize =
        foreign "Vector3OrthoNormalize"
          (ptr Raylib_types_generated.Vector3.t
          @-> ptr Raylib_types_generated.Vector3.t
          @-> returning void)

      (* Transforms a Vector3 by a given Matrix *)
      let transform =
        foreign "Vector3Transform"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Transform a vector by quaternion rotation *)
      let rotate_by_quaternion =
        foreign "Vector3RotateByQuaternion"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Calculate linear interpolation between two vectors *)
      let lerp =
        foreign "Vector3Lerp"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
         @-> float
          @-> returning Raylib_types_generated.Vector3.t)

      (* Calculate reflected vector to normal *)
      let reflect =
        foreign "Vector3Reflect"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Return min value for each pair of components *)
      let min =
        foreign "Vector3Min"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Return max value for each pair of components *)
      let max =
        foreign "Vector3Max"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c) *)
      (* NOTE: Assumes P is on the plane of the triangle *)
      let barycenter =
        foreign "Vector3Barycenter"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
         @-> Raylib_types_generated.Vector3.t
         @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector3.t)

      let unproject =
        foreign "Vector3Unproject"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Matrix.t
         @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Vector3.t)
    end

    module Matrix = struct
      (*---------------------------------------------------------------------------------- *)
      (* Module Functions Definition - Matrix math *)
      (*---------------------------------------------------------------------------------- *)
      (* Compute matrix determinant *)
      let determinant =
        foreign "MatrixDeterminant"
          (Raylib_types_generated.Matrix.t @-> returning float)

      (* Returns the trace of the matrix (sum of the values along the diagonal) *)
      let trace =
        foreign "MatrixTrace"
          (Raylib_types_generated.Matrix.t @-> returning float)

      (* Transposes provided matrix *)
      let transpose =
        foreign "MatrixTranspose"
          (Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Invert provided matrix *)
      let invert =
        foreign "MatrixInvert"
          (Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns identity matrix *)
      let identity =
        foreign "MatrixIdentity"
          (void @-> returning Raylib_types_generated.Matrix.t)

      (* Add two matrices *)
      let add =
        foreign "MatrixAdd"
          (Raylib_types_generated.Matrix.t @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Subtract two matrices (left - right) *)
      let subtract =
        foreign "MatrixSubtract"
          (Raylib_types_generated.Matrix.t @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns translation matrix *)
      let translate =
        foreign "MatrixTranslate"
          (float @-> float @-> float
          @-> returning Raylib_types_generated.Matrix.t)

      (* Create rotation matrix from axis and angle *)
      (* NOTE: Angle should be provided in radians *)
      let rotate =
        foreign "MatrixRotate"
          (Raylib_types_generated.Vector3.t @-> float
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns xyz-rotation matrix (angles in radians) *)
      let rotate_xyz =
        foreign "MatrixRotateXYZ"
          (Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Matrix.t)

      let rotate_zyx =
        foreign "MatrixRotateZYX"
          (Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns x-rotation matrix (angle in radians) *)
      let rotate_x =
        foreign "MatrixRotateX"
          (float @-> returning Raylib_types_generated.Matrix.t)

      (* Returns y-rotation matrix (angle in radians) *)
      let rotate_y =
        foreign "MatrixRotateY"
          (float @-> returning Raylib_types_generated.Matrix.t)

      (* Returns z-rotation matrix (angle in radians) *)
      let rotate_z =
        foreign "MatrixRotateZ"
          (float @-> returning Raylib_types_generated.Matrix.t)

      (* Returns scaling matrix *)
      let scale =
        foreign "MatrixScale"
          (float @-> float @-> float
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns two matrix multiplication *)
      (* NOTE: When multiplying matrices... the order matters! *)
      let multiply =
        foreign "MatrixMultiply"
          (Raylib_types_generated.Matrix.t @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns perspective projection matrix *)
      let frustum =
        foreign "MatrixFrustum"
          (double @-> double @-> double @-> double @-> double @-> double
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns perspective projection matrix *)
      (* NOTE: Angle should be provided in radians *)
      let perspective =
        foreign "MatrixPerspective"
          (double @-> double @-> double @-> double
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns orthographic projection matrix *)
      let ortho =
        foreign "MatrixOrtho"
          (double @-> double @-> double @-> double @-> double @-> double
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns camera look-at matrix (view matrix) *)
      let look_at =
        foreign "MatrixLookAt"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
         @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns float array of matrix data *)
      (* let to_float_v = foreign "MatrixToFloatV" (Raylib_types_generated.Matrix.t @-> returning float16) *)
    end

    module Vector4 = struct
      (*---------------------------------------------------------------------------------- *)
      (* Module Functions Definition - Quaternion math *)
      (*---------------------------------------------------------------------------------- *)
      (* Returns identity quaternion *)
      let identity =
        foreign "QuaternionIdentity"
          (void @-> returning Raylib_types_generated.Vector4.t)

      let add =
        foreign "QuaternionAdd"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      let add_value =
        foreign "QuaternionAddValue"
          (Raylib_types_generated.Vector4.t @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      let subtract =
        foreign "QuaternionSubtract"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      let subtract_value =
        foreign "QuaternionSubtractValue"
          (Raylib_types_generated.Vector4.t @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Computes the length of a quaternion *)
      let length =
        foreign "QuaternionLength"
          (Raylib_types_generated.Vector4.t @-> returning float)

      (* Normalize provided quaternion *)
      let normalize =
        foreign "QuaternionNormalize"
          (Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      (* Invert provided quaternion *)
      let invert =
        foreign "QuaternionInvert"
          (Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      (* Calculate two quaternion multiplication *)
      let multiply =
        foreign "QuaternionMultiply"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      let scale =
        foreign "QuaternionScale"
          (Raylib_types_generated.Vector4.t @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      let divide =
        foreign "QuaternionDivide"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector4.t)

      (* Calculate linear interpolation between two quaternions *)
      let lerp =
        foreign "QuaternionLerp"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
         @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Calculate slerp-optimized interpolation between two quaternions *)
      let nlerp =
        foreign "QuaternionNlerp"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
         @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Calculates spherical linear interpolation between two quaternions *)
      let slerp =
        foreign "QuaternionSlerp"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Vector4.t
         @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Calculate quaternion based on the rotation from one vector to another *)
      let from_vector3_to_vector3 =
        foreign "QuaternionFromVector3ToVector3"
          (Raylib_types_generated.Vector3.t @-> Raylib_types_generated.Vector3.t
          @-> returning Raylib_types_generated.Vector4.t)

      (* Returns a quaternion for a given rotation matrix *)
      let from_matrix =
        foreign "QuaternionFromMatrix"
          (Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Vector4.t)

      (* Returns a matrix for a given quaternion *)
      let to_matrix =
        foreign "QuaternionToMatrix"
          (Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Matrix.t)

      (* Returns rotation quaternion for an angle and axis *)
      (* NOTE: angle must be provided in radians *)
      let from_axis_angle =
        foreign "QuaternionFromAxisAngle"
          (Raylib_types_generated.Vector3.t @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Returns the rotation angle and axis for a given quaternion *)
      let to_axis_angle =
        foreign "QuaternionToAxisAngle"
          (Raylib_types_generated.Vector4.t
          @-> ptr Raylib_types_generated.Vector3.t
          @-> ptr float @-> returning void)

      (* Returns he quaternion equivalent to Euler angles *)
      let from_euler =
        foreign "QuaternionFromEuler"
          (float @-> float @-> float
          @-> returning Raylib_types_generated.Vector4.t)

      (* Return the Euler angles equivalent to quaternion (roll, pitch, yaw) *)
      (* NOTE: Angles are returned in a Vector3 struct in degrees *)
      let to_euler =
        foreign "QuaternionToEuler"
          (Raylib_types_generated.Vector4.t
          @-> returning Raylib_types_generated.Vector3.t)

      (* Transform a quaternion given a transformation matrix *)
      let transform =
        foreign "QuaternionTransform"
          (Raylib_types_generated.Vector4.t @-> Raylib_types_generated.Matrix.t
          @-> returning Raylib_types_generated.Vector4.t)
    end
  end
end
