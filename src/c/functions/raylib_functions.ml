module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Raylib_fixed_types

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
    foreign "SetWindowState" (ConfigFlags.t_bitmask @-> returning void)

  let clear_window_state =
    foreign "ClearWindowState" (ConfigFlags.t_bitmask @-> returning void)

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

  let is_shader_ready = foreign "IsShaderReady" (Shader.t @-> returning bool)

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

  let get_mouse_ray =
    foreign "GetMouseRay" (Vector2.t @-> Camera3D.t @-> returning Ray.t)

  let get_camera_matrix =
    foreign "GetCameraMatrix" (Camera3D.t @-> returning Matrix.t)

  let get_camera_matrix_2d =
    foreign "GetCameraMatrix2D" (Camera2D.t @-> returning Matrix.t)

  let get_world_to_screen =
    foreign "GetWorldToScreen" (Vector3.t @-> Camera3D.t @-> returning Vector2.t)

  let get_screen_to_world_2d =
    foreign "GetScreenToWorld2D"
      (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

  let get_world_to_screen_ex =
    foreign "GetWorldToScreenEx"
      (Vector3.t @-> Camera3D.t @-> int @-> int @-> returning Vector2.t)

  let get_world_to_screen_2d =
    foreign "GetWorldToScreen2D"
      (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

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
    foreign "SetConfigFlags" (ConfigFlags.t_bitmask @-> returning void)

  let open_url = foreign "OpenURL" (string @-> returning void)
  let trace_log = foreign "TraceLog" (int @-> string @-> returning void)

  let set_trace_log_level =
    foreign "SetTraceLogLevel" (TraceLogLevel.t @-> returning void)

  let mem_alloc = foreign "MemAlloc" (int @-> returning (ptr void))

  let mem_realloc =
    foreign "MemRealloc" (ptr void @-> int @-> returning (ptr void))

  let mem_free = foreign "MemFree" (ptr void @-> returning void)

  (* let set_trace_log_callback = *)
  (*   foreign "SetTraceLogCallback" (trace_log_callback @-> returning void) *)

  (* let set_load_file_data_callback = *)
  (*   foreign "SetLoadFileDataCallback" (load_file_data_callback @-> returning void) *)

  (* let set_save_file_data_callback = *)
  (*   foreign "SetSaveFileDataCallback" (save_file_data_callback @-> returning void) *)

  (* let set_load_file_text_callback = *)
  (*   foreign "SetLoadFileTextCallback" (load_file_text_callback @-> returning void) *)

  (* let set_save_file_text_callback = *)
  (*   foreign "SetSaveFileTextCallback" (save_file_text_callback @-> returning void) *)

  let _load_file_data =
    foreign "LoadFileData" (string @-> ptr uint @-> returning (ptr uchar))

  let unload_file_data = foreign "UnloadFileData" (string @-> returning void)

  let _save_file_data =
    foreign "SaveFileData" (string @-> ptr void @-> int @-> returning bool)

  let _export_data_as_code =
    foreign "ExportDataAsCode" (string @-> int @-> string @-> returning bool)

  let load_file_text = foreign "LoadFileText" (string @-> returning string)
  let unload_file_text = foreign "UnloadFileText" (string @-> returning void)

  let save_file_text =
    foreign "SaveFileText" (string @-> string @-> returning bool)

  let file_exists = foreign "FileExists" (string @-> returning bool)
  let directory_exists = foreign "DirectoryExists" (string @-> returning bool)

  let is_file_extension =
    foreign "IsFileExtension" (string @-> string @-> returning bool)

  let get_file_length = foreign "GetFileLength" (string @-> returning int)

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

  let change_directory = foreign "ChangeDirectory" (string @-> returning bool)
  let is_path_file = foreign "IsPathFile" (string @-> returning bool)

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

  let get_file_mod_time = foreign "GetFileModTime" (string @-> returning long)

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

  let load_automation_event_list =
    foreign "LoadAutomationEventList"
      (string @-> returning AutomationEventList.t)

  let unload_automation_event_list =
    foreign "UnloadAutomationEventList"
      (ptr AutomationEventList.t @-> returning void)

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
    foreign "SetGesturesEnabled" (Gesture.t_bitmask @-> returning void)

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

  let set_shapes_texture =
    foreign "SetShapesTexture" (Texture.t @-> Rectangle.t @-> returning void)

  let draw_pixel =
    foreign "DrawPixel" (int @-> int @-> Color.t @-> returning void)

  let draw_pixel_v =
    foreign "DrawPixelV" (Vector2.t @-> Color.t @-> returning void)

  let draw_line =
    foreign "DrawLine"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_line_v =
    foreign "DrawLineV" (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_line_ex =
    foreign "DrawLineEx"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_strip =
    foreign "DrawLineStrip"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_line_bezier =
    foreign "DrawLineBezier"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_circle =
    foreign "DrawCircle" (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_circle_sector =
    foreign "DrawCircleSector"
      (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_circle_sector_lines =
    foreign "DrawCircleSectorLines"
      (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_circle_gradient =
    foreign "DrawCircleGradient"
      (int @-> int @-> float @-> Color.t @-> Color.t @-> returning void)

  let draw_circle_v =
    foreign "DrawCircleV" (Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_circle_lines =
    foreign "DrawCircleLines"
      (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_circle_lines_v =
    foreign "DrawCircleLinesV"
      (Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_ellipse =
    foreign "DrawEllipse"
      (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ellipse_lines =
    foreign "DrawEllipseLines"
      (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ring =
    foreign "DrawRing"
      (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_ring_lines =
    foreign "DrawRingLines"
      (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_rectangle =
    foreign "DrawRectangle"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_v =
    foreign "DrawRectangleV"
      (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_rectangle_rec =
    foreign "DrawRectangleRec" (Rectangle.t @-> Color.t @-> returning void)

  let draw_rectangle_pro =
    foreign "DrawRectanglePro"
      (Rectangle.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_rectangle_gradient_v =
    foreign "DrawRectangleGradientV"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_h =
    foreign "DrawRectangleGradientH"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_ex =
    foreign "DrawRectangleGradientEx"
      (Rectangle.t @-> Color.t @-> Color.t @-> Color.t @-> Color.t
     @-> returning void)

  let draw_rectangle_lines =
    foreign "DrawRectangleLines"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_lines_ex =
    foreign "DrawRectangleLinesEx"
      (Rectangle.t @-> float @-> Color.t @-> returning void)

  let draw_rectangle_rounded =
    foreign "DrawRectangleRounded"
      (Rectangle.t @-> float @-> int @-> Color.t @-> returning void)

  let draw_rectangle_rounded_lines =
    foreign "DrawRectangleRoundedLines"
      (Rectangle.t @-> float @-> int @-> float @-> Color.t @-> returning void)

  let draw_triangle =
    foreign "DrawTriangle"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_lines =
    foreign "DrawTriangleLines"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_fan =
    foreign "DrawTriangleFan"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_triangle_strip =
    foreign "DrawTriangleStrip"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_poly =
    foreign "DrawPoly"
      (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_poly_lines =
    foreign "DrawPolyLines"
      (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_poly_lines_ex =
    foreign "DrawPolyLinesEx"
      (Vector2.t @-> int @-> float @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_spline_linear =
    foreign "DrawSplineLinear"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_basis =
    foreign "DrawSplineBasis"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_catmull_rom =
    foreign "DrawSplineCatmullRom"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_bezier_quadratic =
    foreign "DrawSplineBezierQuadratic"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_bezier_cubic =
    foreign "DrawSplineBezierCubic"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_segment_linear =
    foreign "DrawSplineSegmentLinear"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_spline_segment_basis =
    foreign "DrawSplineSegmentBasis"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_catmull_rom =
    foreign "DrawSplineSegmentCatmullRom"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_bezier_quadratic =
    foreign "DrawSplineSegmentBezierQuadratic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_bezier_cubic =
    foreign "DrawSplineSegmentBezierCubic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let get_spline_point_linear =
    foreign "GetSplinePointLinear"
      (Vector2.t @-> Vector2.t @-> float @-> returning Vector2.t)

  let get_spline_point_basis =
    foreign "GetSplinePointBasis"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let get_spline_point_catmull_rom =
    foreign "GetSplinePointCatmullRom"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let get_spline_point_bezier_quad =
    foreign "GetSplinePointBezierQuad"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> returning Vector2.t)

  let get_spline_point_bezier_cubic =
    foreign "GetSplinePointBezierCubic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let check_collision_recs =
    foreign "CheckCollisionRecs" (Rectangle.t @-> Rectangle.t @-> returning bool)

  let check_collision_circles =
    foreign "CheckCollisionCircles"
      (Vector2.t @-> float @-> Vector2.t @-> float @-> returning bool)

  let check_collision_circle_rec =
    foreign "CheckCollisionCircleRec"
      (Vector2.t @-> float @-> Rectangle.t @-> returning bool)

  let check_collision_point_rec =
    foreign "CheckCollisionPointRec"
      (Vector2.t @-> Rectangle.t @-> returning bool)

  let check_collision_point_circle =
    foreign "CheckCollisionPointCircle"
      (Vector2.t @-> Vector2.t @-> float @-> returning bool)

  let check_collision_point_triangle =
    foreign "CheckCollisionPointTriangle"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> returning bool)

  let check_collision_point_poly =
    foreign "CheckCollisionPointPoly"
      (Vector2.t @-> ptr Vector2.t @-> int @-> returning bool)

  let check_collision_lines =
    foreign "CheckCollisionLines"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> ptr Vector2.t
     @-> returning bool)

  let check_collision_point_line =
    foreign "CheckCollisionPointLine"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> int @-> returning bool)

  let get_collision_rec =
    foreign "GetCollisionRec"
      (Rectangle.t @-> Rectangle.t @-> returning Rectangle.t)

  let load_image = foreign "LoadImage" (string @-> returning Image.t)

  let load_image_raw =
    foreign "LoadImageRaw"
      (string @-> int @-> int @-> PixelFormat.t @-> int @-> returning Image.t)

  let load_image_svg =
    foreign "LoadImageSvg" (string @-> int @-> int @-> returning Image.t)

  let load_image_anim =
    foreign "LoadImageAnim" (string @-> ptr int @-> returning Image.t)

  let load_image_from_memory =
    foreign "LoadImageFromMemory"
      (string @-> string @-> int @-> returning Image.t)

  let load_image_from_texture =
    foreign "LoadImageFromTexture" (Texture.t @-> returning Image.t)

  let load_image_from_screen =
    foreign "LoadImageFromScreen" (void @-> returning Image.t)

  let is_image_ready = foreign "IsImageReady" (Image.t @-> returning bool)
  let unload_image = foreign "UnloadImage" (Image.t @-> returning void)

  let export_image =
    foreign "ExportImage" (Image.t @-> string @-> returning bool)

  let export_image_to_memory =
    foreign "ExportImageToMemory"
      (Image.t @-> string @-> ptr int @-> returning string)

  let export_image_as_code =
    foreign "ExportImageAsCode" (Image.t @-> string @-> returning bool)

  let gen_image_color =
    foreign "GenImageColor" (int @-> int @-> Color.t @-> returning Image.t)

  let gen_image_gradient_linear =
    foreign "GenImageGradientLinear"
      (int @-> int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_radial =
    foreign "GenImageGradientRadial"
      (int @-> int @-> float @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_square =
    foreign "GenImageGradientSquare"
      (int @-> int @-> float @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_checked =
    foreign "GenImageChecked"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_white_noise =
    foreign "GenImageWhiteNoise" (int @-> int @-> float @-> returning Image.t)

  let gen_image_perlin_noise =
    foreign "GenImagePerlinNoise"
      (int @-> int @-> int @-> int @-> float @-> returning Image.t)

  let gen_image_cellular =
    foreign "GenImageCellular" (int @-> int @-> int @-> returning Image.t)

  let gen_image_text =
    foreign "GenImageText" (int @-> int @-> string @-> returning Image.t)

  let image_copy = foreign "ImageCopy" (Image.t @-> returning Image.t)

  let image_from_image =
    foreign "ImageFromImage" (Image.t @-> Rectangle.t @-> returning Image.t)

  let image_text =
    foreign "ImageText" (string @-> int @-> Color.t @-> returning Image.t)

  let image_text_ex =
    foreign "ImageTextEx"
      (Font.t @-> string @-> float @-> float @-> Color.t @-> returning Image.t)

  let image_format =
    foreign "ImageFormat" (ptr Image.t @-> int @-> returning void)

  let image_to_pot =
    foreign "ImageToPOT" (ptr Image.t @-> Color.t @-> returning void)

  let image_crop =
    foreign "ImageCrop" (ptr Image.t @-> Rectangle.t @-> returning void)

  let image_alpha_crop =
    foreign "ImageAlphaCrop" (ptr Image.t @-> float @-> returning void)

  let image_alpha_clear =
    foreign "ImageAlphaClear"
      (ptr Image.t @-> Color.t @-> float @-> returning void)

  let image_alpha_mask =
    foreign "ImageAlphaMask" (ptr Image.t @-> Image.t @-> returning void)

  let image_alpha_premultiply =
    foreign "ImageAlphaPremultiply" (ptr Image.t @-> returning void)

  let image_blur_gaussian =
    foreign "ImageBlurGaussian" (ptr Image.t @-> int @-> returning void)

  let image_resize =
    foreign "ImageResize" (ptr Image.t @-> int @-> int @-> returning void)

  let image_resize_nn =
    foreign "ImageResizeNN" (ptr Image.t @-> int @-> int @-> returning void)

  let image_resize_canvas =
    foreign "ImageResizeCanvas"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_mipmaps = foreign "ImageMipmaps" (ptr Image.t @-> returning void)

  let image_dither =
    foreign "ImageDither"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> returning void)

  let image_flip_vertical =
    foreign "ImageFlipVertical" (ptr Image.t @-> returning void)

  let image_flip_horizontal =
    foreign "ImageFlipHorizontal" (ptr Image.t @-> returning void)

  let image_rotate =
    foreign "ImageRotate" (ptr Image.t @-> int @-> returning void)

  let image_rotate_cw = foreign "ImageRotateCW" (ptr Image.t @-> returning void)

  let image_rotate_ccw =
    foreign "ImageRotateCCW" (ptr Image.t @-> returning void)

  let image_color_tint =
    foreign "ImageColorTint" (ptr Image.t @-> Color.t @-> returning void)

  let image_color_invert =
    foreign "ImageColorInvert" (ptr Image.t @-> returning void)

  let image_color_grayscale =
    foreign "ImageColorGrayscale" (ptr Image.t @-> returning void)

  let image_color_contrast =
    foreign "ImageColorContrast" (ptr Image.t @-> float @-> returning void)

  let image_color_brightness =
    foreign "ImageColorBrightness" (ptr Image.t @-> int @-> returning void)

  let image_color_replace =
    foreign "ImageColorReplace"
      (ptr Image.t @-> Color.t @-> Color.t @-> returning void)

  let load_image_colors =
    foreign "LoadImageColors" (Image.t @-> returning (ptr Color.t))

  let load_image_palette =
    foreign "LoadImagePalette"
      (Image.t @-> int @-> ptr int @-> returning (ptr Color.t))

  let unload_image_colors =
    foreign "UnloadImageColors" (ptr Color.t @-> returning void)

  let unload_image_palette =
    foreign "UnloadImagePalette" (ptr Color.t @-> returning void)

  let get_image_alpha_border =
    foreign "GetImageAlphaBorder" (Image.t @-> float @-> returning Rectangle.t)

  let get_image_color =
    foreign "GetImageColor" (Image.t @-> int @-> int @-> returning Color.t)

  let image_clear_background =
    foreign "ImageClearBackground" (ptr Image.t @-> Color.t @-> returning void)

  let image_draw_pixel =
    foreign "ImageDrawPixel"
      (ptr Image.t @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_pixel_v =
    foreign "ImageDrawPixelV"
      (ptr Image.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_line =
    foreign "ImageDrawLine"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_line_v =
    foreign "ImageDrawLineV"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_circle =
    foreign "ImageDrawCircle"
      (ptr Image.t @-> int @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_circle_v =
    foreign "ImageDrawCircleV"
      (ptr Image.t @-> Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw_circle_lines =
    foreign "ImageDrawCircleLines"
      (ptr Image.t @-> int @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_circle_lines_v =
    foreign "ImageDrawCircleLinesV"
      (ptr Image.t @-> Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw_rectangle =
    foreign "ImageDrawRectangle"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_rectangle_v =
    foreign "ImageDrawRectangleV"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_rectangle_rec =
    foreign "ImageDrawRectangleRec"
      (ptr Image.t @-> Rectangle.t @-> Color.t @-> returning void)

  let image_draw_rectangle_lines =
    foreign "ImageDrawRectangleLines"
      (ptr Image.t @-> Rectangle.t @-> int @-> Color.t @-> returning void)

  let image_draw =
    foreign "ImageDraw"
      (ptr Image.t @-> Image.t @-> Rectangle.t @-> Rectangle.t @-> Color.t
     @-> returning void)

  let image_draw_text =
    foreign "ImageDrawText"
      (ptr Image.t @-> string @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_text_ex =
    foreign "ImageDrawTextEx"
      (ptr Image.t @-> Font.t @-> string @-> Vector2.t @-> float @-> float
     @-> Color.t @-> returning void)

  let load_texture = foreign "LoadTexture" (string @-> returning Texture.t)

  let load_texture_from_image =
    foreign "LoadTextureFromImage" (Image.t @-> returning Texture.t)

  let load_texture_cubemap =
    foreign "LoadTextureCubemap" (Image.t @-> int @-> returning Texture.t)

  let load_render_texture =
    foreign "LoadRenderTexture" (int @-> int @-> returning RenderTexture.t)

  let is_texture_ready = foreign "IsTextureReady" (Texture.t @-> returning bool)
  let unload_texture = foreign "UnloadTexture" (Texture.t @-> returning void)

  let is_render_texture_ready =
    foreign "IsRenderTextureReady" (RenderTexture.t @-> returning bool)

  let unload_render_texture =
    foreign "UnloadRenderTexture" (RenderTexture.t @-> returning void)

  let update_texture =
    foreign "UpdateTexture" (Texture.t @-> ptr void @-> returning void)

  let update_texture_rec =
    foreign "UpdateTextureRec"
      (Texture.t @-> Rectangle.t @-> ptr void @-> returning void)

  let gen_texture_mipmaps =
    foreign "GenTextureMipmaps" (ptr Texture.t @-> returning void)

  let set_texture_filter =
    foreign "SetTextureFilter" (Texture.t @-> TextureFilter.t @-> returning void)

  let set_texture_wrap =
    foreign "SetTextureWrap" (Texture.t @-> TextureWrap.t @-> returning void)

  let draw_texture =
    foreign "DrawTexture"
      (Texture.t @-> int @-> int @-> Color.t @-> returning void)

  let draw_texture_v =
    foreign "DrawTextureV"
      (Texture.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_ex =
    foreign "DrawTextureEx"
      (Texture.t @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_texture_rec =
    foreign "DrawTextureRec"
      (Texture.t @-> Rectangle.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_pro =
    foreign "DrawTexturePro"
      (Texture.t @-> Rectangle.t @-> Rectangle.t @-> Vector2.t @-> float
     @-> Color.t @-> returning void)

  let draw_texture_npatch =
    foreign "DrawTextureNPatch"
      (Texture.t @-> NPatchInfo.t @-> Rectangle.t @-> Vector2.t @-> float
     @-> Color.t @-> returning void)

  let fade = foreign "Fade" (Color.t @-> float @-> returning Color.t)
  let color_to_int = foreign "ColorToInt" (Color.t @-> returning int)

  let color_normalize =
    foreign "ColorNormalize" (Color.t @-> returning Vector4.t)

  let color_from_normalized =
    foreign "ColorFromNormalized" (Vector4.t @-> returning Color.t)

  let color_to_hsv = foreign "ColorToHSV" (Color.t @-> returning Vector3.t)

  let color_from_hsv =
    foreign "ColorFromHSV" (float @-> float @-> float @-> returning Color.t)

  let color_tint =
    foreign "ColorTint" (Color.t @-> Color.t @-> returning Color.t)

  let color_brightness =
    foreign "ColorBrightness" (Color.t @-> float @-> returning Color.t)

  let color_contrast =
    foreign "ColorContrast" (Color.t @-> float @-> returning Color.t)

  let color_alpha =
    foreign "ColorAlpha" (Color.t @-> float @-> returning Color.t)

  let color_alpha_blend =
    foreign "ColorAlphaBlend"
      (Color.t @-> Color.t @-> Color.t @-> returning Color.t)

  let get_color = foreign "GetColor" (int @-> returning Color.t)

  let get_pixel_color =
    foreign "GetPixelColor" (ptr void @-> PixelFormat.t @-> returning Color.t)

  let set_pixel_color =
    foreign "SetPixelColor"
      (ptr void @-> Color.t @-> PixelFormat.t @-> returning void)

  let get_pixel_data_size =
    foreign "GetPixelDataSize" (int @-> int @-> PixelFormat.t @-> returning int)

  let get_font_default = foreign "GetFontDefault" (void @-> returning Font.t)
  let load_font = foreign "LoadFont" (string @-> returning Font.t)

  let _load_font_ex =
    foreign "LoadFontEx"
      (string @-> int @-> ptr_opt int @-> int @-> returning Font.t)

  let load_font_from_image =
    foreign "LoadFontFromImage"
      (Image.t @-> Color.t @-> int @-> returning Font.t)

  let load_font_from_memory =
    foreign "LoadFontFromMemory"
      (string @-> string @-> int @-> int @-> ptr int @-> int
     @-> returning Font.t)

  let is_font_ready = foreign "IsFontReady" (Font.t @-> returning bool)

  let load_font_data =
    foreign "LoadFontData"
      (string @-> int @-> int @-> ptr int @-> int @-> int
      @-> returning (ptr GlyphInfo.t))

  let gen_image_font_atlas =
    foreign "GenImageFontAtlas"
      (ptr GlyphInfo.t
      @-> ptr (ptr Rectangle.t)
      @-> int @-> int @-> int @-> int @-> returning Image.t)

  let unload_font_data =
    foreign "UnloadFontData" (ptr GlyphInfo.t @-> int @-> returning void)

  let unload_font = foreign "UnloadFont" (Font.t @-> returning void)

  let export_font_as_code =
    foreign "ExportFontAsCode" (Font.t @-> string @-> returning bool)

  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_text_ex =
    foreign "DrawTextEx"
      (Font.t @-> string @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_text_pro =
    foreign "DrawTextPro"
      (Font.t @-> string @-> Vector2.t @-> Vector2.t @-> float @-> float
     @-> float @-> Color.t @-> returning void)

  let draw_text_codepoint =
    foreign "DrawTextCodepoint"
      (Font.t @-> int @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let _draw_text_codepoints =
    foreign "DrawTextCodepoints"
      (Font.t @-> ptr int @-> int @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let set_text_line_spacing =
    foreign "SetTextLineSpacing" (int @-> returning void)

  let measure_text = foreign "MeasureText" (string @-> int @-> returning int)

  let measure_text_ex =
    foreign "MeasureTextEx"
      (Font.t @-> string @-> float @-> float @-> returning Vector2.t)

  let get_glyph_index =
    foreign "GetGlyphIndex" (Font.t @-> int @-> returning int)

  let get_glyph_info =
    foreign "GetGlyphInfo" (Font.t @-> int @-> returning GlyphInfo.t)

  let get_glyph_atlas_rec =
    foreign "GetGlyphAtlasRec" (Font.t @-> int @-> returning Rectangle.t)

  let load_utf8 = foreign "LoadUTF8" (ptr int @-> int @-> returning (ptr char))
  let unload_utf8 = foreign "UnloadUTF8" (ptr char @-> returning void)

  let load_codepoints =
    foreign "LoadCodepoints" (string @-> ptr int @-> returning (ptr int))

  let unload_codepoints = foreign "UnloadCodepoints" (ptr int @-> returning void)

  let get_codepoint_count =
    foreign "GetCodepointCount" (string @-> returning int)

  let get_codepoint =
    foreign "GetCodepoint" (string @-> ptr int @-> returning int)

  let get_codepoint_next =
    foreign "GetCodepointNext" (string @-> ptr int @-> returning int)

  let get_codepoint_previous =
    foreign "GetCodepointPrevious" (string @-> ptr int @-> returning int)

  let codepoint_to_utf8 =
    foreign "CodepointToUTF8" (int @-> ptr int @-> returning string)

  let text_copy = foreign "TextCopy" (string @-> string @-> returning int)

  let text_is_equal =
    foreign "TextIsEqual" (string @-> string @-> returning bool)

  let text_length = foreign "TextLength" (string @-> returning int)

  (* let text_format = *)
  (*   foreign "TextFormat" (string @-> ... @-> returning string) *)

  let text_subtext =
    foreign "TextSubtext" (string @-> int @-> int @-> returning string)

  let text_replace =
    foreign "TextReplace" (string @-> string @-> string @-> returning string)

  let text_insert =
    foreign "TextInsert" (string @-> string @-> int @-> returning string)

  (* let text_join = *)
  (*   foreign "TextJoin" (string) @-> int @-> string @-> returning string) *)

  (* let text_split = *)
  (*   foreign "TextSplit" (string @-> char @-> (ptr int) @-> returning string)) *)

  let text_append =
    foreign "TextAppend" (string @-> string @-> ptr int @-> returning void)

  let text_find_index =
    foreign "TextFindIndex" (string @-> string @-> returning int)

  let text_to_upper = foreign "TextToUpper" (string @-> returning string)
  let text_to_lower = foreign "TextToLower" (string @-> returning string)
  let text_to_pascal = foreign "TextToPascal" (string @-> returning string)
  let text_to_integer = foreign "TextToInteger" (string @-> returning int)

  let draw_line_3d =
    foreign "DrawLine3D" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_point_3d =
    foreign "DrawPoint3D" (Vector3.t @-> Color.t @-> returning void)

  let draw_circle_3d =
    foreign "DrawCircle3D"
      (Vector3.t @-> float @-> Vector3.t @-> float @-> Color.t
     @-> returning void)

  let draw_triangle_3d =
    foreign "DrawTriangle3D"
      (Vector3.t @-> Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_triangle_strip_3d =
    foreign "DrawTriangleStrip3D"
      (ptr Vector3.t @-> int @-> Color.t @-> returning void)

  let draw_cube =
    foreign "DrawCube"
      (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_v =
    foreign "DrawCubeV" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_cube_wires =
    foreign "DrawCubeWires"
      (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_wires_v =
    foreign "DrawCubeWiresV"
      (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_sphere =
    foreign "DrawSphere" (Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_sphere_ex =
    foreign "DrawSphereEx"
      (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_sphere_wires =
    foreign "DrawSphereWires"
      (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_cylinder =
    foreign "DrawCylinder"
      (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_ex =
    foreign "DrawCylinderEx"
      (Vector3.t @-> Vector3.t @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_wires =
    foreign "DrawCylinderWires"
      (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_wires_ex =
    foreign "DrawCylinderWiresEx"
      (Vector3.t @-> Vector3.t @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_capsule =
    foreign "DrawCapsule"
      (Vector3.t @-> Vector3.t @-> float @-> int @-> int @-> Color.t
     @-> returning void)

  let draw_capsule_wires =
    foreign "DrawCapsuleWires"
      (Vector3.t @-> Vector3.t @-> float @-> int @-> int @-> Color.t
     @-> returning void)

  let draw_plane =
    foreign "DrawPlane" (Vector3.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_ray = foreign "DrawRay" (Ray.t @-> Color.t @-> returning void)
  let draw_grid = foreign "DrawGrid" (int @-> float @-> returning void)
  let load_model = foreign "LoadModel" (string @-> returning Model.t)

  let load_model_from_mesh =
    foreign "LoadModelFromMesh" (Mesh.t @-> returning Model.t)

  let is_model_ready = foreign "IsModelReady" (Model.t @-> returning bool)
  let unload_model = foreign "UnloadModel" (Model.t @-> returning void)

  let get_model_bounding_box =
    foreign "GetModelBoundingBox" (Model.t @-> returning BoundingBox.t)

  let draw_model =
    foreign "DrawModel"
      (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_ex =
    foreign "DrawModelEx"
      (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t
     @-> returning void)

  let draw_model_wires =
    foreign "DrawModelWires"
      (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_wires_ex =
    foreign "DrawModelWiresEx"
      (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t
     @-> returning void)

  let draw_bounding_box =
    foreign "DrawBoundingBox" (BoundingBox.t @-> Color.t @-> returning void)

  let draw_billboard =
    foreign "DrawBillboard"
      (Camera3D.t @-> Texture.t @-> Vector3.t @-> float @-> Color.t
     @-> returning void)

  let draw_billboard_rec =
    foreign "DrawBillboardRec"
      (Camera3D.t @-> Texture.t @-> Rectangle.t @-> Vector3.t @-> Vector2.t
     @-> Color.t @-> returning void)

  let draw_billboard_pro =
    foreign "DrawBillboardPro"
      (Camera3D.t @-> Texture.t @-> Rectangle.t @-> Vector3.t @-> Vector3.t
     @-> Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let upload_mesh = foreign "UploadMesh" (ptr Mesh.t @-> bool @-> returning void)

  let update_mesh_buffer =
    foreign "UpdateMeshBuffer"
      (Mesh.t @-> int @-> ptr void @-> int @-> int @-> returning void)

  let unload_mesh = foreign "UnloadMesh" (Mesh.t @-> returning void)

  let draw_mesh =
    foreign "DrawMesh" (Mesh.t @-> Material.t @-> Matrix.t @-> returning void)

  let draw_mesh_instanced =
    foreign "DrawMeshInstanced"
      (Mesh.t @-> Material.t @-> ptr Matrix.t @-> int @-> returning void)

  let export_mesh = foreign "ExportMesh" (Mesh.t @-> string @-> returning bool)

  let get_mesh_bounding_box =
    foreign "GetMeshBoundingBox" (Mesh.t @-> returning BoundingBox.t)

  let gen_mesh_tangents =
    foreign "GenMeshTangents" (ptr Mesh.t @-> returning void)

  let gen_mesh_poly = foreign "GenMeshPoly" (int @-> float @-> returning Mesh.t)

  let gen_mesh_plane =
    foreign "GenMeshPlane" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_cube =
    foreign "GenMeshCube" (float @-> float @-> float @-> returning Mesh.t)

  let gen_mesh_sphere =
    foreign "GenMeshSphere" (float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_hemi_sphere =
    foreign "GenMeshHemiSphere" (float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_cylinder =
    foreign "GenMeshCylinder" (float @-> float @-> int @-> returning Mesh.t)

  let gen_mesh_cone =
    foreign "GenMeshCone" (float @-> float @-> int @-> returning Mesh.t)

  let gen_mesh_torus =
    foreign "GenMeshTorus" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_knot =
    foreign "GenMeshKnot" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_heightmap =
    foreign "GenMeshHeightmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let gen_mesh_cubicmap =
    foreign "GenMeshCubicmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let load_materials =
    foreign "LoadMaterials" (string @-> ptr int @-> returning (ptr Material.t))

  let load_material_default =
    foreign "LoadMaterialDefault" (void @-> returning Material.t)

  let is_material_ready =
    foreign "IsMaterialReady" (Material.t @-> returning bool)

  let unload_material = foreign "UnloadMaterial" (Material.t @-> returning void)

  let set_material_texture =
    foreign "SetMaterialTexture"
      (ptr Material.t @-> MaterialMapIndex.t @-> Texture.t @-> returning void)

  let set_model_mesh_material =
    foreign "SetModelMeshMaterial"
      (ptr Model.t @-> int @-> int @-> returning void)

  let _load_model_animations =
    foreign "LoadModelAnimations"
      (string @-> ptr int @-> returning (ptr ModelAnimation.t))

  let update_model_animation =
    foreign "UpdateModelAnimation"
      (Model.t @-> ModelAnimation.t @-> int @-> returning void)

  let unload_model_animation =
    foreign "UnloadModelAnimation" (ModelAnimation.t @-> returning void)

  let _unload_model_animations =
    foreign "UnloadModelAnimations"
      (ptr ModelAnimation.t @-> int @-> returning void)

  let is_model_animation_valid =
    foreign "IsModelAnimationValid"
      (Model.t @-> ModelAnimation.t @-> returning bool)

  let check_collision_spheres =
    foreign "CheckCollisionSpheres"
      (Vector3.t @-> float @-> Vector3.t @-> float @-> returning bool)

  let check_collision_boxes =
    foreign "CheckCollisionBoxes"
      (BoundingBox.t @-> BoundingBox.t @-> returning bool)

  let check_collision_box_sphere =
    foreign "CheckCollisionBoxSphere"
      (BoundingBox.t @-> Vector3.t @-> float @-> returning bool)

  let get_ray_collision_sphere =
    foreign "GetRayCollisionSphere"
      (Ray.t @-> Vector3.t @-> float @-> returning RayCollision.t)

  let get_ray_collision_box =
    foreign "GetRayCollisionBox"
      (Ray.t @-> BoundingBox.t @-> returning RayCollision.t)

  let get_ray_collision_mesh =
    foreign "GetRayCollisionMesh"
      (Ray.t @-> Mesh.t @-> Matrix.t @-> returning RayCollision.t)

  let get_ray_collision_triangle =
    foreign "GetRayCollisionTriangle"
      (Ray.t @-> Vector3.t @-> Vector3.t @-> Vector3.t
     @-> returning RayCollision.t)

  let get_ray_collision_quad =
    foreign "GetRayCollisionQuad"
      (Ray.t @-> Vector3.t @-> Vector3.t @-> Vector3.t @-> Vector3.t
     @-> returning RayCollision.t)
end
