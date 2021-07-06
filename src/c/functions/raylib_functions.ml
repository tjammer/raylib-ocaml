module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Raylib_generated_types
  open Raylib_generated_constants

  let init_window =
    foreign "InitWindow" (int @-> int @-> string @-> returning void)

  let window_should_close =
    foreign "WindowShouldClose" (void @-> returning bool)

  let close_window =
    foreign "CloseWindow" (void @-> returning void)

  let is_window_ready =
    foreign "IsWindowReady" (void @-> returning bool)

  let is_window_fullscreen =
    foreign "IsWindowFullscreen" (void @-> returning bool)

  let is_window_hidden =
    foreign "IsWindowHidden" (void @-> returning bool)

  let is_window_minimized =
    foreign "IsWindowMinimized" (void @-> returning bool)

  let is_window_maximized =
    foreign "IsWindowMaximized" (void @-> returning bool)

  let is_window_focused =
    foreign "IsWindowFocused" (void @-> returning bool)

  let is_window_resized =
    foreign "IsWindowResized" (void @-> returning bool)

  let is_window_state =
    foreign "IsWindowState" (ConfigFlags.t @-> returning bool)

  let set_window_state =
    foreign "SetWindowState" (ConfigFlags.t_bitmask @-> returning void)

  let clear_window_state =
    foreign "ClearWindowState" (ConfigFlags.t_bitmask @-> returning void)

  let toggle_fullscreen =
    foreign "ToggleFullscreen" (void @-> returning void)

  let maximize_window =
    foreign "MaximizeWindow" (void @-> returning void)

  let minimize_window =
    foreign "MinimizeWindow" (void @-> returning void)

  let restore_window =
    foreign "RestoreWindow" (void @-> returning void)

  let set_window_icon =
    foreign "SetWindowIcon" (Image.t @-> returning void)

  let set_window_title =
    foreign "SetWindowTitle" (string @-> returning void)

  let set_window_position =
    foreign "SetWindowPosition" (int @-> int @-> returning void)

  let set_window_monitor =
    foreign "SetWindowMonitor" (int @-> returning void)

  let set_window_min_size =
    foreign "SetWindowMinSize" (int @-> int @-> returning void)

  let set_window_size =
    foreign "SetWindowSize" (int @-> int @-> returning void)

  let get_window_handle =
    foreign "GetWindowHandle" (void @-> returning (ptr_opt void))

  let get_screen_width =
    foreign "GetScreenWidth" (void @-> returning int)

  let get_screen_height =
    foreign "GetScreenHeight" (void @-> returning int)

  let get_monitor_count =
    foreign "GetMonitorCount" (void @-> returning int)

  let get_current_monitor =
    foreign "GetCurrentMonitor" (void @-> returning int)

  let get_monitor_position =
    foreign "GetMonitorPosition" (int @-> returning Vector2.t)

  let get_monitor_width =
    foreign "GetMonitorWidth" (int @-> returning int)

  let get_monitor_height =
    foreign "GetMonitorHeight" (int @-> returning int)

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

  let get_monitor_name =
    foreign "GetMonitorName" (int @-> returning string)

  let set_clipboard_text =
    foreign "SetClipboardText" (string @-> returning void)

  let get_clipboard_text =
    foreign "GetClipboardText" (void @-> returning string_opt)

  let show_cursor =
    foreign "ShowCursor" (void @-> returning void)

  let hide_cursor =
    foreign "HideCursor" (void @-> returning void)

  let is_cursor_hidden =
    foreign "IsCursorHidden" (void @-> returning bool)

  let enable_cursor =
    foreign "EnableCursor" (void @-> returning void)

  let disable_cursor =
    foreign "DisableCursor" (void @-> returning void)

  let is_cursor_on_screen =
    foreign "IsCursorOnScreen" (void @-> returning bool)

  let clear_background =
    foreign "ClearBackground" (Color.t @-> returning void)

  let begin_drawing =
    foreign "BeginDrawing" (void @-> returning void)

  let end_drawing =
    foreign "EndDrawing" (void @-> returning void)

  let begin_mode_2d =
    foreign "BeginMode2D" (Camera2D.t @-> returning void)

  let end_mode_2d =
    foreign "EndMode2D" (void @-> returning void)

  let begin_mode_3d =
    foreign "BeginMode3D" (Camera3D.t @-> returning void)

  let end_mode_3d =
    foreign "EndMode3D" (void @-> returning void)

  let begin_texture_mode =
    foreign "BeginTextureMode" (RenderTexture.t @-> returning void)

  let end_texture_mode =
    foreign "EndTextureMode" (void @-> returning void)

  let begin_shader_mode =
    foreign "BeginShaderMode" (Shader.t @-> returning void)

  let end_shader_mode =
    foreign "EndShaderMode" (void @-> returning void)

  let begin_blend_mode =
    foreign "BeginBlendMode" (BlendMode.t @-> returning void)

  let end_blend_mode =
    foreign "EndBlendMode" (void @-> returning void)

  let begin_scissor_mode =
    foreign "BeginScissorMode" (int @-> int @-> int @-> int @-> returning void)

  let end_scissor_mode =
    foreign "EndScissorMode" (void @-> returning void)

  let begin_vr_stereo_mode =
    foreign "BeginVrStereoMode" (VrStereoConfig.t @-> returning void)

  let end_vr_stereo_mode =
    foreign "EndVrStereoMode" (void @-> returning void)

  let load_vr_stereo_config =
    foreign "LoadVrStereoConfig" (VrDeviceInfo.t @-> returning VrStereoConfig.t)

  let unload_vr_stereo_config =
    foreign "UnloadVrStereoConfig" (VrStereoConfig.t @-> returning void)

  let load_shader =
    foreign "LoadShader" (string @-> string @-> returning Shader.t)

  let load_shader_from_memory =
    foreign "LoadShaderFromMemory" (string @-> string @-> returning Shader.t)

  let get_shader_location =
    foreign "GetShaderLocation" (Shader.t @-> string @-> returning int)

  let get_shader_location_attrib =
    foreign "GetShaderLocationAttrib" (Shader.t @-> string @-> returning int)

  let set_shader_value =
    foreign "SetShaderValue" (Shader.t @-> int @-> ptr void @-> ShaderUniformDataType.t @-> returning void)

  let set_shader_value_v =
    foreign "SetShaderValueV" (Shader.t @-> int @-> ptr void @-> ShaderUniformDataType.t @-> int @-> returning void)

  let set_shader_value_matrix =
    foreign "SetShaderValueMatrix" (Shader.t @-> int @-> Matrix.t @-> returning void)

  let set_shader_value_texture =
    foreign "SetShaderValueTexture" (Shader.t @-> int @-> Texture.t @-> returning void)

  let unload_shader =
    foreign "UnloadShader" (Shader.t @-> returning void)

  let get_mouse_ray =
    foreign "GetMouseRay" (Vector2.t @-> Camera3D.t @-> returning Ray.t)

  let get_camera_matrix =
    foreign "GetCameraMatrix" (Camera3D.t @-> returning Matrix.t)

  let get_camera_matrix_2d =
    foreign "GetCameraMatrix2D" (Camera2D.t @-> returning Matrix.t)

  let get_world_to_screen =
    foreign "GetWorldToScreen" (Vector3.t @-> Camera3D.t @-> returning Vector2.t)

  let get_world_to_screen_ex =
    foreign "GetWorldToScreenEx" (Vector3.t @-> Camera3D.t @-> int @-> int @-> returning Vector2.t)

  let get_world_to_screen_2d =
    foreign "GetWorldToScreen2D" (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

  let get_screen_to_world_2d =
    foreign "GetScreenToWorld2D" (Vector2.t @-> Camera2D.t @-> returning Vector2.t)

  let set_target_fps =
    foreign "SetTargetFPS" (int @-> returning void)

  let get_fps =
    foreign "GetFPS" (void @-> returning int)

  let get_frame_time =
    foreign "GetFrameTime" (void @-> returning float)

  let get_time =
    foreign "GetTime" (void @-> returning double)

  let get_random_value =
    foreign "GetRandomValue" (int @-> int @-> returning int)

  let take_screenshot =
    foreign "TakeScreenshot" (string @-> returning void)

  let set_config_flags =
    foreign "SetConfigFlags" (ConfigFlags.t_bitmask @-> returning void)

  let trace_log =
    foreign "TraceLog" (int @-> string @-> returning void)

  let set_trace_log_level =
    foreign "SetTraceLogLevel" (TraceLogLevel.t @-> returning void)

  let mem_alloc =
    foreign "MemAlloc" (int @-> returning (ptr void))

  let mem_realloc =
    foreign "MemRealloc" (ptr void @-> int @-> returning (ptr void))

  let mem_free =
    foreign "MemFree" (ptr void @-> returning void)

  (* let set_trace_log_callback =
   *   foreign "SetTraceLogCallback" (trace_log_callback @-> returning void) *)

  (* let set_load_file_data_callback =
   *   foreign "SetLoadFileDataCallback" (load_file_data_callback @-> returning void)
   *
   * let set_save_file_data_callback =
   *   foreign "SetSaveFileDataCallback" (save_file_data_callback @-> returning void)
   *
   * let set_load_file_text_callback =
   *   foreign "SetLoadFileTextCallback" (load_file_text_callback @-> returning void)
   *
   * let set_save_file_text_callback =
   *   foreign "SetSaveFileTextCallback" (save_file_text_callback @-> returning void) *)

  let _load_file_data =
    foreign "LoadFileData" (string @-> ptr uint @-> returning (ptr uchar))

  let unload_file_data = foreign "UnloadFileData" (string @-> returning void)

  let _save_file_data =
    foreign "SaveFileData" (string @-> ptr void @-> int @-> returning bool)

  let load_file_text = foreign "LoadFileText" (string @-> returning string)

  let unload_file_text = foreign "UnloadFileText" (string @-> returning void)

  let save_file_text =
    foreign "SaveFileText" (string @-> string @-> returning bool)

  let file_exists =
    foreign "FileExists" (string @-> returning bool)

  let directory_exists =
    foreign "DirectoryExists" (string @-> returning bool)

  let is_file_extension =
    foreign "IsFileExtension" (string @-> string @-> returning bool)

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

  let _get_directory_files =
    foreign "GetDirectoryFiles" (string @-> ptr int @-> returning (ptr string))

  let clear_directory_files =
    foreign "ClearDirectoryFiles" (void @-> returning void)

  let change_directory =
    foreign "ChangeDirectory" (string @-> returning bool)

  let is_file_dropped =
    foreign "IsFileDropped" (void @-> returning bool)

  let _get_dropped_files =
    foreign "GetDroppedFiles" (ptr int @-> returning (ptr string))

  let clear_dropped_files =
    foreign "ClearDroppedFiles" (void @-> returning void)

  let get_file_mod_time =
    foreign "GetFileModTime" (string @-> returning long)

  let _compress_data =
    foreign "CompressData" (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  let _decompress_data =
    foreign "DecompressData" (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  let save_storage_value =
    foreign "SaveStorageValue" (int @-> int @-> returning bool)

  let load_storage_value =
    foreign "LoadStorageValue" (int @-> returning int)

  let open_url =
    foreign "OpenURL" (string @-> returning void)

  let is_key_pressed =
    foreign "IsKeyPressed" (Key.t @-> returning bool)

  let is_key_down =
    foreign "IsKeyDown" (Key.t @-> returning bool)

  let is_key_released =
    foreign "IsKeyReleased" (Key.t @-> returning bool)

  let is_key_up =
    foreign "IsKeyUp" (Key.t @-> returning bool)

  let set_exit_key =
    foreign "SetExitKey" (Key.t @-> returning void)

  let get_key_pressed =
    foreign "GetKeyPressed" (void @-> returning Key.t)

  let get_char_pressed =
    foreign "GetCharPressed" (void @-> returning char)

  let is_gamepad_available =
    foreign "IsGamepadAvailable" (int @-> returning bool)

  let is_gamepad_name =
    foreign "IsGamepadName" (int @-> string @-> returning bool)

  let get_gamepad_name =
    foreign "GetGamepadName" (int @-> returning string)

  let is_gamepad_button_pressed =
    foreign "IsGamepadButtonPressed" (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_down =
    foreign "IsGamepadButtonDown" (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_released =
    foreign "IsGamepadButtonReleased" (int @-> GamepadButton.t @-> returning bool)

  let is_gamepad_button_up =
    foreign "IsGamepadButtonUp" (int @-> GamepadButton.t @-> returning bool)

  let get_gamepad_button_pressed =
    foreign "GetGamepadButtonPressed" (void @-> returning GamepadButton.t)

  let get_gamepad_axis_count =
    foreign "GetGamepadAxisCount" (int @-> returning int)

  let get_gamepad_axis_movement =
    foreign "GetGamepadAxisMovement" (int @-> GamepadAxis.t @-> returning float)

  (* let set_gamepad_mappings =
   *   foreign "SetGamepadMappings" (string @-> returning int) *)

  let is_mouse_button_pressed =
    foreign "IsMouseButtonPressed" (MouseButton.t @-> returning bool)

  let is_mouse_button_down =
    foreign "IsMouseButtonDown" (MouseButton.t @-> returning bool)

  let is_mouse_button_released =
    foreign "IsMouseButtonReleased" (MouseButton.t @-> returning bool)

  let is_mouse_button_up =
    foreign "IsMouseButtonUp" (MouseButton.t @-> returning bool)

  let get_mouse_x =
    foreign "GetMouseX" (void @-> returning int)

  let get_mouse_y =
    foreign "GetMouseY" (void @-> returning int)

  let get_mouse_position =
    foreign "GetMousePosition" (void @-> returning Vector2.t)

  let set_mouse_position =
    foreign "SetMousePosition" (int @-> int @-> returning void)

  let set_mouse_offset =
    foreign "SetMouseOffset" (int @-> int @-> returning void)

  let set_mouse_scale =
    foreign "SetMouseScale" (float @-> float @-> returning void)

  let get_mouse_wheel_move =
    foreign "GetMouseWheelMove" (void @-> returning float)

  let set_mouse_cursor =
    foreign "SetMouseCursor" (MouseCursor.t @-> returning void)

  let get_touch_x =
    foreign "GetTouchX" (void @-> returning int)

  let get_touch_y =
    foreign "GetTouchY" (void @-> returning int)

  let get_touch_position =
    foreign "GetTouchPosition" (int @-> returning Vector2.t)

  let set_gestures_enabled =
    foreign "SetGesturesEnabled" (Gestures.t_bitmask @-> returning void)

  let is_gesture_detected =
    foreign "IsGestureDetected" (Gestures.t @-> returning bool)

  let get_gesture_detected =
    foreign "GetGestureDetected" (void @-> returning Gestures.t)

  let get_touch_points_count =
    foreign "GetTouchPointsCount" (void @-> returning int)

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

  let set_camera_mode =
    foreign "SetCameraMode" (Camera3D.t @-> CameraMode.t @-> returning void)

  let update_camera = foreign "UpdateCamera" (ptr Camera3D.t @-> returning void)

  let set_camera_pan_control =
    foreign "SetCameraPanControl" (Key.t @-> returning void)

  let set_camera_alt_control =
    foreign "SetCameraAltControl" (Key.t @-> returning void)

  let set_camera_smooth_zoom_control =
    foreign "SetCameraSmoothZoomControl" (Key.t @-> returning void)

  let set_camera_move_controls =
    foreign "SetCameraMoveControls"
      (Key.t @-> Key.t @-> Key.t @-> Key.t @-> Key.t @-> Key.t
     @-> returning void)

  let set_shapes_texture =
    foreign "SetShapesTexture" (Texture.t @-> Rectangle.t @-> returning void)

  let draw_pixel =
    foreign "DrawPixel" (int @-> int @-> Color.t @-> returning void)

  let draw_pixel_v =
    foreign "DrawPixelV" (Vector2.t @-> Color.t @-> returning void)

  let draw_line =
    foreign "DrawLine" (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_line_v =
    foreign "DrawLineV" (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_line_ex =
    foreign "DrawLineEx" (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_bezier =
    foreign "DrawLineBezier" (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_bezier_quad =
    foreign "DrawLineBezierQuad" (Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_strip =
    foreign "DrawLineStrip" (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_circle =
    foreign "DrawCircle" (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_circle_sector =
    foreign "DrawCircleSector" (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_circle_sector_lines =
    foreign "DrawCircleSectorLines" (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_circle_gradient =
    foreign "DrawCircleGradient" (int @-> int @-> float @-> Color.t @-> Color.t @-> returning void)

  let draw_circle_v =
    foreign "DrawCircleV" (Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_circle_lines =
    foreign "DrawCircleLines" (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_ellipse =
    foreign "DrawEllipse" (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ellipse_lines =
    foreign "DrawEllipseLines" (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ring =
    foreign "DrawRing" (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_ring_lines =
    foreign "DrawRingLines" (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_rectangle =
    foreign "DrawRectangle" (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_v =
    foreign "DrawRectangleV" (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_rectangle_rec =
    foreign "DrawRectangleRec" (Rectangle.t @-> Color.t @-> returning void)

  let draw_rectangle_pro =
    foreign "DrawRectanglePro" (Rectangle.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_rectangle_gradient_v =
    foreign "DrawRectangleGradientV" (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_h =
    foreign "DrawRectangleGradientH" (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_ex =
    foreign "DrawRectangleGradientEx" (Rectangle.t @-> Color.t @-> Color.t @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_lines =
    foreign "DrawRectangleLines" (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_lines_ex =
    foreign "DrawRectangleLinesEx" (Rectangle.t @-> int @-> Color.t @-> returning void)

  let draw_rectangle_rounded =
    foreign "DrawRectangleRounded" (Rectangle.t @-> float @-> int @-> Color.t @-> returning void)

  let draw_rectangle_rounded_lines =
    foreign "DrawRectangleRoundedLines" (Rectangle.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_triangle =
    foreign "DrawTriangle" (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_lines =
    foreign "DrawTriangleLines" (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_fan =
    foreign "DrawTriangleFan" (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_triangle_strip =
    foreign "DrawTriangleStrip" (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_poly =
    foreign "DrawPoly" (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_poly_lines =
    foreign "DrawPolyLines" (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let check_collision_recs =
    foreign "CheckCollisionRecs" (Rectangle.t @-> Rectangle.t @-> returning bool)

  let check_collision_circles =
    foreign "CheckCollisionCircles" (Vector2.t @-> float @-> Vector2.t @-> float @-> returning bool)

  let check_collision_circle_rec =
    foreign "CheckCollisionCircleRec" (Vector2.t @-> float @-> Rectangle.t @-> returning bool)

  let check_collision_point_rec =
    foreign "CheckCollisionPointRec" (Vector2.t @-> Rectangle.t @-> returning bool)

  let check_collision_point_circle =
    foreign "CheckCollisionPointCircle" (Vector2.t @-> Vector2.t @-> float @-> returning bool)

  let check_collision_point_triangle =
    foreign "CheckCollisionPointTriangle" (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> returning bool)

  let check_collision_lines =
    foreign "CheckCollisionLines" (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> ptr Vector2.t @-> returning bool)

  let get_collision_rec =
    foreign "GetCollisionRec" (Rectangle.t @-> Rectangle.t @-> returning Rectangle.t)

  let load_image =
    foreign "LoadImage" (string @-> returning Image.t)

  let load_image_raw =
    foreign "LoadImageRaw" (string @-> int @-> int @-> PixelFormat.t @-> int @-> returning Image.t)

  let load_image_anim =
    foreign "LoadImageAnim" (string @-> ptr int @-> returning Image.t)

  let load_image_from_memory =
    foreign "LoadImageFromMemory" (string @-> ptr uchar @-> int @-> returning Image.t)

  let unload_image =
    foreign "UnloadImage" (Image.t @-> returning void)

  let export_image =
    foreign "ExportImage" (Image.t @-> string @-> returning bool)

  let export_image_as_code =
    foreign "ExportImageAsCode" (Image.t @-> string @-> returning bool)

  let gen_image_color =
    foreign "GenImageColor" (int @-> int @-> Color.t @-> returning Image.t)

  let gen_image_gradient_v =
    foreign "GenImageGradientV"
      (int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_h =
    foreign "GenImageGradientH"
      (int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_radial =
    foreign "GenImageGradientRadial"
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

  let unload_texture =
    foreign "UnloadTexture" (Texture.t @-> returning void)

  let unload_render_texture =
    foreign "UnloadRenderTexture" (RenderTexture.t @-> returning void)

  let update_texture =
    foreign "UpdateTexture" (Texture.t @-> ptr void @-> returning void)

  let update_texture_rec =
    foreign "UpdateTextureRec" (Texture.t @-> Rectangle.t @-> ptr void @-> returning void)

  let get_texture_data =
    foreign "GetTextureData" (Texture.t @-> returning Image.t)

  let get_screen_data =
    foreign "GetScreenData" (void @-> returning Image.t)

  let gen_texture_mipmaps =
    foreign "GenTextureMipmaps" (ptr Texture.t @-> returning void)

  let set_texture_filter =
    foreign "SetTextureFilter" (Texture.t @-> TextureFilter.t @-> returning void)

  let set_texture_wrap =
    foreign "SetTextureWrap" (Texture.t @-> TextureWrap.t @-> returning void)

  let draw_texture =
    foreign "DrawTexture" (Texture.t @-> int @-> int @-> Color.t @-> returning void)

  let draw_texture_v =
    foreign "DrawTextureV" (Texture.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_ex =
    foreign "DrawTextureEx" (Texture.t @-> Vector2.t @-> float @-> float @-> Color.t @-> returning void)

  let draw_texture_rec =
    foreign "DrawTextureRec" (Texture.t @-> Rectangle.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_quad =
    foreign "DrawTextureQuad" (Texture.t @-> Vector2.t @-> Vector2.t @-> Rectangle.t @-> Color.t @-> returning void)

  let draw_texture_tiled =
    foreign "DrawTextureTiled" (Texture.t @-> Rectangle.t @-> Rectangle.t @-> Vector2.t @-> float @-> float @-> Color.t @-> returning void)

  let draw_texture_pro =
    foreign "DrawTexturePro" (Texture.t @-> Rectangle.t @-> Rectangle.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_texture_npatch =
    foreign "DrawTextureNPatch" (Texture.t @-> NPatchInfo.t @-> Rectangle.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_texture_poly =
    foreign "DrawTexturePoly" (Texture.t @-> Vector2.t @-> ptr Vector2.t @-> ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let fade =
    foreign "Fade" (Color.t @-> float @-> returning Color.t)

  let color_to_int =
    foreign "ColorToInt" (Color.t @-> returning int)

  let color_normalize =
    foreign "ColorNormalize" (Color.t @-> returning Vector4.t)

  let color_from_normalized =
    foreign "ColorFromNormalized" (Vector4.t @-> returning Color.t)

  let color_to_hsv = foreign "ColorToHSV" (Color.t @-> returning Vector3.t)

  let color_from_hsv =
    foreign "ColorFromHSV" (float @-> float @-> float @-> returning Color.t)

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

  let load_font_ex =
    foreign "LoadFontEx"
      (string @-> int @-> ptr int @-> int @-> returning Font.t)

  let load_font_from_image =
    foreign "LoadFontFromImage"
      (Image.t @-> Color.t @-> int @-> returning Font.t)

  let load_font_from_memory =
    foreign "LoadFontFromMemory"
      (string @-> ptr uchar @-> int @-> int @-> ptr int @-> int
     @-> returning Font.t)

  let load_font_data =
    foreign "LoadFontData"
      (ptr uchar @-> int @-> int @-> ptr int @-> int @-> int
      @-> returning (ptr CharInfo.t))

  let gen_image_font_atlas =
    foreign "GenImageFontAtlas"
      (ptr CharInfo.t
      @-> ptr (ptr Rectangle.t)
      @-> int @-> int @-> int @-> int @-> returning Image.t)

  let unload_font_data =
    foreign "UnloadFontData" (ptr CharInfo.t @-> int @-> returning void)

  let unload_font = foreign "UnloadFont" (Font.t @-> returning void)

  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_text_ex =
    foreign "DrawTextEx"
      (Font.t @-> string @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_text_rec =
    foreign "DrawTextRec"
      (Font.t @-> string @-> Rectangle.t @-> float @-> float @-> bool
     @-> Color.t @-> returning void)

  let draw_text_rec_ex =
    foreign "DrawTextRecEx"
      (Font.t @-> string @-> Rectangle.t @-> float @-> float @-> bool
     @-> Color.t @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_text_codepoint =
    foreign "DrawTextCodepoint"
      (Font.t @-> int @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let measure_text = foreign "MeasureText" (string @-> int @-> returning int)

  let measure_text_ex =
    foreign "MeasureTextEx"
      (Font.t @-> string @-> float @-> float @-> returning Vector2.t)

  let get_glyph_index =
    foreign "GetGlyphIndex" (Font.t @-> int @-> returning int)

  let text_copy = foreign "TextCopy" (string @-> string @-> returning int)

  let text_is_equal =
    foreign "TextIsEqual" (string @-> string @-> returning bool)

  let text_length = foreign "TextLength" (string @-> returning int)

  (* let text_format =
   *   foreign "TextFormat" (string @->  @-> returning string) *)

  let text_subtext =
    foreign "TextSubtext" (string @-> int @-> int @-> returning string)

  let text_replace =
    foreign "TextReplace" (string @-> string @-> string @-> returning string)

  let text_insert =
    foreign "TextInsert" (string @-> string @-> int @-> returning string)

  (* let text_join =
   *   foreign "TextJoin" (ptr ptr const char @-> int @-> string @-> returning string)
   *
   * let text_split =
   *   foreign "TextSplit" (string @-> char @-> ptr int @-> returning ptr ptr const char) *)

  let text_append =
    foreign "TextAppend" (string @-> string @-> ptr int @-> returning void)

  let text_find_index =
    foreign "TextFindIndex" (string @-> string @-> returning int)

  let text_to_upper = foreign "TextToUpper" (string @-> returning string)

  let text_to_lower = foreign "TextToLower" (string @-> returning string)

  let text_to_pascal = foreign "TextToPascal" (string @-> returning string)

  let text_to_integer = foreign "TextToInteger" (string @-> returning int)

  let text_to_utf8 = foreign "TextToUtf8" (ptr int @-> int @-> returning string)

  let get_codepoints =
    foreign "GetCodepoints" (string @-> ptr int @-> returning (ptr int))

  let get_codepoints_count =
    foreign "GetCodepointsCount" (string @-> returning int)

  let get_next_codepoint =
    foreign "GetNextCodepoint" (string @-> ptr int @-> returning int)

  let codepoint_to_utf8 =
    foreign "CodepointToUtf8" (int @-> ptr int @-> returning string)

  let draw_line_3d =
    foreign "DrawLine3D" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_point_3d =
    foreign "DrawPoint3D" (Vector3.t @-> Color.t @-> returning void)

  let draw_circle_3d =
    foreign "DrawCircle3D" (Vector3.t @-> float @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_triangle_3d =
    foreign "DrawTriangle3D" (Vector3.t @-> Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_triangle_strip_3d =
    foreign "DrawTriangleStrip3D" (ptr Vector3.t @-> int @-> Color.t @-> returning void)

  let draw_cube =
    foreign "DrawCube" (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_v =
    foreign "DrawCubeV" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_cube_wires =
    foreign "DrawCubeWires" (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_wires_v =
    foreign "DrawCubeWiresV" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_cube_texture =
    foreign "DrawCubeTexture" (Texture.t @-> Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_sphere =
    foreign "DrawSphere" (Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_sphere_ex =
    foreign "DrawSphereEx" (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_sphere_wires =
    foreign "DrawSphereWires" (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_cylinder =
    foreign "DrawCylinder" (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_cylinder_wires =
    foreign "DrawCylinderWires" (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t @-> returning void)

  let draw_plane =
    foreign "DrawPlane" (Vector3.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_ray =
    foreign "DrawRay" (Ray.t @-> Color.t @-> returning void)

  let draw_grid =
    foreign "DrawGrid" (int @-> float @-> returning void)

  let load_model =
    foreign "LoadModel" (string @-> returning Model.t)

  let load_model_from_mesh =
    foreign "LoadModelFromMesh" (Mesh.t @-> returning Model.t)

  let unload_model =
    foreign "UnloadModel" (Model.t @-> returning void)

  let unload_model_keep_meshes =
    foreign "UnloadModelKeepMeshes" (Model.t @-> returning void)

  let upload_mesh =
    foreign "UploadMesh" (ptr Mesh.t @-> bool @-> returning void)

  let update_mesh_buffer =
    foreign "UpdateMeshBuffer" (Mesh.t @-> int @-> ptr void @-> int @-> int @-> returning void)

  let draw_mesh =
    foreign "DrawMesh" (Mesh.t @-> Material.t @-> Matrix.t @-> returning void)

  let draw_mesh_instanced =
    foreign "DrawMeshInstanced" (Mesh.t @-> Material.t @-> ptr Matrix.t @-> int @-> returning void)

  let unload_mesh =
    foreign "UnloadMesh" (Mesh.t @-> returning void)

  let export_mesh =
    foreign "ExportMesh" (Mesh.t @-> string @-> returning bool)

  let load_materials =
    foreign "LoadMaterials" (string @-> ptr int @-> returning (ptr Material.t))

  let load_material_default =
    foreign "LoadMaterialDefault" (void @-> returning Material.t)

  let unload_material =
    foreign "UnloadMaterial" (Material.t @-> returning void)

  let set_material_texture =
    foreign "SetMaterialTexture" (ptr Material.t @-> MaterialMapIndex.t @-> Texture.t @-> returning void)

  let set_model_mesh_material =
    foreign "SetModelMeshMaterial" (ptr Model.t @-> int @-> int @-> returning void)

  let _load_model_animations =
    foreign "LoadModelAnimations" (string @-> ptr int @-> returning (ptr ModelAnimation.t))

  let update_model_animation =
    foreign "UpdateModelAnimation" (Model.t @-> ModelAnimation.t @-> int @-> returning void)

  let unload_model_animation =
    foreign "UnloadModelAnimation" (ModelAnimation.t @-> returning void)

  let _unload_model_animations =
    foreign "UnloadModelAnimations" (ptr ModelAnimation.t @-> int @-> returning void)

  let is_model_animation_valid =
    foreign "IsModelAnimationValid" (Model.t @-> ModelAnimation.t @-> returning bool)

  let gen_mesh_poly =
    foreign "GenMeshPoly" (int @-> float @-> returning Mesh.t)

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

  let gen_mesh_torus =
    foreign "GenMeshTorus" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_knot =
    foreign "GenMeshKnot" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_heightmap =
    foreign "GenMeshHeightmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let gen_mesh_cubicmap =
    foreign "GenMeshCubicmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let mesh_bounding_box =
    foreign "MeshBoundingBox" (Mesh.t @-> returning BoundingBox.t)

  let mesh_tangents =
    foreign "MeshTangents" (ptr Mesh.t @-> returning void)

  let mesh_binormals =
    foreign "MeshBinormals" (ptr Mesh.t @-> returning void)

  let draw_model =
    foreign "DrawModel" (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_ex =
    foreign "DrawModelEx" (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t @-> returning void)

  let draw_model_wires =
    foreign "DrawModelWires" (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_wires_ex =
    foreign "DrawModelWiresEx" (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t @-> returning void)

  let draw_bounding_box =
    foreign "DrawBoundingBox" (BoundingBox.t @-> Color.t @-> returning void)

  let draw_billboard =
    foreign "DrawBillboard" (Camera3D.t @-> Texture.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_billboard_rec =
    foreign "DrawBillboardRec" (Camera3D.t @-> Texture.t @-> Rectangle.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let check_collision_spheres =
    foreign "CheckCollisionSpheres" (Vector3.t @-> float @-> Vector3.t @-> float @-> returning bool)

  let check_collision_boxes =
    foreign "CheckCollisionBoxes" (BoundingBox.t @-> BoundingBox.t @-> returning bool)

  let check_collision_box_sphere =
    foreign "CheckCollisionBoxSphere" (BoundingBox.t @-> Vector3.t @-> float @-> returning bool)

  let check_collision_ray_sphere =
    foreign "CheckCollisionRaySphere" (Ray.t @-> Vector3.t @-> float @-> returning bool)

  let check_collision_ray_sphere_ex =
    foreign "CheckCollisionRaySphereEx" (Ray.t @-> Vector3.t @-> float @-> ptr Vector3.t @-> returning bool)

  let check_collision_ray_box =
    foreign "CheckCollisionRayBox" (Ray.t @-> BoundingBox.t @-> returning bool)

  let get_collision_ray_mesh =
    foreign "GetCollisionRayMesh" (Ray.t @-> Mesh.t @-> Matrix.t @-> returning RayHitInfo.t)

  let get_collision_ray_model =
    foreign "GetCollisionRayModel" (Ray.t @-> Model.t @-> returning RayHitInfo.t)

  let get_collision_ray_triangle =
    foreign "GetCollisionRayTriangle" (Ray.t @-> Vector3.t @-> Vector3.t @-> Vector3.t @-> returning RayHitInfo.t)

  let get_collision_ray_ground =
    foreign "GetCollisionRayGround" (Ray.t @-> float @-> returning RayHitInfo.t)

  let init_audio_device =
    foreign "InitAudioDevice" (void @-> returning void)

  let close_audio_device =
    foreign "CloseAudioDevice" (void @-> returning void)

  let is_audio_device_ready =
    foreign "IsAudioDeviceReady" (void @-> returning bool)

  let set_master_volume =
    foreign "SetMasterVolume" (float @-> returning void)

  let load_wave =
    foreign "LoadWave" (string @-> returning Wave.t)

  let load_wave_from_memory =
    foreign "LoadWaveFromMemory" (string @-> ptr uchar @-> int @-> returning Wave.t)

  let load_sound =
    foreign "LoadSound" (string @-> returning Sound.t)

  let load_sound_from_wave =
    foreign "LoadSoundFromWave" (Wave.t @-> returning Sound.t)

  let update_sound =
    foreign "UpdateSound" (Sound.t @-> ptr void @-> int @-> returning void)

  let unload_wave =
    foreign "UnloadWave" (Wave.t @-> returning void)

  let unload_sound =
    foreign "UnloadSound" (Sound.t @-> returning void)

  let export_wave =
    foreign "ExportWave" (Wave.t @-> string @-> returning bool)

  let export_wave_as_code =
    foreign "ExportWaveAsCode" (Wave.t @-> string @-> returning bool)

  let play_sound =
    foreign "PlaySound" (Sound.t @-> returning void)

  let stop_sound =
    foreign "StopSound" (Sound.t @-> returning void)

  let pause_sound =
    foreign "PauseSound" (Sound.t @-> returning void)

  let resume_sound =
    foreign "ResumeSound" (Sound.t @-> returning void)

  let play_sound_multi =
    foreign "PlaySoundMulti" (Sound.t @-> returning void)

  let stop_sound_multi =
    foreign "StopSoundMulti" (void @-> returning void)

  let get_sounds_playing =
    foreign "GetSoundsPlaying" (void @-> returning int)

  let is_sound_playing =
    foreign "IsSoundPlaying" (Sound.t @-> returning bool)

  let set_sound_volume =
    foreign "SetSoundVolume" (Sound.t @-> float @-> returning void)

  let set_sound_pitch =
    foreign "SetSoundPitch" (Sound.t @-> float @-> returning void)

  let wave_format =
    foreign "WaveFormat" (ptr Wave.t @-> int @-> int @-> int @-> returning void)

  let wave_copy = foreign "WaveCopy" (Wave.t @-> returning Wave.t)

  let wave_crop =
    foreign "WaveCrop" (ptr Wave.t @-> int @-> int @-> returning void)

  let load_wave_samples =
    foreign "LoadWaveSamples" (Wave.t @-> returning (ptr float))

  let unload_wave_samples =
    foreign "UnloadWaveSamples" (ptr float @-> returning void)

  let load_music_stream =
    foreign "LoadMusicStream" (string @-> returning Music.t)

  let load_music_stream_from_memory =
    foreign "LoadMusicStreamFromMemory" (string @-> ptr uchar @-> int @-> returning Music.t)

  let unload_music_stream =
    foreign "UnloadMusicStream" (Music.t @-> returning void)

  let play_music_stream =
    foreign "PlayMusicStream" (Music.t @-> returning void)

  let is_music_playing = foreign "IsMusicPlaying" (Music.t @-> returning bool)

  let update_music_stream =
    foreign "UpdateMusicStream" (Music.t @-> returning void)

  let stop_music_stream =
    foreign "StopMusicStream" (Music.t @-> returning void)

  let pause_music_stream =
    foreign "PauseMusicStream" (Music.t @-> returning void)

  let resume_music_stream =
    foreign "ResumeMusicStream" (Music.t @-> returning void)

  let set_music_volume =
    foreign "SetMusicVolume" (Music.t @-> float @-> returning void)

  let set_music_pitch =
    foreign "SetMusicPitch" (Music.t @-> float @-> returning void)

  let get_music_time_length =
    foreign "GetMusicTimeLength" (Music.t @-> returning float)

  let get_music_time_played =
    foreign "GetMusicTimePlayed" (Music.t @-> returning float)

  let init_audio_stream =
    foreign "InitAudioStream" (int @-> int @-> int @-> returning AudioStream.t)

  let update_audio_stream =
    foreign "UpdateAudioStream"
      (AudioStream.t @-> ptr void @-> int @-> returning void)

  let close_audio_stream =
    foreign "CloseAudioStream" (AudioStream.t @-> returning void)

  let is_audio_stream_processed =
    foreign "IsAudioStreamProcessed" (AudioStream.t @-> returning bool)

  let play_audio_stream =
    foreign "PlayAudioStream" (AudioStream.t @-> returning void)

  let pause_audio_stream =
    foreign "PauseAudioStream" (AudioStream.t @-> returning void)

  let resume_audio_stream =
    foreign "ResumeAudioStream" (AudioStream.t @-> returning void)

  let is_audio_stream_playing =
    foreign "IsAudioStreamPlaying" (AudioStream.t @-> returning bool)

  let stop_audio_stream =
    foreign "StopAudioStream" (AudioStream.t @-> returning void)

  let set_audio_stream_volume =
    foreign "SetAudioStreamVolume" (AudioStream.t @-> float @-> returning void)

  let set_audio_stream_pitch =
    foreign "SetAudioStreamPitch" (AudioStream.t @-> float @-> returning void)

  let set_audio_stream_buffer_size_default =
    foreign "SetAudioStreamBufferSizeDefault" (int @-> returning void)
end
