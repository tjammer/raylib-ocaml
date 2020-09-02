module Types = Raylib_generated_types
module Constants = Raylib_generated_constants

module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  (* Window and Graphics Device Functions (Module: core) *)

  (* Window-related functions *)
  (*  Initialize window and OpenGL context *)
  let init_window =
    foreign "InitWindow" (int @-> int @-> string @-> returning void)

  (*  Check if KEY_ESCAPE pressed or Close icon pressed *)
  let window_should_close = foreign "WindowShouldClose" (void @-> returning bool)

  (*  Close window and unload OpenGL context *)
  let close_window = foreign "CloseWindow" (void @-> returning void)

  (*  Check if window has been initialized successfully *)
  let is_window_ready = foreign "IsWindowReady" (void @-> returning bool)

  (*  Check if window has been minimized (or lost focus) *)
  let is_window_minimized = foreign "IsWindowMinimized" (void @-> returning bool)

  (*  Check if window has been resized *)
  let is_window_resized = foreign "IsWindowResized" (void @-> returning bool)

  (*  Check if window is currently hidden *)
  let is_window_hidden = foreign "IsWindowHidden" (void @-> returning bool)

  (*  Check if window is currently fullscreen *)
  let is_window_fullscreen =
    foreign "IsWindowFullscreen" (void @-> returning bool)

  (*  Toggle fullscreen mode (only PLATFORM_DESKTOP) *)
  let toggle_fullscreen = foreign "ToggleFullscreen" (void @-> returning void)

  (*  Show the window *)
  let unhide_window = foreign "UnhideWindow" (void @-> returning void)

  (*  Hide the window *)
  let hide_window = foreign "HideWindow" (void @-> returning void)

  (*  Set icon for window (only PLATFORM_DESKTOP) *)
  let set_window_icon =
    foreign "SetWindowIcon" (Types.Image.t @-> returning void)

  (*  Set title for window (only PLATFORM_DESKTOP) *)
  let set_window_title = foreign "SetWindowTitle" (string @-> returning void)

  (*  Set window position on screen (only PLATFORM_DESKTOP) *)
  let set_window_position =
    foreign "SetWindowPosition" (int @-> int @-> returning void)

  (*  Set monitor for the current window (fullscreen mode) *)
  let set_window_monitor = foreign "SetWindowMonitor" (int @-> returning void)

  (*  Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) *)
  let set_window_min_size =
    foreign "SetWindowMinSize" (int @-> int @-> returning void)

  (*  Set window dimensions *)
  let set_window_size = foreign "SetWindowSize" (int @-> int @-> returning void)

  (*  Get native window handle *)
  let get_window_handle =
    foreign "GetWindowHandle" (void @-> returning (ptr_opt void))

  (*  Get current screen width *)
  let get_screen_width = foreign "GetScreenWidth" (void @-> returning int)

  (*  Get current screen height *)
  let get_screen_height = foreign "GetScreenHeight" (void @-> returning int)

  (*  Get number of connected monitors *)
  let get_monitor_count = foreign "GetMonitorCount" (void @-> returning int)

  (*  Get primary monitor width *)
  let get_monitor_width = foreign "GetMonitorWidth" (int @-> returning int)

  (*  Get primary monitor height *)
  let get_monitor_height = foreign "GetMonitorHeight" (int @-> returning int)

  (*  Get primary monitor physical width in millimetres *)
  let get_monitor_physical_width =
    foreign "GetMonitorPhysicalWidth" (int @-> returning int)

  (*  Get primary monitor physical height in millimetres *)
  let get_monitor_physical_height =
    foreign "GetMonitorPhysicalHeight" (int @-> returning int)

  (*  Get window position XY on monitor *)
  let get_window_position =
    foreign "GetWindowPosition" (void @-> returning Types.Vector2.t)

  (*  Get the human-readable, UTF-8 encoded name of the primary monitor *)
  let get_monitor_name = foreign "GetMonitorName" (int @-> returning string)

  (*  Get clipboard text content *)
  let get_clipboard_text =
    foreign "GetClipboardText" (void @-> returning string_opt)

  (*  Set clipboard text content *)
  let set_clipboard_text = foreign "SetClipboardText" (string @-> returning void)

  (* Cursor-related functions *)
  (*  Shows cursor *)
  let show_cursor = foreign "ShowCursor" (void @-> returning void)

  (*  Hides cursor *)
  let hide_cursor = foreign "HideCursor" (void @-> returning void)

  (*  Check if cursor is not visible *)
  let is_cursor_hidden = foreign "IsCursorHidden" (void @-> returning bool)

  (*  Enables cursor (unlock cursor) *)
  let enable_cursor = foreign "EnableCursor" (void @-> returning void)

  (*  Disables cursor (lock cursor) *)
  let disable_cursor = foreign "DisableCursor" (void @-> returning void)

  (* Drawing-related functions *)
  (*  Set background color (framebuffer clear color) *)
  let clear_background =
    foreign "ClearBackground" (Types.Color.t @-> returning void)

  (*  Setup canvas (framebuffer) to start drawing *)
  let begin_drawing = foreign "BeginDrawing" (void @-> returning void)

  (*  End canvas drawing and swap buffers (double buffering) *)
  let end_drawing = foreign "EndDrawing" (void @-> returning void)

  (*  Initialize 2D mode with custom camera (2D) *)
  let begin_mode_2d = foreign "BeginMode2D" (Types.Camera2D.t @-> returning void)

  (*  Ends 2D mode with custom camera *)
  let end_mode_2d = foreign "EndMode2D" (void @-> returning void)

  (*  Initializes 3D mode with custom camera (3D) *)
  let begin_mode_3d = foreign "BeginMode3D" (Types.Camera3D.t @-> returning void)

  (*  Ends 3D mode and returns to default 2D orthographic mode *)
  let end_mode_3d = foreign "EndMode3D" (void @-> returning void)

  (*  Initializes render texture for drawing *)
  let begin_texture_mode =
    foreign "BeginTextureMode" (Types.RenderTexture2D.t @-> returning void)

  (*  Ends drawing to render texture *)
  let end_texture_mode = foreign "EndTextureMode" (void @-> returning void)

  (*  Begin scissor mode (define screen area for following drawing) *)
  let begin_scissor_mode =
    foreign "BeginScissorMode" (int @-> int @-> int @-> int @-> returning void)

  (*  End scissor mode *)
  let end_scissor_mode = foreign "EndScissorMode" (void @-> returning void)

  (* Screen-space-related functions *)
  (*  Returns a ray trace from mouse position *)
  let get_mouse_ray =
    foreign "GetMouseRay"
      (Types.Vector2.t @-> Types.Camera3D.t @-> returning Types.Ray.t)

  (*  Returns camera transform matrix (view matrix) *)
  let get_camera_matrix =
    foreign "GetCameraMatrix" (Types.Camera3D.t @-> returning Types.Matrix.t)

  (*  Returns camera 2d transform matrix *)
  let get_camera_matrix_2d =
    foreign "GetCameraMatrix2D" (Types.Camera2D.t @-> returning Types.Matrix.t)

  (*  Returns the screen space position for a 3d world space position *)
  let get_world_to_screen =
    foreign "GetWorldToScreen"
      (Types.Vector3.t @-> Types.Camera3D.t @-> returning Types.Vector2.t)

  (*  Returns size position for a 3d world space position *)
  let get_world_to_screen_ex =
    foreign "GetWorldToScreenEx"
      ( Types.Vector3.t @-> Types.Camera3D.t @-> int @-> int
      @-> returning Types.Vector2.t )

  (*  Returns the screen space position for a 2d camera world space position *)
  let get_world_to_screen_2d =
    foreign "GetWorldToScreen2D"
      (Types.Vector2.t @-> Types.Camera2D.t @-> returning Types.Vector2.t)

  (*  Returns the world space position for a 2d camera screen space position *)
  let get_screen_to_world_2d =
    foreign "GetScreenToWorld2D"
      (Types.Vector2.t @-> Types.Camera2D.t @-> returning Types.Vector2.t)

  (* Timing-related functions *)
  (*  Set target FPS (maximum) *)
  let set_target_fps = foreign "SetTargetFPS" (int @-> returning void)

  (*  Returns current FPS *)
  let get_f_p_s = foreign "GetFPS" (void @-> returning int)

  (*  Returns time in seconds for last frame drawn *)
  let get_frame_time = foreign "GetFrameTime" (void @-> returning float)

  (*  Returns elapsed time in seconds since InitWindow() *)
  let get_time = foreign "GetTime" (void @-> returning double)

  (* Color-related functions *)
  (*  Returns hexadecimal value for a Color *)
  let color_to_int = foreign "ColorToInt" (Types.Color.t @-> returning int)

  (*  Returns color normalized as float [0..1] *)
  let color_normalize =
    foreign "ColorNormalize" (Types.Color.t @-> returning Types.Vector4.t)

  (*  Returns color from normalized values [0..1] *)
  let color_from_normalized =
    foreign "ColorFromNormalized" (Types.Vector4.t @-> returning Types.Color.t)

  (*  Returns HSV values for a Color *)
  let color_to_hsv =
    foreign "ColorToHSV" (Types.Color.t @-> returning Types.Vector3.t)

  (*  Returns a Color from HSV values *)
  let color_from_hsv =
    foreign "ColorFromHSV" (Types.Vector3.t @-> returning Types.Color.t)

  (*  Returns a Color struct from hexadecimal value *)
  let get_color = foreign "GetColor" (int @-> returning Types.Color.t)

  (*  Color fade-in or fade-out, alpha goes from 0.0f to 1.0f *)
  let fade = foreign "Fade" (Types.Color.t @-> float @-> returning Types.Color.t)

  (* Misc. functions *)
  (*  Setup window configuration flags (view FLAGS) *)
  let set_config_flags =
    foreign "SetConfigFlags" (Constants.ConfigFlag.t_bitmask @-> returning void)

  (*  Set the current threshold (minimum) log level *)
  let set_trace_log_level =
    foreign "SetTraceLogLevel" (Constants.TraceLogType.t @-> returning void)

  (*  Set the exit threshold (minimum) log level *)
  let set_trace_log_exit =
    foreign "SetTraceLogExit" (Constants.TraceLogType.t @-> returning void)

  (*  Set a trace log callback to enable custom logging *)
  (* let  set_trace_log_callback  = foreign "SetTraceLogCallback" ( TraceLogCallback @-> returning void) *)
  (*  Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR) *)
  let trace_log =
    foreign "TraceLog" (Constants.TraceLogType.t @-> string @-> returning void)

  (*  Takes a screenshot of current screen (saved a .png) *)
  let take_screenshot = foreign "TakeScreenshot" (string @-> returning void)

  (*  Returns a random value between min and max (both included) *)
  let get_random_value = foreign "GetRandomValue" (int @-> int @-> returning int)

  (* Files management functions *)
  (*  Load file data as byte array (read) *)
  let _load_file_data =
    foreign "LoadFileData" (string @-> ptr uint @-> returning (ptr uchar))

  (*  Save data to file from byte array (write) *)
  let _save_file_data =
    foreign "SaveFileData" (string @-> ptr void @-> int @-> returning void)

  (*  Load text data from file (read), returns a '' terminated string *)
  let load_file_text = foreign "LoadFileText" (string @-> returning string)

  (*  Save text data to file (write), string must be '' terminated *)
  let save_file_text =
    foreign "SaveFileText" (string @-> string @-> returning void)

  (*  Check if file exists *)
  let file_exists = foreign "FileExists" (string @-> returning bool)

  (*  Check file extension *)
  let is_file_extension =
    foreign "IsFileExtension" (string @-> string @-> returning bool)

  (*  Check if a directory path exists *)
  let directory_exists = foreign "DirectoryExists" (string @-> returning bool)

  (*  Get pointer to extension for a filename string *)
  let get_extension = foreign "GetExtension" (string @-> returning string)

  (*  Get pointer to filename for a path string *)
  let get_file_name = foreign "GetFileName" (string @-> returning string)

  (*  Get filename string without extension (uses static string) *)
  let get_file_name_without_ext =
    foreign "GetFileNameWithoutExt" (string @-> returning string)

  (*  Get full path for a given fileName with path (uses static string) *)
  let get_directory_path =
    foreign "GetDirectoryPath" (string @-> returning string)

  (*  Get previous directory path for a given path (uses static string) *)
  let get_prev_directory_path =
    foreign "GetPrevDirectoryPath" (string @-> returning string)

  (*  Get current working directory (uses static string) *)
  let get_working_directory =
    foreign "GetWorkingDirectory" (void @-> returning string)

  (*  Get filenames in a directory path (memory should be freed) *)
  let _get_directory_files =
    foreign "GetDirectoryFiles" (string @-> ptr int @-> returning (ptr string))

  (*  Clear directory files paths buffers (free memory) *)
  let clear_directory_files =
    foreign "ClearDirectoryFiles" (void @-> returning void)

  (*  Change working directory, returns true if success *)
  let change_directory = foreign "ChangeDirectory" (string @-> returning bool)

  (*  Check if a file has been dropped into window *)
  let is_file_dropped = foreign "IsFileDropped" (void @-> returning bool)

  (*  Get dropped files names (memory should be freed) *)
  let _get_dropped_files =
    foreign "GetDroppedFiles" (ptr int @-> returning (ptr string))

  (*  Clear dropped files paths buffer (free memory) *)
  let clear_dropped_files = foreign "ClearDroppedFiles" (void @-> returning void)

  (*  Get file modification time (last write time) *)
  let get_file_mod_time = foreign "GetFileModTime" (string @-> returning long)

  (*  Compress data (DEFLATE algorythm) *)
  let _compress_data =
    foreign "CompressData"
      (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  (*  Decompress data (DEFLATE algorythm) *)
  let _decompress_data =
    foreign "DecompressData"
      (ptr uchar @-> int @-> ptr int @-> returning (ptr uchar))

  (* Persistent storage management *)
  (*  Save integer value to storage file (to defined position) *)
  let save_storage_value =
    foreign "SaveStorageValue" (int @-> int @-> returning void)

  (*  Load integer value from storage file (from defined position) *)
  let load_storage_value = foreign "LoadStorageValue" (int @-> returning int)

  (*  Open URL with default system browser (if available) *)
  let open_u_r_l = foreign "OpenURL" (string @-> returning void)

  (*------------------------------------------------------------------------------------ *)
  (* Input Handling Functions (Module: core) *)
  (*------------------------------------------------------------------------------------ *)
  (* Input-related functions: keyboard *)
  (*  Detect if a key has been pressed once *)
  let is_key_pressed =
    foreign "IsKeyPressed" (Constants.KeyboardKey.t @-> returning bool)

  (*  Detect if a key is being pressed *)
  let is_key_down =
    foreign "IsKeyDown" (Constants.KeyboardKey.t @-> returning bool)

  (*  Detect if a key has been released once *)
  let is_key_released =
    foreign "IsKeyReleased" (Constants.KeyboardKey.t @-> returning bool)

  (*  Detect if a key is NOT being pressed *)
  let is_key_up = foreign "IsKeyUp" (Constants.KeyboardKey.t @-> returning bool)

  (*  Set a custom key to exit program (default is ESC) *)
  let set_exit_key =
    foreign "SetExitKey" (Constants.KeyboardKey.t @-> returning void)

  (*  Get key pressed, call it multiple times for chars queued *)
  let get_key_pressed =
    foreign "GetKeyPressed" (void @-> returning Constants.KeyboardKey.t)

  (* Input-related functions: gamepads *)
  (*  Detect if a gamepad is available *)
  let is_gamepad_available =
    foreign "IsGamepadAvailable" (Constants.GamepadNumber.t @-> returning bool)

  (*  Check gamepad name (if available) *)
  let is_gamepad_name =
    foreign "IsGamepadName"
      (Constants.GamepadNumber.t @-> string @-> returning bool)

  (*  Return gamepad internal name id *)
  let get_gamepad_name =
    foreign "GetGamepadName" (Constants.GamepadNumber.t @-> returning string)

  (*  Detect if a gamepad button has been pressed once *)
  let is_gamepad_button_pressed =
    foreign "IsGamepadButtonPressed"
      ( Constants.GamepadNumber.t @-> Constants.GamepadButton.t
      @-> returning bool )

  (*  Detect if a gamepad button is being pressed *)
  let is_gamepad_button_down =
    foreign "IsGamepadButtonDown"
      ( Constants.GamepadNumber.t @-> Constants.GamepadButton.t
      @-> returning bool )

  (*  Detect if a gamepad button has been released once *)
  let is_gamepad_button_released =
    foreign "IsGamepadButtonReleased"
      ( Constants.GamepadNumber.t @-> Constants.GamepadButton.t
      @-> returning bool )

  (*  Detect if a gamepad button is NOT being pressed *)
  let is_gamepad_button_up =
    foreign "IsGamepadButtonUp"
      ( Constants.GamepadNumber.t @-> Constants.GamepadButton.t
      @-> returning bool )

  (*  Get the last gamepad button pressed *)
  let get_gamepad_button_pressed =
    foreign "GetGamepadButtonPressed"
      (void @-> returning Constants.GamepadButton.t)

  (*  Return gamepad axis count for a gamepad *)
  let get_gamepad_axis_count =
    foreign "GetGamepadAxisCount" (Constants.GamepadNumber.t @-> returning int)

  (*  Return axis movement value for a gamepad axis *)
  let get_gamepad_axis_movement =
    foreign "GetGamepadAxisMovement"
      (Constants.GamepadNumber.t @-> Constants.GamepadAxis.t @-> returning float)

  (* Input-related functions: mouse *)
  (*  Detect if a mouse button has been pressed once *)
  let is_mouse_button_pressed =
    foreign "IsMouseButtonPressed" (Constants.MouseButton.t @-> returning bool)

  (*  Detect if a mouse button is being pressed *)
  let is_mouse_button_down =
    foreign "IsMouseButtonDown" (Constants.MouseButton.t @-> returning bool)

  (*  Detect if a mouse button has been released once *)
  let is_mouse_button_released =
    foreign "IsMouseButtonReleased" (Constants.MouseButton.t @-> returning bool)

  (*  Detect if a mouse button is NOT being pressed *)
  let is_mouse_button_up =
    foreign "IsMouseButtonUp" (Constants.MouseButton.t @-> returning bool)

  (*  Returns mouse position X *)
  let get_mouse_x = foreign "GetMouseX" (void @-> returning int)

  (*  Returns mouse position Y *)
  let get_mouse_y = foreign "GetMouseY" (void @-> returning int)

  (*  Returns mouse position XY *)
  let get_mouse_position =
    foreign "GetMousePosition" (void @-> returning Types.Vector2.t)

  (*  Set mouse position XY *)
  let set_mouse_position =
    foreign "SetMousePosition" (int @-> int @-> returning void)

  (*  Set mouse offset *)
  let set_mouse_offset =
    foreign "SetMouseOffset" (int @-> int @-> returning void)

  (*  Set mouse scaling *)
  let set_mouse_scale =
    foreign "SetMouseScale" (float @-> float @-> returning void)

  (*  Returns mouse wheel movement Y *)
  let get_mouse_wheel_move = foreign "GetMouseWheelMove" (void @-> returning int)

  (* Input-related functions: touch *)
  (*  Returns touch position X for touch point 0 (relative to screen size) *)
  let get_touch_x = foreign "GetTouchX" (void @-> returning int)

  (*  Returns touch position Y for touch point 0 (relative to screen size) *)
  let get_touch_y = foreign "GetTouchY" (void @-> returning int)

  (*  Returns touch position XY for a touch point index (relative to screen size) *)
  let get_touch_position =
    foreign "GetTouchPosition" (int @-> returning Types.Vector2.t)

  (* Gestures and Touch Handling Functions (Module: gestures) *)

  (*  Enable a set of gestures using flags *)
  (* let  set_gestures_enabled  = foreign "SetGesturesEnabled" ( unsigned @-> returning void) *)
  (*  Check if a gesture have been detected *)
  let is_gesture_detected = foreign "IsGestureDetected" (int @-> returning bool)

  (*  Get latest detected gesture *)
  let get_gesture_detected =
    foreign "GetGestureDetected" (void @-> returning int)

  (*  Get touch points count *)
  let get_touch_points_count =
    foreign "GetTouchPointsCount" (void @-> returning int)

  (*  Get gesture hold time in milliseconds *)
  let get_gesture_hold_duration =
    foreign "GetGestureHoldDuration" (void @-> returning float)

  (*  Get gesture drag vector *)
  let get_gesture_drag_vector =
    foreign "GetGestureDragVector" (void @-> returning Types.Vector2.t)

  (*  Get gesture drag angle *)
  let get_gesture_drag_angle =
    foreign "GetGestureDragAngle" (void @-> returning float)

  (*  Get gesture pinch delta *)
  let get_gesture_pinch_vector =
    foreign "GetGesturePinchVector" (void @-> returning Types.Vector2.t)

  (*  Get gesture pinch angle *)
  let get_gesture_pinch_angle =
    foreign "GetGesturePinchAngle" (void @-> returning float)

  (* Camera System Functions (Module: camera) *)

  (*  Set camera mode (multiple camera modes available) *)
  let set_camera_mode =
    foreign "SetCameraMode"
      (Types.Camera3D.t @-> Constants.CameraMode.t @-> returning void)

  (*  Update camera position for selected mode *)
  let update_camera =
    foreign "UpdateCamera" (ptr Types.Camera3D.t @-> returning void)

  (*  Set camera pan key to combine with mouse movement (free camera) *)
  let set_camera_pan_control =
    foreign "SetCameraPanControl" (int @-> returning void)

  (*  Set camera alt key to combine with mouse movement (free camera) *)
  let set_camera_alt_control =
    foreign "SetCameraAltControl" (int @-> returning void)

  (*  Set camera smooth zoom key to combine with mouse (free camera) *)
  let set_camera_smooth_zoom_control =
    foreign "SetCameraSmoothZoomControl" (int @-> returning void)

  (*  Set camera move controls (1st person and 3rd person cameras) *)
  let set_camera_move_controls =
    foreign "SetCameraMoveControls"
      (int @-> int @-> int @-> int @-> int @-> int @-> returning void)

  (* Basic Shapes Drawing Functions (Module: shapes) *)

  (* Basic shapes drawing functions *)
  (*  Draw a pixel *)
  let draw_pixel =
    foreign "DrawPixel" (int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a pixel (Vector version) *)
  let draw_pixel_v =
    foreign "DrawPixelV" (Types.Vector2.t @-> Types.Color.t @-> returning void)

  (*  Draw a line *)
  let draw_line =
    foreign "DrawLine"
      (int @-> int @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a line (Vector version) *)
  let draw_line_v =
    foreign "DrawLineV"
      (Types.Vector2.t @-> Types.Vector2.t @-> Types.Color.t @-> returning void)

  (*  Draw a line defining thickness *)
  let draw_line_ex =
    foreign "DrawLineEx"
      ( Types.Vector2.t @-> Types.Vector2.t @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw a line using cubic-bezier curves in-out *)
  let draw_line_bezier =
    foreign "DrawLineBezier"
      ( Types.Vector2.t @-> Types.Vector2.t @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw lines sequence *)
  let draw_line_strip =
    foreign "DrawLineStrip"
      (ptr Types.Vector2.t @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a color-filled circle *)
  let draw_circle =
    foreign "DrawCircle"
      (int @-> int @-> float @-> Types.Color.t @-> returning void)

  (*  Draw a piece of a circle *)
  let draw_circle_sector =
    foreign "DrawCircleSector"
      ( Types.Vector2.t @-> float @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw circle sector outline *)
  let draw_circle_sector_lines =
    foreign "DrawCircleSectorLines"
      ( Types.Vector2.t @-> float @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a gradient-filled circle *)
  let draw_circle_gradient =
    foreign "DrawCircleGradient"
      ( int @-> int @-> float @-> Types.Color.t @-> Types.Color.t
      @-> returning void )

  (*  Draw a color-filled circle (Vector version) *)
  let draw_circle_v =
    foreign "DrawCircleV"
      (Types.Vector2.t @-> float @-> Types.Color.t @-> returning void)

  (*  Draw circle outline *)
  let draw_circle_lines =
    foreign "DrawCircleLines"
      (int @-> int @-> float @-> Types.Color.t @-> returning void)

  (*  Draw ellipse *)
  let draw_ellipse =
    foreign "DrawEllipse"
      (int @-> int @-> float @-> float @-> Types.Color.t @-> returning void)

  (*  Draw ellipse outline *)
  let draw_ellipse_lines =
    foreign "DrawEllipseLines"
      (int @-> int @-> float @-> float @-> Types.Color.t @-> returning void)

  (*  Draw ring *)
  let draw_ring =
    foreign "DrawRing"
      ( Types.Vector2.t @-> float @-> float @-> int @-> int @-> int
      @-> Types.Color.t @-> returning void )

  (*  Draw ring outline *)
  let draw_ring_lines =
    foreign "DrawRingLines"
      ( Types.Vector2.t @-> float @-> float @-> int @-> int @-> int
      @-> Types.Color.t @-> returning void )

  (*  Draw a color-filled rectangle *)
  let draw_rectangle =
    foreign "DrawRectangle"
      (int @-> int @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a color-filled rectangle (Vector version) *)
  let draw_rectangle_v =
    foreign "DrawRectangleV"
      (Types.Vector2.t @-> Types.Vector2.t @-> Types.Color.t @-> returning void)

  (*  Draw a color-filled rectangle *)
  let draw_rectangle_rec =
    foreign "DrawRectangleRec"
      (Types.Rectangle.t @-> Types.Color.t @-> returning void)

  (*  Draw a color-filled rectangle with pro parameters *)
  let draw_rectangle_pro =
    foreign "DrawRectanglePro"
      ( Types.Rectangle.t @-> Types.Vector2.t @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw a vertical-gradient-filled rectangle *)
  let draw_rectangle_gradient_v =
    foreign "DrawRectangleGradientV"
      ( int @-> int @-> int @-> int @-> Types.Color.t @-> Types.Color.t
      @-> returning void )

  (*  Draw a horizontal-gradient-filled rectangle *)
  let draw_rectangle_gradient_h =
    foreign "DrawRectangleGradientH"
      ( int @-> int @-> int @-> int @-> Types.Color.t @-> Types.Color.t
      @-> returning void )

  (*  Draw a gradient-filled rectangle with custom vertex colors *)
  let draw_rectangle_gradient_ex =
    foreign "DrawRectangleGradientEx"
      ( Types.Rectangle.t @-> Types.Color.t @-> Types.Color.t @-> Types.Color.t
      @-> Types.Color.t @-> returning void )

  (*  Draw rectangle outline *)
  let draw_rectangle_lines =
    foreign "DrawRectangleLines"
      (int @-> int @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw rectangle outline with extended parameters *)
  let draw_rectangle_lines_ex =
    foreign "DrawRectangleLinesEx"
      (Types.Rectangle.t @-> int @-> Types.Color.t @-> returning void)

  (*  Draw rectangle with rounded edges *)
  let draw_rectangle_rounded =
    foreign "DrawRectangleRounded"
      (Types.Rectangle.t @-> float @-> int @-> Types.Color.t @-> returning void)

  (*  Draw rectangle with rounded edges outline *)
  let draw_rectangle_rounded_lines =
    foreign "DrawRectangleRoundedLines"
      ( Types.Rectangle.t @-> float @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a color-filled triangle (vertex in counter-clockwise order!) *)
  let draw_triangle =
    foreign "DrawTriangle"
      ( Types.Vector2.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Color.t @-> returning void )

  (*  Draw triangle outline (vertex in counter-clockwise order!) *)
  let draw_triangle_lines =
    foreign "DrawTriangleLines"
      ( Types.Vector2.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Color.t @-> returning void )

  (*  Draw a triangle fan defined by points (first vertex is the center) *)
  let draw_triangle_fan =
    foreign "DrawTriangleFan"
      (ptr Types.Vector2.t @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a triangle strip defined by points *)
  let draw_triangle_strip =
    foreign "DrawTriangleStrip"
      (ptr Types.Vector2.t @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a regular polygon (Vector version) *)
  let draw_poly =
    foreign "DrawPoly"
      ( Types.Vector2.t @-> int @-> float @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw a polygon outline of n sides *)
  let draw_poly_lines =
    foreign "DrawPolyLines"
      ( Types.Vector2.t @-> int @-> float @-> float @-> Types.Color.t
      @-> returning void )

  (* Basic shapes collision detection functions *)
  (*  Check collision between two rectangles *)
  let check_collision_recs =
    foreign "CheckCollisionRecs"
      (Types.Rectangle.t @-> Types.Rectangle.t @-> returning bool)

  (*  Check collision between two circles *)
  let check_collision_circles =
    foreign "CheckCollisionCircles"
      ( Types.Vector2.t @-> float @-> Types.Vector2.t @-> float
      @-> returning bool )

  (*  Check collision between circle and rectangle *)
  let check_collision_circle_rec =
    foreign "CheckCollisionCircleRec"
      (Types.Vector2.t @-> float @-> Types.Rectangle.t @-> returning bool)

  (*  Get collision rectangle for two rectangles collision *)
  let get_collision_rec =
    foreign "GetCollisionRec"
      (Types.Rectangle.t @-> Types.Rectangle.t @-> returning Types.Rectangle.t)

  (*  Check if point is inside rectangle *)
  let check_collision_point_rec =
    foreign "CheckCollisionPointRec"
      (Types.Vector2.t @-> Types.Rectangle.t @-> returning bool)

  (*  Check if point is inside circle *)
  let check_collision_point_circle =
    foreign "CheckCollisionPointCircle"
      (Types.Vector2.t @-> Types.Vector2.t @-> float @-> returning bool)

  (*  Check if point is inside a triangle *)
  let check_collision_point_triangle =
    foreign "CheckCollisionPointTriangle"
      ( Types.Vector2.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Vector2.t @-> returning bool )

  (* Texture Loading and Drawing Functions (Module: textures) *)

  (* Image loading functions *)
  (* NOTE: This functions do not require GPU access *)
  (*  Load image from file into CPU memory (RAM) *)
  let load_image = foreign "LoadImage" (string @-> returning Types.Image.t)

  (*  Load image from Color array data (RGBA - 32bit) *)
  let load_image_ex =
    foreign "LoadImageEx"
      (ptr Types.Color.t @-> int @-> int @-> returning Types.Image.t)

  (*  Load image from raw data with parameters *)
  let load_image_pro =
    foreign "LoadImagePro"
      (ptr void @-> int @-> int @-> int @-> returning Types.Image.t)

  (*  Load image from RAW file data *)
  let load_image_raw =
    foreign "LoadImageRaw"
      (string @-> int @-> int @-> int @-> int @-> returning Types.Image.t)

  (*  Unload image from CPU memory (RAM) *)
  let unload_image = foreign "UnloadImage" (Types.Image.t @-> returning void)

  (*  Export image data to file *)
  let export_image =
    foreign "ExportImage" (Types.Image.t @-> string @-> returning void)

  (*  Export image as code file defining an array of bytes *)
  let export_image_as_code =
    foreign "ExportImageAsCode" (Types.Image.t @-> string @-> returning void)

  (*  Get pixel data from image as a Color struct array *)
  (* let  *_get_image_data  = foreign "*GetImageData" ( Types.Image.t @-> returning Types.Color.t) *)
  (*  Get pixel data from image as Vector4 array (float normalized) *)
  (* let  *_get_image_data_normalized  = foreign "*GetImageDataNormalized" ( Types.Image.t @-> returning Vector4) *)
  (* Image generation functions *)
  (*  Generate image: plain color *)
  let gen_image_color =
    foreign "GenImageColor"
      (int @-> int @-> Types.Color.t @-> returning Types.Image.t)

  (*  Generate image: vertical gradient *)
  let gen_image_gradient_v =
    foreign "GenImageGradientV"
      ( int @-> int @-> Types.Color.t @-> Types.Color.t
      @-> returning Types.Image.t )

  (*  Generate image: horizontal gradient *)
  let gen_image_gradient_h =
    foreign "GenImageGradientH"
      ( int @-> int @-> Types.Color.t @-> Types.Color.t
      @-> returning Types.Image.t )

  (*  Generate image: radial gradient *)
  let gen_image_gradient_radial =
    foreign "GenImageGradientRadial"
      ( int @-> int @-> float @-> Types.Color.t @-> Types.Color.t
      @-> returning Types.Image.t )

  (*  Generate image: checked *)
  let gen_image_checked =
    foreign "GenImageChecked"
      ( int @-> int @-> int @-> int @-> Types.Color.t @-> Types.Color.t
      @-> returning Types.Image.t )

  (*  Generate image: white noise *)
  let gen_image_white_noise =
    foreign "GenImageWhiteNoise"
      (int @-> int @-> float @-> returning Types.Image.t)

  (*  Generate image: perlin noise *)
  let gen_image_perlin_noise =
    foreign "GenImagePerlinNoise"
      (int @-> int @-> int @-> int @-> float @-> returning Types.Image.t)

  (*  Generate image: cellular algorithm. Bigger tileSize means bigger cells *)
  let gen_image_cellular =
    foreign "GenImageCellular" (int @-> int @-> int @-> returning Types.Image.t)

  (* Image manipulation functions *)
  (*  Create an image duplicate (useful for transformations) *)
  let image_copy =
    foreign "ImageCopy" (Types.Image.t @-> returning Types.Image.t)

  (*  Create an image from another image piece *)
  let image_from_image =
    foreign "ImageFromImage"
      (Types.Image.t @-> Types.Rectangle.t @-> returning Types.Image.t)

  (*  Create an image from text (default font) *)
  let image_text =
    foreign "ImageText"
      (string @-> int @-> Types.Color.t @-> returning Types.Image.t)

  (*  Create an image from text (custom sprite font) *)
  let image_text_ex =
    foreign "ImageTextEx"
      ( Types.Font.t @-> string @-> float @-> float @-> Types.Color.t
      @-> returning Types.Image.t )

  (*  Convert image to POT (power-of-two) *)
  let image_to_p_o_t =
    foreign "ImageToPOT" (ptr Types.Image.t @-> Types.Color.t @-> returning void)

  (*  Convert image data to desired format *)
  let image_format =
    foreign "ImageFormat" (ptr Types.Image.t @-> int @-> returning void)

  (*  Apply alpha mask to image *)
  let image_alpha_mask =
    foreign "ImageAlphaMask"
      (ptr Types.Image.t @-> Types.Image.t @-> returning void)

  (*  Clear alpha channel to desired color *)
  let image_alpha_clear =
    foreign "ImageAlphaClear"
      (ptr Types.Image.t @-> Types.Color.t @-> float @-> returning void)

  (*  Crop image depending on alpha value *)
  let image_alpha_crop =
    foreign "ImageAlphaCrop" (ptr Types.Image.t @-> float @-> returning void)

  (*  Premultiply alpha channel *)
  let image_alpha_premultiply =
    foreign "ImageAlphaPremultiply" (ptr Types.Image.t @-> returning void)

  (*  Crop an image to a defined rectangle *)
  let image_crop =
    foreign "ImageCrop"
      (ptr Types.Image.t @-> Types.Rectangle.t @-> returning void)

  (*  Resize image (Bicubic scaling algorithm) *)
  let image_resize =
    foreign "ImageResize" (ptr Types.Image.t @-> int @-> int @-> returning void)

  (*  Resize image (Nearest-Neighbor scaling algorithm) *)
  let image_resize_n_n =
    foreign "ImageResizeNN"
      (ptr Types.Image.t @-> int @-> int @-> returning void)

  (*  Resize canvas and fill with color *)
  let image_resize_canvas =
    foreign "ImageResizeCanvas"
      ( ptr Types.Image.t @-> int @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Generate all mipmap levels for a provided image *)
  let image_mipmaps =
    foreign "ImageMipmaps" (ptr Types.Image.t @-> returning void)

  (*  Dither image data to 16bpp or lower (Floyd-Steinberg dithering) *)
  let image_dither =
    foreign "ImageDither"
      (ptr Types.Image.t @-> int @-> int @-> int @-> int @-> returning void)

  (*  Flip image vertically *)
  let image_flip_vertical =
    foreign "ImageFlipVertical" (ptr Types.Image.t @-> returning void)

  (*  Flip image horizontally *)
  let image_flip_horizontal =
    foreign "ImageFlipHorizontal" (ptr Types.Image.t @-> returning void)

  (*  Rotate image clockwise 90deg *)
  let image_rotate_c_w =
    foreign "ImageRotateCW" (ptr Types.Image.t @-> returning void)

  (*  Rotate image counter-clockwise 90deg *)
  let image_rotate_c_c_w =
    foreign "ImageRotateCCW" (ptr Types.Image.t @-> returning void)

  (*  Modify image color: tint *)
  let image_color_tint =
    foreign "ImageColorTint"
      (ptr Types.Image.t @-> Types.Color.t @-> returning void)

  (*  Modify image color: invert *)
  let image_color_invert =
    foreign "ImageColorInvert" (ptr Types.Image.t @-> returning void)

  (*  Modify image color: grayscale *)
  let image_color_grayscale =
    foreign "ImageColorGrayscale" (ptr Types.Image.t @-> returning void)

  (*  Modify image color: contrast (-100 to 100) *)
  let image_color_contrast =
    foreign "ImageColorContrast" (ptr Types.Image.t @-> float @-> returning void)

  (*  Modify image color: brightness (-255 to 255) *)
  let image_color_brightness =
    foreign "ImageColorBrightness" (ptr Types.Image.t @-> int @-> returning void)

  (*  Modify image color: replace color *)
  let image_color_replace =
    foreign "ImageColorReplace"
      (ptr Types.Image.t @-> Types.Color.t @-> Types.Color.t @-> returning void)

  (*  Extract color palette from image to maximum size (memory should be freed) *)
  (* let  *_image_extract_palette  = foreign "*ImageExtractPalette" ( Types.Image.t @-> int @-> int @-> returning Types.Color.t) *)
  (*  Get image alpha border rectangle *)
  let get_image_alpha_border =
    foreign "GetImageAlphaBorder"
      (Types.Image.t @-> float @-> returning Types.Rectangle.t)

  (* Image drawing functions *)
  (* NOTE: Image software-rendering functions (CPU) *)
  (*  Clear image background with given color *)
  let image_clear_background =
    foreign "ImageClearBackground"
      (ptr Types.Image.t @-> Types.Color.t @-> returning void)

  (*  Draw pixel within an image *)
  let image_draw_pixel =
    foreign "ImageDrawPixel"
      (ptr Types.Image.t @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw pixel within an image (Vector version) *)
  let image_draw_pixel_v =
    foreign "ImageDrawPixelV"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> Types.Color.t
      @-> returning void )

  (*  Draw line within an image *)
  let image_draw_line =
    foreign "ImageDrawLine"
      ( ptr Types.Image.t @-> int @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw line within an image (Vector version) *)
  let image_draw_line_v =
    foreign "ImageDrawLineV"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Color.t @-> returning void )

  (*  Draw circle within an image *)
  let image_draw_circle =
    foreign "ImageDrawCircle"
      ( ptr Types.Image.t @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw circle within an image (Vector version) *)
  let image_draw_circle_v =
    foreign "ImageDrawCircleV"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw rectangle within an image *)
  let image_draw_rectangle =
    foreign "ImageDrawRectangle"
      ( ptr Types.Image.t @-> int @-> int @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw rectangle within an image (Vector version) *)
  let image_draw_rectangle_v =
    foreign "ImageDrawRectangleV"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Color.t @-> returning void )

  (*  Draw rectangle within an image  *)
  let image_draw_rectangle_rec =
    foreign "ImageDrawRectangleRec"
      ( ptr Types.Image.t @-> Types.Rectangle.t @-> Types.Color.t
      @-> returning void )

  (*  Draw rectangle lines within an image *)
  let image_draw_rectangle_lines =
    foreign "ImageDrawRectangleLines"
      ( ptr Types.Image.t @-> Types.Rectangle.t @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a source image within a destination image (tint applied to source) *)
  let image_draw =
    foreign "ImageDraw"
      ( ptr Types.Image.t @-> Types.Image.t @-> Types.Rectangle.t
      @-> Types.Rectangle.t @-> Types.Color.t @-> returning void )

  (*  Draw text (default font) within an image (destination) *)
  let image_draw_text =
    foreign "ImageDrawText"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> string @-> int
      @-> Types.Color.t @-> returning void )

  (*  Draw text (custom sprite font) within an image (destination) *)
  let image_draw_text_ex =
    foreign "ImageDrawTextEx"
      ( ptr Types.Image.t @-> Types.Vector2.t @-> Types.Font.t @-> string
      @-> float @-> float @-> Types.Color.t @-> returning void )

  (* Texture loading functions *)
  (* NOTE: These functions require GPU access *)
  (*  Load texture from file into GPU memory (VRAM) *)
  let load_texture =
    foreign "LoadTexture" (string @-> returning Types.Texture2D.t)

  (*  Load texture from image data *)
  let load_texture_from_image =
    foreign "LoadTextureFromImage"
      (Types.Image.t @-> returning Types.Texture2D.t)

  (*  Load cubemap from image, multiple image cubemap layouts supported *)
  let load_texture_cubemap =
    foreign "LoadTextureCubemap"
      (Types.Image.t @-> int @-> returning Types.Texture2D.t)

  (*  Load texture for rendering (framebuffer) *)
  let load_render_texture =
    foreign "LoadRenderTexture"
      (int @-> int @-> returning Types.RenderTexture2D.t)

  (*  Unload texture from GPU memory (VRAM) *)
  let unload_texture =
    foreign "UnloadTexture" (Types.Texture2D.t @-> returning void)

  (*  Unload render texture from GPU memory (VRAM) *)
  let unload_render_texture =
    foreign "UnloadRenderTexture" (Types.RenderTexture2D.t @-> returning void)

  (*  Update GPU texture with new data *)
  let update_texture =
    foreign "UpdateTexture" (Types.Texture2D.t @-> ptr void @-> returning void)

  (*  Get pixel data from GPU texture and return an Image *)
  let get_texture_data =
    foreign "GetTextureData" (Types.Texture2D.t @-> returning Types.Image.t)

  (*  Get pixel data from screen buffer and return an Image (screenshot) *)
  let get_screen_data =
    foreign "GetScreenData" (void @-> returning Types.Image.t)

  (* Texture configuration functions *)
  (*  Generate GPU mipmaps for a texture *)
  let gen_texture_mipmaps =
    foreign "GenTextureMipmaps" (ptr Types.Texture2D.t @-> returning void)

  (*  Set texture scaling filter mode *)
  let set_texture_filter =
    foreign "SetTextureFilter"
      (Types.Texture2D.t @-> Constants.TextureFilterMode.t @-> returning void)

  (*  Set texture wrapping mode *)
  let set_texture_wrap =
    foreign "SetTextureWrap"
      (Types.Texture2D.t @-> Constants.TextureWrapMode.t @-> returning void)

  (* Texture drawing functions *)
  (*  Draw a Texture2D *)
  let draw_texture =
    foreign "DrawTexture"
      (Types.Texture2D.t @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw a Texture2D with position defined as Vector2 *)
  let draw_texture_v =
    foreign "DrawTextureV"
      ( Types.Texture2D.t @-> Types.Vector2.t @-> Types.Color.t
      @-> returning void )

  (*  Draw a Texture2D with extended parameters *)
  let draw_texture_ex =
    foreign "DrawTextureEx"
      ( Types.Texture2D.t @-> Types.Vector2.t @-> float @-> float
      @-> Types.Color.t @-> returning void )

  (*  Draw a part of a texture defined by a rectangle *)
  let draw_texture_rec =
    foreign "DrawTextureRec"
      ( Types.Texture2D.t @-> Types.Rectangle.t @-> Types.Vector2.t
      @-> Types.Color.t @-> returning void )

  (*  Draw texture quad with tiling and offset parameters *)
  let draw_texture_quad =
    foreign "DrawTextureQuad"
      ( Types.Texture2D.t @-> Types.Vector2.t @-> Types.Vector2.t
      @-> Types.Rectangle.t @-> Types.Color.t @-> returning void )

  (*  Draw a part of a texture defined by a rectangle with 'pro' parameters *)
  let draw_texture_pro =
    foreign "DrawTexturePro"
      ( Types.Texture2D.t @-> Types.Rectangle.t @-> Types.Rectangle.t
      @-> Types.Vector2.t @-> float @-> Types.Color.t @-> returning void )

  (*  Draws a texture (or part of it) that stretches or shrinks nicely *)
  (* let  draw_texture_n_patch  = foreign "DrawTextureNPatch" ( Types.Texture2D.t @-> NPatch @-> Types.Rectangle.t @-> Types.Vector2.t @-> float @-> Types.Color.t @-> returning void) *)
  (* Image/Texture misc functions *)
  (*  Get pixel data size in bytes (image or texture) *)
  let get_pixel_data_size =
    foreign "GetPixelDataSize" (int @-> int @-> int @-> returning int)

  (* Font Loading and Text Drawing Functions (Module: text) *)

  (* Font loading/unloading functions *)
  (*  Get the default Font *)
  let get_font_default =
    foreign "GetFontDefault" (void @-> returning Types.Font.t)

  (*  Load font from file into GPU memory (VRAM) *)
  let load_font = foreign "LoadFont" (string @-> returning Types.Font.t)

  (*  Load font from file with extended parameters *)
  let load_font_ex =
    foreign "LoadFontEx"
      (string @-> int @-> ptr int @-> int @-> returning Types.Font.t)

  (*  Load font from Image (XNA style) *)
  let load_font_from_image =
    foreign "LoadFontFromImage"
      (Types.Image.t @-> Types.Color.t @-> int @-> returning Types.Font.t)

  (*  Load font data for further use *)
  let load_font_data =
    foreign "LoadFontData"
      ( string @-> int @-> ptr int @-> int @-> int
      @-> returning (ptr Types.CharInfo.t) )

  (*  Generate image font atlas using chars info *)
  (* let  gen_image_font_atlas  = foreign "GenImageFontAtlas" ( (ptr Types.CharInfo.t) @-> Types.Rectangle.t @-> int @-> int @-> int @-> int @-> returning Types.Image.t) *)
  (*  Unload Font from GPU memory (VRAM) *)
  let unload_font = foreign "UnloadFont" (Types.Font.t @-> returning void)

  (* Text drawing functions *)
  (*  Shows current FPS *)
  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  (*  Draw text (using default font) *)
  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Types.Color.t @-> returning void)

  (*  Draw text using font and additional parameters *)
  let draw_text_ex =
    foreign "DrawTextEx"
      ( Types.Font.t @-> string @-> Types.Vector2.t @-> float @-> float
      @-> Types.Color.t @-> returning void )

  (*  Draw text using font inside rectangle limits *)
  let draw_text_rec =
    foreign "DrawTextRec"
      ( Types.Font.t @-> string @-> Types.Rectangle.t @-> float @-> float
      @-> bool @-> Types.Color.t @-> returning void )

  (*  Draw text using font inside rectangle limits with support for text selection *)
  let draw_text_rec_ex =
    foreign "DrawTextRecEx"
      ( Types.Font.t @-> string @-> Types.Rectangle.t @-> float @-> float
      @-> bool @-> Types.Color.t @-> int @-> int @-> Types.Color.t
      @-> Types.Color.t @-> returning void )

  (*  Draw one character (codepoint) *)
  let draw_text_codepoint =
    foreign "DrawTextCodepoint"
      ( Types.Font.t @-> int @-> Types.Vector2.t @-> float @-> Types.Color.t
      @-> returning void )

  (* Text misc. functions *)
  (*  Measure string width for default font *)
  let measure_text = foreign "MeasureText" (string @-> int @-> returning int)

  (*  Measure string size for Font *)
  let measure_text_ex =
    foreign "MeasureTextEx"
      (Types.Font.t @-> string @-> float @-> float @-> returning Types.Vector2.t)

  (*  Get index position for a unicode character on font *)
  let get_glyph_index =
    foreign "GetGlyphIndex" (Types.Font.t @-> int @-> returning int)

  (* Text strings management functions (no utf8 strings, only byte chars) *)
  (* NOTE: Some strings allocate memory internally for returned strings, just be careful! *)
  (*  Copy one string to another, returns bytes copied *)
  let text_copy = foreign "TextCopy" (string @-> string @-> returning int)

  (*  Check if two text string are equal *)
  let text_is_equal =
    foreign "TextIsEqual" (string @-> string @-> returning bool)

  (*  Get text length, checks for '' ending *)
  let text_length = foreign "TextLength" (string @-> returning int)

  (*  Text formatting with variables (sprintf style) *)
  (* let  text_format  = foreign "TextFormat" ( string @-> ... @-> returning string) *)
  (*  Get a piece of a text string *)
  let text_subtext =
    foreign "TextSubtext" (string @-> int @-> int @-> returning string)

  (*  Replace text string (memory must be freed!) *)
  let text_replace =
    foreign "TextReplace" (string @-> string @-> string @-> returning string)

  (*  Insert text in a position (memory must be freed!) *)
  let text_insert =
    foreign "TextInsert" (string @-> string @-> int @-> returning string)

  (*  Join text strings with delimiter *)
  (* let text_join =
   *   foreign "TextJoin" (ptr string @-> int @-> string @-> returning string) *)

  (*  Split text into multiple strings *)
  (* let  text_split  = foreign "*TextSplit" ( string @-> char @-> int @-> returning string) *)
  (*  Append text at specific position and move cursor! *)
  let text_append =
    foreign "TextAppend" (string @-> string @-> ptr int @-> returning void)

  (*  Find first text occurrence within a string *)
  let text_find_index =
    foreign "TextFindIndex" (string @-> string @-> returning int)

  (*  Get upper case version of provided string *)
  let text_to_upper = foreign "TextToUpper" (string @-> returning string)

  (*  Get lower case version of provided string *)
  let text_to_lower = foreign "TextToLower" (string @-> returning string)

  (*  Get Pascal case notation version of provided string *)
  let text_to_pascal = foreign "TextToPascal" (string @-> returning string)

  (*  Get integer value from text (negative values not supported) *)
  let text_to_integer = foreign "TextToInteger" (string @-> returning int)

  (*  Encode text codepoint into utf8 text (memory must be freed!) *)
  let text_to_utf8 = foreign "TextToUtf8" (ptr int @-> int @-> returning string)

  (* UTF8 text strings management functions *)
  (*  Get all codepoints in a string, codepoints count returned by parameters *)
  let get_codepoints =
    foreign "GetCodepoints" (string @-> ptr int @-> returning (ptr int))

  (*  Get total number of characters (codepoints) in a UTF8 encoded string *)
  let get_codepoints_count =
    foreign "GetCodepointsCount" (string @-> returning int)

  (*  Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure *)
  let get_next_codepoint =
    foreign "GetNextCodepoint" (string @-> ptr int @-> returning int)

  (*  Encode codepoint into utf8 text (char array length returned as parameter) *)
  let codepoint_to_utf8 =
    foreign "CodepointToUtf8" (int @-> ptr int @-> returning string)

  (* Basic 3d Shapes Drawing Functions (Module: models) *)

  (* Basic geometric 3D shapes drawing functions *)
  (*  Draw a line in 3D world space *)
  let draw_line_3d =
    foreign "DrawLine3D"
      (Types.Vector3.t @-> Types.Vector3.t @-> Types.Color.t @-> returning void)

  (*  Draw a point in 3D space, actually a small line *)
  let draw_point_3d =
    foreign "DrawPoint3D" (Types.Vector3.t @-> Types.Color.t @-> returning void)

  (*  Draw a circle in 3D world space *)
  let draw_circle_3d =
    foreign "DrawCircle3D"
      ( Types.Vector3.t @-> float @-> Types.Vector3.t @-> float
      @-> Types.Color.t @-> returning void )

  (*  Draw cube *)
  let draw_cube =
    foreign "DrawCube"
      ( Types.Vector3.t @-> float @-> float @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw cube (Vector version) *)
  let draw_cube_v =
    foreign "DrawCubeV"
      (Types.Vector3.t @-> Types.Vector3.t @-> Types.Color.t @-> returning void)

  (*  Draw cube wires *)
  let draw_cube_wires =
    foreign "DrawCubeWires"
      ( Types.Vector3.t @-> float @-> float @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw cube wires (Vector version) *)
  let draw_cube_wires_v =
    foreign "DrawCubeWiresV"
      (Types.Vector3.t @-> Types.Vector3.t @-> Types.Color.t @-> returning void)

  (*  Draw cube textured *)
  let draw_cube_texture =
    foreign "DrawCubeTexture"
      ( Types.Texture2D.t @-> Types.Vector3.t @-> float @-> float @-> float
      @-> Types.Color.t @-> returning void )

  (*  Draw sphere *)
  let draw_sphere =
    foreign "DrawSphere"
      (Types.Vector3.t @-> float @-> Types.Color.t @-> returning void)

  (*  Draw sphere with extended parameters *)
  let draw_sphere_ex =
    foreign "DrawSphereEx"
      ( Types.Vector3.t @-> float @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw sphere wires *)
  let draw_sphere_wires =
    foreign "DrawSphereWires"
      ( Types.Vector3.t @-> float @-> int @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a cylinder/cone *)
  let draw_cylinder =
    foreign "DrawCylinder"
      ( Types.Vector3.t @-> float @-> float @-> float @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a cylinder/cone wires *)
  let draw_cylinder_wires =
    foreign "DrawCylinderWires"
      ( Types.Vector3.t @-> float @-> float @-> float @-> int @-> Types.Color.t
      @-> returning void )

  (*  Draw a plane XZ *)
  let draw_plane =
    foreign "DrawPlane"
      (Types.Vector3.t @-> Types.Vector2.t @-> Types.Color.t @-> returning void)

  (*  Draw a ray line *)
  (* let  draw_ray  = foreign "DrawRay" ( Ray @-> Types.Color.t @-> returning void) *)
  (*  Draw a grid (centered at (0, 0, 0)) *)
  let draw_grid = foreign "DrawGrid" (int @-> float @-> returning void)

  (*  Draw simple gizmo *)
  let draw_gizmo = foreign "DrawGizmo" (Types.Vector3.t @-> returning void)

  (*DrawTorus(), DrawTeapot() could be useful? *)
  (*------------------------------------------------------------------------------------ *)
  (* Model 3d Loading and Drawing Functions (Module: models) *)
  (*------------------------------------------------------------------------------------ *)
  (* Model loading/unloading functions *)
  (*  Load model from files (meshes and materials) *)
  let load_model = foreign "LoadModel" (string @-> returning Types.Model.t)

  (*  Load model from generated mesh (default material) *)
  let load_model_from_mesh =
    foreign "LoadModelFromMesh" (Types.Mesh.t @-> returning Types.Model.t)

  (*  Unload model from memory (RAM and/or VRAM) *)
  let unload_model = foreign "UnloadModel" (Types.Model.t @-> returning void)

  (* Mesh loading/unloading functions *)
  (*  Load meshes from model file *)
  let load_meshes =
    foreign "LoadMeshes"
      (string @-> ptr int @-> returning (ptr_opt Types.Mesh.t))

  (*  Export mesh data to file *)
  let export_mesh =
    foreign "ExportMesh" (Types.Mesh.t @-> string @-> returning void)

  (*  Unload mesh from memory (RAM and/or VRAM) *)
  let unload_mesh = foreign "UnloadMesh" (Types.Mesh.t @-> returning void)

  (* Material loading/unloading functions *)
  (*  Load materials from model file *)
  let load_materials =
    foreign "LoadMaterials"
      (string @-> ptr int @-> returning (ptr Types.Material.t))

  (*  Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) *)
  let load_material_default =
    foreign "LoadMaterialDefault" (void @-> returning Types.Material.t)

  (*  Unload material from GPU memory (VRAM) *)
  let unload_material =
    foreign "UnloadMaterial" (Types.Material.t @-> returning void)

  (*  Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...) *)
  let set_material_texture =
    foreign "SetMaterialTexture"
      ( ptr Types.Material.t @-> Constants.MaterialMapType.t
      @-> Types.Texture2D.t @-> returning void )

  (*  Set material for a mesh *)
  let set_model_mesh_material =
    foreign "SetModelMeshMaterial"
      (ptr Types.Model.t @-> int @-> int @-> returning void)

  (* Model animations loading/unloading functions *)
  (*  Load model animations from file *)
  let _load_model_animations =
    foreign "LoadModelAnimations"
      (string @-> ptr int @-> returning (ptr Types.ModelAnimation.t))

  (*  Update model animation pose *)
  let update_model_animation =
    foreign "UpdateModelAnimation"
      (Types.Model.t @-> Types.ModelAnimation.t @-> int @-> returning void)

  (*  Unload animation data *)
  let unload_model_animation =
    foreign "UnloadModelAnimation" (Types.ModelAnimation.t @-> returning void)

  (*  Check model animation skeleton match *)
  let is_model_animation_valid =
    foreign "IsModelAnimationValid"
      (Types.Model.t @-> Types.ModelAnimation.t @-> returning bool)

  (* Mesh generation functions *)
  (*  Generate polygonal mesh *)
  let gen_mesh_poly =
    foreign "GenMeshPoly" (int @-> float @-> returning Types.Mesh.t)

  (*  Generate plane mesh (with subdivisions) *)
  let gen_mesh_plane =
    foreign "GenMeshPlane"
      (float @-> float @-> int @-> int @-> returning Types.Mesh.t)

  (*  Generate cuboid mesh *)
  let gen_mesh_cube =
    foreign "GenMeshCube" (float @-> float @-> float @-> returning Types.Mesh.t)

  (*  Generate sphere mesh (standard sphere) *)
  let gen_mesh_sphere =
    foreign "GenMeshSphere" (float @-> int @-> int @-> returning Types.Mesh.t)

  (*  Generate half-sphere mesh (no bottom cap) *)
  let gen_mesh_hemi_sphere =
    foreign "GenMeshHemiSphere"
      (float @-> int @-> int @-> returning Types.Mesh.t)

  (*  Generate cylinder mesh *)
  let gen_mesh_cylinder =
    foreign "GenMeshCylinder"
      (float @-> float @-> int @-> returning Types.Mesh.t)

  (*  Generate torus mesh *)
  let gen_mesh_torus =
    foreign "GenMeshTorus"
      (float @-> float @-> int @-> int @-> returning Types.Mesh.t)

  (*  Generate trefoil knot mesh *)
  let gen_mesh_knot =
    foreign "GenMeshKnot"
      (float @-> float @-> int @-> int @-> returning Types.Mesh.t)

  (*  Generate heightmap mesh from image data *)
  let gen_mesh_heightmap =
    foreign "GenMeshHeightmap"
      (Types.Image.t @-> Types.Vector3.t @-> returning Types.Mesh.t)

  (*  Generate cubes-based map mesh from image data *)
  let gen_mesh_cubicmap =
    foreign "GenMeshCubicmap"
      (Types.Image.t @-> Types.Vector3.t @-> returning Types.Mesh.t)

  (* Mesh manipulation functions *)
  (*  Compute mesh bounding box limits *)
  let mesh_bounding_box =
    foreign "MeshBoundingBox" (Types.Mesh.t @-> returning Types.BoundingBox.t)

  (*  Compute mesh tangents *)
  let mesh_tangents =
    foreign "MeshTangents" (ptr Types.Mesh.t @-> returning void)

  (*  Compute mesh binormals *)
  let mesh_binormals =
    foreign "MeshBinormals" (ptr Types.Mesh.t @-> returning void)

  (* Model drawing functions *)
  (*  Draw a model (with texture if set) *)
  let draw_model =
    foreign "DrawModel"
      ( Types.Model.t @-> Types.Vector3.t @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw a model with extended parameters *)
  let draw_model_ex =
    foreign "DrawModelEx"
      ( Types.Model.t @-> Types.Vector3.t @-> Types.Vector3.t @-> float
      @-> Types.Vector3.t @-> Types.Color.t @-> returning void )

  (*  Draw a model wires (with texture if set) *)
  let draw_model_wires =
    foreign "DrawModelWires"
      ( Types.Model.t @-> Types.Vector3.t @-> float @-> Types.Color.t
      @-> returning void )

  (*  Draw a model wires (with texture if set) with extended parameters *)
  let draw_model_wires_ex =
    foreign "DrawModelWiresEx"
      ( Types.Model.t @-> Types.Vector3.t @-> Types.Vector3.t @-> float
      @-> Types.Vector3.t @-> Types.Color.t @-> returning void )

  (*  Draw bounding box (wires) *)
  let draw_bounding_box =
    foreign "DrawBoundingBox"
      (Types.BoundingBox.t @-> Types.Color.t @-> returning void)

  (*  Draw a billboard texture *)
  let draw_billboard =
    foreign "DrawBillboard"
      ( Types.Camera3D.t @-> Types.Texture2D.t @-> Types.Vector3.t @-> float
      @-> Types.Color.t @-> returning void )

  (*  Draw a billboard texture defined by sourceRec *)
  let draw_billboard_rec =
    foreign "DrawBillboardRec"
      ( Types.Camera3D.t @-> Types.Texture2D.t @-> Types.Rectangle.t
      @-> Types.Vector3.t @-> float @-> Types.Color.t @-> returning void )

  (* Collision detection functions *)
  (*  Detect collision between two spheres *)
  let check_collision_spheres =
    foreign "CheckCollisionSpheres"
      ( Types.Vector3.t @-> float @-> Types.Vector3.t @-> float
      @-> returning bool )

  (*  Detect collision between two bounding boxes *)
  let check_collision_boxes =
    foreign "CheckCollisionBoxes"
      (Types.BoundingBox.t @-> Types.BoundingBox.t @-> returning bool)

  (*  Detect collision between box and sphere *)
  let check_collision_box_sphere =
    foreign "CheckCollisionBoxSphere"
      (Types.BoundingBox.t @-> Types.Vector3.t @-> float @-> returning bool)

  (*  Detect collision between ray and sphere *)
  let check_collision_ray_sphere =
    foreign "CheckCollisionRaySphere"
      (Types.Ray.t @-> Types.Vector3.t @-> float @-> returning bool)

  (*  Detect collision between ray and sphere, returns collision point *)
  let check_collision_ray_sphere_ex =
    foreign "CheckCollisionRaySphereEx"
      ( Types.Ray.t @-> Types.Vector3.t @-> float @-> ptr Types.Vector3.t
      @-> returning bool )

  (*  Detect collision between ray and box *)
  let check_collision_ray_box =
    foreign "CheckCollisionRayBox"
      (Types.Ray.t @-> Types.BoundingBox.t @-> returning bool)

  (*  Get collision info between ray and model *)
  let get_collision_ray_model =
    foreign "GetCollisionRayModel"
      (Types.Ray.t @-> Types.Model.t @-> returning Types.RayHitInfo.t)

  (*  Get collision info between ray and triangle *)
  let get_collision_ray_triangle =
    foreign "GetCollisionRayTriangle"
      ( Types.Ray.t @-> Types.Vector3.t @-> Types.Vector3.t @-> Types.Vector3.t
      @-> returning Types.RayHitInfo.t )

  (*  Get collision info between ray and ground plane (Y-normal plane) *)
  let get_collision_ray_ground =
    foreign "GetCollisionRayGround"
      (Types.Ray.t @-> float @-> returning Types.RayHitInfo.t)

  (*------------------------------------------------------------------------------------ *)
  (* Shaders System Functions (Module: rlgl) *)
  (* NOTE: This functions are useless when using OpenGL 1.1 *)
  (*------------------------------------------------------------------------------------ *)
  (* Shader loading/unloading functions *)
  (*  Load shader from files and bind default locations *)
  let load_shader =
    foreign "LoadShader" (string @-> string @-> returning Types.Shader.t)

  (*  Load shader from code strings and bind default locations *)
  let load_shader_code =
    foreign "LoadShaderCode" (string @-> string @-> returning Types.Shader.t)

  (*  Unload shader from GPU memory (VRAM) *)
  let unload_shader = foreign "UnloadShader" (Types.Shader.t @-> returning void)

  (*  Get default shader *)
  let get_shader_default =
    foreign "GetShaderDefault" (void @-> returning Types.Shader.t)

  (*  Get default texture *)
  let get_texture_default =
    foreign "GetTextureDefault" (void @-> returning Types.Texture2D.t)

  (*  Get texture to draw shapes *)
  let get_shapes_texture =
    foreign "GetShapesTexture" (void @-> returning Types.Texture2D.t)

  (*  Get texture rectangle to draw shapes *)
  let get_shapes_texture_rec =
    foreign "GetShapesTextureRec" (void @-> returning Types.Rectangle.t)

  (*  Define default texture used to draw shapes *)
  let set_shapes_texture =
    foreign "SetShapesTexture"
      (Types.Texture2D.t @-> Types.Rectangle.t @-> returning void)

  (* Shader configuration functions *)
  (*  Get shader uniform location *)
  let get_shader_location =
    foreign "GetShaderLocation"
      (Types.Shader.t @-> string @-> returning Constants.ShaderLocationIndex.t)

  (*  Set shader uniform value *)
  let set_shader_value =
    foreign "SetShaderValue"
      ( Types.Shader.t @-> Constants.ShaderLocationIndex.t @-> ptr void
      @-> Constants.ShaderUniformDataType.t @-> returning void )

  (*  Set shader uniform value vector *)
  let set_shader_value_v =
    foreign "SetShaderValueV"
      ( Types.Shader.t @-> Constants.ShaderLocationIndex.t @-> ptr void
      @-> Constants.ShaderUniformDataType.t @-> int @-> returning void )

  (*  Set shader uniform value (matrix 4x4) *)
  let set_shader_value_matrix =
    foreign "SetShaderValueMatrix"
      ( Types.Shader.t @-> Constants.ShaderLocationIndex.t @-> Types.Matrix.t
      @-> returning void )

  (*  Set shader uniform value for texture *)
  let set_shader_value_texture =
    foreign "SetShaderValueTexture"
      ( Types.Shader.t @-> Constants.ShaderLocationIndex.t @-> Types.Texture2D.t
      @-> returning void )

  (*  Set a custom projection matrix (replaces internal projection matrix) *)
  let set_matrix_projection =
    foreign "SetMatrixProjection" (Types.Matrix.t @-> returning void)

  (*  Set a custom modelview matrix (replaces internal modelview matrix) *)
  let set_matrix_modelview =
    foreign "SetMatrixModelview" (Types.Matrix.t @-> returning void)

  (*  Get internal modelview matrix *)
  let get_matrix_modelview =
    foreign "GetMatrixModelview" (void @-> returning Types.Matrix.t)

  (*  Get internal projection matrix *)
  let get_matrix_projection =
    foreign "GetMatrixProjection" (void @-> returning Types.Matrix.t)

  (* Texture maps generation (PBR) *)
  (* NOTE: Required shaders should be provided *)
  (*  Generate cubemap texture from 2D texture *)
  let gen_texture_cubemap =
    foreign "GenTextureCubemap"
      ( Types.Shader.t @-> Types.Texture2D.t @-> int
      @-> returning Types.Texture2D.t )

  (*  Generate irradiance texture using cubemap data *)
  let gen_texture_irradiance =
    foreign "GenTextureIrradiance"
      ( Types.Shader.t @-> Types.Texture2D.t @-> int
      @-> returning Types.Texture2D.t )

  (*  Generate prefilter texture using cubemap data *)
  let gen_texture_prefilter =
    foreign "GenTexturePrefilter"
      ( Types.Shader.t @-> Types.Texture2D.t @-> int
      @-> returning Types.Texture2D.t )

  (*  Generate BRDF texture *)
  let gen_texture_b_r_d_f =
    foreign "GenTextureBRDF"
      (Types.Shader.t @-> int @-> returning Types.Texture2D.t)

  (* Shading begin/end functions *)
  (*  Begin custom shader drawing *)
  let begin_shader_mode =
    foreign "BeginShaderMode" (Types.Shader.t @-> returning void)

  (*  End custom shader drawing (use default shader) *)
  let end_shader_mode = foreign "EndShaderMode" (void @-> returning void)

  (*  Begin blending mode (alpha, additive, multiplied) *)
  let begin_blend_mode =
    foreign "BeginBlendMode" (Constants.BlendMode.t @-> returning void)

  (*  End blending mode (reset to default: alpha blending) *)
  let end_blend_mode = foreign "EndBlendMode" (void @-> returning void)

  (* VR control functions *)
  (*  Init VR simulator for selected device parameters *)
  let init_vr_simulator = foreign "InitVrSimulator" (void @-> returning void)

  (*  Close VR simulator for current device *)
  let close_vr_simulator = foreign "CloseVrSimulator" (void @-> returning void)

  (*  Update VR tracking (position and orientation) and camera *)
  let update_vr_tracking =
    foreign "UpdateVrTracking" (ptr Types.Camera3D.t @-> returning void)

  (*  Set stereo rendering configuration parameters *)
  (* TODO *)
  (* let set_vr_configuration =
   *   foreign "SetVrConfiguration"
   *     (VrDeviceInfo @-> Types.Shader.t @-> returning void) *)

  (*  Detect if VR simulator is ready *)
  let is_vr_simulator_ready =
    foreign "IsVrSimulatorReady" (void @-> returning bool)

  (*  Enable/Disable VR experience *)
  let toggle_vr_mode = foreign "ToggleVrMode" (void @-> returning void)

  (*  Begin VR simulator stereo rendering *)
  let begin_vr_drawing = foreign "BeginVrDrawing" (void @-> returning void)

  (*  End VR simulator stereo rendering *)
  let end_vr_drawing = foreign "EndVrDrawing" (void @-> returning void)

  (*------------------------------------------------------------------------------------ *)
  (* Audio Loading and Playing Functions (Module: audio) *)
  (*------------------------------------------------------------------------------------ *)
  (* Audio device management functions *)
  (*  Initialize audio device and context *)
  let init_audio_device = foreign "InitAudioDevice" (void @-> returning void)

  (*  Close the audio device and context *)
  let close_audio_device = foreign "CloseAudioDevice" (void @-> returning void)

  (*  Check if audio device has been initialized successfully *)
  let is_audio_device_ready =
    foreign "IsAudioDeviceReady" (void @-> returning bool)

  (*  Set master volume (listener) *)
  let set_master_volume = foreign "SetMasterVolume" (float @-> returning void)

  (* Wave/Sound loading/unloading functions *)
  (*  Load wave data from file *)
  let load_wave = foreign "LoadWave" (string @-> returning Types.Wave.t)

  (*  Load sound from file *)
  let load_sound = foreign "LoadSound" (string @-> returning Types.Sound.t)

  (*  Load sound from wave data *)
  let load_sound_from_wave =
    foreign "LoadSoundFromWave" (Types.Wave.t @-> returning Types.Sound.t)

  (*  Update sound buffer with new data *)
  let update_sound =
    foreign "UpdateSound" (Types.Sound.t @-> ptr void @-> int @-> returning void)

  (*  Unload wave data *)
  let unload_wave = foreign "UnloadWave" (Types.Wave.t @-> returning void)

  (*  Unload sound *)
  let unload_sound = foreign "UnloadSound" (Types.Sound.t @-> returning void)

  (*  Export wave data to file *)
  let export_wave =
    foreign "ExportWave" (Types.Wave.t @-> string @-> returning void)

  (*  Export wave sample data to code (.h) *)
  let export_wave_as_code =
    foreign "ExportWaveAsCode" (Types.Wave.t @-> string @-> returning void)

  (* Wave/Sound management functions *)
  (*  Play a sound *)
  let play_sound = foreign "PlaySound" (Types.Sound.t @-> returning void)

  (*  Stop playing a sound *)
  let stop_sound = foreign "StopSound" (Types.Sound.t @-> returning void)

  (*  Pause a sound *)
  let pause_sound = foreign "PauseSound" (Types.Sound.t @-> returning void)

  (*  Resume a paused sound *)
  let resume_sound = foreign "ResumeSound" (Types.Sound.t @-> returning void)

  (*  Play a sound (using multichannel buffer pool) *)
  let play_sound_multi =
    foreign "PlaySoundMulti" (Types.Sound.t @-> returning void)

  (*  Stop any sound playing (using multichannel buffer pool) *)
  let stop_sound_multi = foreign "StopSoundMulti" (void @-> returning void)

  (*  Get number of sounds playing in the multichannel *)
  let get_sounds_playing = foreign "GetSoundsPlaying" (void @-> returning int)

  (*  Check if a sound is currently playing *)
  let is_sound_playing =
    foreign "IsSoundPlaying" (Types.Sound.t @-> returning bool)

  (*  Set volume for a sound (1.0 is max level) *)
  let set_sound_volume =
    foreign "SetSoundVolume" (Types.Sound.t @-> float @-> returning void)

  (*  Set pitch for a sound (1.0 is base level) *)
  let set_sound_pitch =
    foreign "SetSoundPitch" (Types.Sound.t @-> float @-> returning void)

  (*  Convert wave data to desired format *)
  let wave_format =
    foreign "WaveFormat"
      (ptr Types.Wave.t @-> int @-> int @-> int @-> returning void)

  (*  Copy a wave to a new wave *)
  let wave_copy = foreign "WaveCopy" (Types.Wave.t @-> returning Types.Wave.t)

  (*  Crop a wave to defined samples range *)
  let wave_crop =
    foreign "WaveCrop" (ptr Types.Wave.t @-> int @-> int @-> returning void)

  (*  Get samples data from wave as a floats array *)
  let get_wave_data =
    foreign "GetWaveData" (Types.Wave.t @-> returning (ptr float))

  (* Music management functions *)
  (*  Load music stream from file *)
  let load_music_stream =
    foreign "LoadMusicStream" (string @-> returning Types.Music.t)

  (*  Unload music stream *)
  let unload_music_stream =
    foreign "UnloadMusicStream" (Types.Music.t @-> returning void)

  (*  Start music playing *)
  let play_music_stream =
    foreign "PlayMusicStream" (Types.Music.t @-> returning void)

  (*  Updates buffers for music streaming *)
  let update_music_stream =
    foreign "UpdateMusicStream" (Types.Music.t @-> returning void)

  (*  Stop music playing *)
  let stop_music_stream =
    foreign "StopMusicStream" (Types.Music.t @-> returning void)

  (*  Pause music playing *)
  let pause_music_stream =
    foreign "PauseMusicStream" (Types.Music.t @-> returning void)

  (*  Resume playing paused music *)
  let resume_music_stream =
    foreign "ResumeMusicStream" (Types.Music.t @-> returning void)

  (*  Check if music is playing *)
  let is_music_playing =
    foreign "IsMusicPlaying" (Types.Music.t @-> returning bool)

  (*  Set volume for music (1.0 is max level) *)
  let set_music_volume =
    foreign "SetMusicVolume" (Types.Music.t @-> float @-> returning void)

  (*  Set pitch for a music (1.0 is base level) *)
  let set_music_pitch =
    foreign "SetMusicPitch" (Types.Music.t @-> float @-> returning void)

  (*  Set music loop count (loop repeats) *)
  let set_music_loop_count =
    foreign "SetMusicLoopCount" (Types.Music.t @-> int @-> returning void)

  (*  Get music time length (in seconds) *)
  let get_music_time_length =
    foreign "GetMusicTimeLength" (Types.Music.t @-> returning float)

  (*  Get current music time played (in seconds) *)
  let get_music_time_played =
    foreign "GetMusicTimePlayed" (Types.Music.t @-> returning float)

  (* AudioStream management functions *)
  (*  Init audio stream (to stream raw audio pcm data) *)
  let init_audio_stream =
    foreign "InitAudioStream"
      (int @-> int @-> int @-> returning Types.AudioStream.t)

  (*  Update audio stream buffers with data *)
  let update_audio_stream =
    foreign "UpdateAudioStream"
      (Types.AudioStream.t @-> ptr void @-> int @-> returning void)

  (*  Close audio stream and free memory *)
  let close_audio_stream =
    foreign "CloseAudioStream" (Types.AudioStream.t @-> returning void)

  (*  Check if any audio stream buffers requires refill *)
  let is_audio_stream_processed =
    foreign "IsAudioStreamProcessed" (Types.AudioStream.t @-> returning bool)

  (*  Play audio stream *)
  let play_audio_stream =
    foreign "PlayAudioStream" (Types.AudioStream.t @-> returning void)

  (*  Pause audio stream *)
  let pause_audio_stream =
    foreign "PauseAudioStream" (Types.AudioStream.t @-> returning void)

  (*  Resume audio stream *)
  let resume_audio_stream =
    foreign "ResumeAudioStream" (Types.AudioStream.t @-> returning void)

  (*  Check if audio stream is playing *)
  let is_audio_stream_playing =
    foreign "IsAudioStreamPlaying" (Types.AudioStream.t @-> returning bool)

  (*  Stop audio stream *)
  let stop_audio_stream =
    foreign "StopAudioStream" (Types.AudioStream.t @-> returning void)

  (*  Set volume for audio stream (1.0 is max level) *)
  let set_audio_stream_volume =
    foreign "SetAudioStreamVolume"
      (Types.AudioStream.t @-> float @-> returning void)

  (*  Set pitch for audio stream (1.0 is base level) *)
  let set_audio_stream_pitch =
    foreign "SetAudioStreamPitch"
      (Types.AudioStream.t @-> float @-> returning void)

  (*  Default size for new audio streams *)
  let set_audio_stream_buffer_size_default =
    foreign "SetAudioStreamBufferSizeDefault" (int @-> returning void)
end
