(** Shared types plus runtime raymath operations. *)

module Vector2 : sig
  include module type of struct
    include Raylib_types.Vector2
  end

  val zero : unit -> t
  val one : unit -> t
  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val length : t -> float
  val length_sqr : t -> float
  val dot_product : t -> t -> float
  val distance : t -> t -> float
  val angle : t -> t -> float
  val scale : t -> float -> t
  val multiply : t -> t -> t
  val negate : t -> t
  val divide : t -> t -> t
  val normalize : t -> t
  val lerp : t -> t -> float -> t
  val reflect : t -> t -> t
  val rotate : t -> float -> t
  val move_towards : t -> t -> float -> t
end

module Vector3 : sig
  include module type of struct
    include Raylib_types.Vector3
  end

  val zero : unit -> t
  val one : unit -> t
  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val scale : t -> float -> t
  val multiply : t -> t -> t
  val cross_product : t -> t -> t
  val perpendicular : t -> t
  val length : t -> float
  val length_sqr : t -> float
  val dot_product : t -> t -> float
  val distance : t -> t -> float
  val negate : t -> t
  val divide : t -> t -> t
  val normalize : t -> t
  val ortho_normalize : t Ctypes.ptr -> t Ctypes.ptr -> unit
  val transform : t -> Raylib_types.Matrix.t -> t
  val rotate_by_quaternion : t -> Raylib_types.Vector4.t -> t
  val lerp : t -> t -> float -> t
  val reflect : t -> t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val barycenter : t -> t -> t -> t -> t
  val unproject : t -> Raylib_types.Matrix.t -> Raylib_types.Matrix.t -> t
end

module Vector4 : sig
  include module type of struct
    include Raylib_types.Vector4
  end

  val add : t -> t -> t
  val add_value : t -> float -> t
  val subtract : t -> t -> t
  val subtract_value : t -> float -> t
  val identity : unit -> t
  val length : t -> float
  val normalize : t -> t
  val invert : t -> t
  val multiply : t -> t -> t
  val scale : t -> float -> t
  val divide : t -> t -> t
  val lerp : t -> t -> float -> t
  val nlerp : t -> t -> float -> t
  val slerp : t -> t -> float -> t

  val from_vector3_to_vector3 :
    Raylib_types.Vector3.t -> Raylib_types.Vector3.t -> t

  val from_matrix : Raylib_types.Matrix.t -> t
  val to_matrix : t -> Raylib_types.Matrix.t
  val from_axis_angle : Raylib_types.Vector3.t -> float -> t

  val to_axis_angle :
    t -> Raylib_types.Vector3.t Ctypes.ptr -> float Ctypes.ptr -> unit

  val from_euler : float -> float -> float -> t
  val to_euler : t -> Raylib_types.Vector3.t
  val transform : t -> Raylib_types.Matrix.t -> t
end

module Matrix : sig
  include module type of struct
    include Raylib_types.Matrix
  end

  val determinant : t -> float
  val trace : t -> float
  val transpose : t -> t
  val invert : t -> t
  val identity : unit -> t
  val add : t -> t -> t
  val subtract : t -> t -> t
  val translate : float -> float -> float -> t
  val rotate : Raylib_types.Vector3.t -> float -> t
  val rotate_xyz : Raylib_types.Vector3.t -> t
  val rotate_zyx : Raylib_types.Vector3.t -> t
  val rotate_x : float -> t
  val rotate_y : float -> t
  val rotate_z : float -> t
  val scale : float -> float -> float -> t
  val multiply : t -> t -> t

  val frustum : float -> float -> float -> float -> float -> float -> t
  (** [frustum left right bottom top near far] returns perspective projection
      matrix *)

  val perspective : float -> float -> float -> float -> t
  (** [perspective fovy aspect near far] returns perspective projection matrix
  *)

  val ortho : float -> float -> float -> float -> float -> float -> t
  (** [ortho left right bottom top near far] returns orthographic projection
      matrix *)

  val look_at :
    Raylib_types.Vector3.t ->
    Raylib_types.Vector3.t ->
    Raylib_types.Vector3.t ->
    t
  (** [look at eye target up] returns camera look-at matrix (view matrix) *)
end

include module type of struct
    include Raylib_types
  end
  with module Vector2 := Raylib_types.Vector2
   and module Vector3 := Raylib_types.Vector3
   and module Vector4 := Raylib_types.Vector4
   and module Matrix := Raylib_types.Matrix

(** {1 Functions}*)

(** {2 Window and Graphics Device Functions (Module: core)}*)

val init_window : int -> int -> string -> unit
(** [init_window width height title] Initialize window and OpenGL context*)

val close_window : unit -> unit
(** [close_window ()] Close window and unload OpenGL context*)

val window_should_close : unit -> bool
(** [window_should_close ()] Check if application should close (KEY_ESCAPE
    pressed or windows close icon clicked)*)

val is_window_ready : unit -> bool
(** [is_window_ready ()] Check if window has been initialized successfully*)

val is_window_fullscreen : unit -> bool
(** [is_window_fullscreen ()] Check if window is currently fullscreen*)

val is_window_hidden : unit -> bool
(** [is_window_hidden ()] Check if window is currently hidden*)

val is_window_minimized : unit -> bool
(** [is_window_minimized ()] Check if window is currently minimized*)

val is_window_maximized : unit -> bool
(** [is_window_maximized ()] Check if window is currently maximized*)

val is_window_focused : unit -> bool
(** [is_window_focused ()] Check if window is currently focused*)

val is_window_resized : unit -> bool
(** [is_window_resized ()] Check if window has been resized last frame*)

val is_window_state : ConfigFlags.t -> bool
(** [is_window_state flag] Check if one specific window flag is enabled*)

val set_window_state : ConfigFlags.t -> unit
(** [set_window_state flags] Set window configuration state using flags*)

val clear_window_state : ConfigFlags.t -> unit
(** [clear_window_state flags] Clear window configuration state flags*)

val toggle_fullscreen : unit -> unit
(** [toggle_fullscreen ()] Toggle window state: fullscreen/windowed, resizes
    monitor to match window resolution*)

val toggle_borderless_windowed : unit -> unit
(** [toggle_borderless_windowed ()] Toggle window state: borderless windowed,
    resizes window to match monitor resolution*)

val maximize_window : unit -> unit
(** [maximize_window ()] Set window state: maximized, if resizable*)

val minimize_window : unit -> unit
(** [minimize_window ()] Set window state: minimized, if resizable*)

val restore_window : unit -> unit
(** [restore_window ()] Set window state: not minimized/maximized*)

val set_window_icon : Image.t -> unit
(** [set_window_icon image] Set icon for window (single image, RGBA 32bit)*)

val set_window_icons : Image.t ptr -> int -> unit
(** [set_window_icons images count] Set icon for window (multiple images, RGBA
    32bit)*)

val set_window_title : string -> unit
(** [set_window_title title] Set title for window*)

val set_window_position : int -> int -> unit
(** [set_window_position x y] Set window position on screen*)

val set_window_monitor : int -> unit
(** [set_window_monitor monitor] Set monitor for the current window*)

val set_window_min_size : int -> int -> unit
(** [set_window_min_size width height] Set window minimum dimensions (for
    FLAG_WINDOW_RESIZABLE)*)

val set_window_max_size : int -> int -> unit
(** [set_window_max_size width height] Set window maximum dimensions (for
    FLAG_WINDOW_RESIZABLE)*)

val set_window_size : int -> int -> unit
(** [set_window_size width height] Set window dimensions*)

val set_window_opacity : float -> unit
(** [set_window_opacity opacity] Set window opacity [0.0f..1.0f]*)

val set_window_focused : unit -> unit
(** [set_window_focused ()] Set window focused*)

val get_window_handle : unit -> unit ptr option
(** [get_window_handle ()] Get native window handle*)

val get_screen_width : unit -> int
(** [get_screen_width ()] Get current screen width*)

val get_screen_height : unit -> int
(** [get_screen_height ()] Get current screen height*)

val get_render_width : unit -> int
(** [get_render_width ()] Get current render width (it considers HiDPI)*)

val get_render_height : unit -> int
(** [get_render_height ()] Get current render height (it considers HiDPI)*)

val get_monitor_count : unit -> int
(** [get_monitor_count ()] Get number of connected monitors*)

val get_current_monitor : unit -> int
(** [get_current_monitor ()] Get current monitor where window is placed*)

val get_monitor_position : int -> Vector2.t
(** [get_monitor_position monitor] Get specified monitor position*)

val get_monitor_width : int -> int
(** [get_monitor_width monitor] Get specified monitor width (current video mode
    used by monitor)*)

val get_monitor_height : int -> int
(** [get_monitor_height monitor] Get specified monitor height (current video
    mode used by monitor)*)

val get_monitor_physical_width : int -> int
(** [get_monitor_physical_width monitor] Get specified monitor physical width in
    millimetres*)

val get_monitor_physical_height : int -> int
(** [get_monitor_physical_height monitor] Get specified monitor physical height
    in millimetres*)

val get_monitor_refresh_rate : int -> int
(** [get_monitor_refresh_rate monitor] Get specified monitor refresh rate*)

val get_window_position : unit -> Vector2.t
(** [get_window_position ()] Get window position XY on monitor*)

val get_window_scale_dpi : unit -> Vector2.t
(** [get_window_scale_dpi ()] Get window scale DPI factor*)

val get_monitor_name : int -> string
(** [get_monitor_name monitor] Get the human-readable, UTF-8 encoded name of the
    specified monitor*)

val set_clipboard_text : string -> unit
(** [set_clipboard_text text] Set clipboard text content*)

val get_clipboard_text : unit -> string option
(** [get_clipboard_text ()] Get clipboard text content*)

val get_clipboard_image : unit -> Image.t
(** [get_clipboard_image ()] Get clipboard image content*)

val enable_event_waiting : unit -> unit
(** [enable_event_waiting ()] Enable waiting for events on EndDrawing(), no
    automatic event polling*)

val disable_event_waiting : unit -> unit
(** [disable_event_waiting ()] Disable waiting for events on EndDrawing(),
    automatic events polling*)

(** {3 Cursor-related functions} *)

val show_cursor : unit -> unit
(** [show_cursor ()] Shows cursor*)

val hide_cursor : unit -> unit
(** [hide_cursor ()] Hides cursor*)

val is_cursor_hidden : unit -> bool
(** [is_cursor_hidden ()] Check if cursor is not visible*)

val enable_cursor : unit -> unit
(** [enable_cursor ()] Enables cursor (unlock cursor)*)

val disable_cursor : unit -> unit
(** [disable_cursor ()] Disables cursor (lock cursor)*)

val is_cursor_on_screen : unit -> bool
(** [is_cursor_on_screen ()] Check if cursor is on the screen*)

val clear_background : Color.t -> unit
(** [clear_background color] Set background color (framebuffer clear color)*)

val begin_drawing : unit -> unit
(** [begin_drawing ()] Setup canvas (framebuffer) to start drawing*)

val end_drawing : unit -> unit
(** [end_drawing ()] End canvas drawing and swap buffers (double buffering)*)

val begin_mode_2d : Camera2D.t -> unit
(** [begin_mode_2d camera] Begin 2D mode with custom camera (2D)*)

val end_mode_2d : unit -> unit
(** [end_mode_2d ()] Ends 2D mode with custom camera*)

val begin_mode_3d : Camera3D.t -> unit
(** [begin_mode_3d camera] Begin 3D mode with custom camera (3D)*)

val end_mode_3d : unit -> unit
(** [end_mode_3d ()] Ends 3D mode and returns to default 2D orthographic mode*)

val begin_texture_mode : RenderTexture.t -> unit
(** [begin_texture_mode target] Begin drawing to render texture*)

val end_texture_mode : unit -> unit
(** [end_texture_mode ()] Ends drawing to render texture*)

val begin_shader_mode : Shader.t -> unit
(** [begin_shader_mode shader] Begin custom shader drawing*)

val end_shader_mode : unit -> unit
(** [end_shader_mode ()] End custom shader drawing (use default shader)*)

val begin_blend_mode : BlendMode.t -> unit
(** [begin_blend_mode mode] Begin blending mode (alpha, additive, multiplied,
    subtract, custom)*)

val end_blend_mode : unit -> unit
(** [end_blend_mode ()] End blending mode (reset to default: alpha blending)*)

val begin_scissor_mode : int -> int -> int -> int -> unit
(** [begin_scissor_mode x y width height] Begin scissor mode (define screen area
    for following drawing)*)

val end_scissor_mode : unit -> unit
(** [end_scissor_mode ()] End scissor mode*)

val begin_vr_stereo_mode : VrStereoConfig.t -> unit
(** [begin_vr_stereo_mode config] Begin stereo rendering (requires VR simulator)*)

val end_vr_stereo_mode : unit -> unit
(** [end_vr_stereo_mode ()] End stereo rendering (requires VR simulator)*)

val load_vr_stereo_config : VrDeviceInfo.t -> VrStereoConfig.t
(** [load_vr_stereo_config device] Load VR stereo config for VR simulator device
    parameters*)

val unload_vr_stereo_config : VrStereoConfig.t -> unit
(** [unload_vr_stereo_config config] Unload VR stereo config*)

val load_shader : string -> string -> Shader.t
(** [load_shader vs_file_name fs_file_name] Load shader from files and bind
    default locations*)

val load_shader_from_memory : string -> string -> Shader.t
(** [load_shader_from_memory vs_code fs_code] Load shader from code strings and
    bind default locations*)

val is_shader_valid : Shader.t -> bool
(** [is_shader_valid shader] Check if a shader is valid (loaded on GPU)*)

val get_shader_location : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location shader uniform_name] Get shader uniform location*)

val get_shader_location_attrib : Shader.t -> string -> ShaderLoc.t
(** [get_shader_location_attrib shader attrib_name] Get shader attribute
    location*)

val set_shader_value :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> unit
(** [set_shader_value shader loc_index value uniform_type] Set shader uniform
    value*)

val set_shader_value_v :
  Shader.t -> ShaderLoc.t -> unit ptr -> ShaderUniformDataType.t -> int -> unit
(** [set_shader_value_v shader loc_index value uniform_type count] Set shader
    uniform value vector*)

val set_shader_value_matrix : Shader.t -> ShaderLoc.t -> Matrix.t -> unit
(** [set_shader_value_matrix shader loc_index mat] Set shader uniform value
    (matrix 4x4)*)

val set_shader_value_texture : Shader.t -> ShaderLoc.t -> Texture.t -> unit
(** [set_shader_value_texture shader loc_index texture] Set shader uniform value
    for texture (sampler2d)*)

val unload_shader : Shader.t -> unit
(** [unload_shader shader] Unload shader from GPU memory (VRAM)*)

(** {3 Screen-space-related functions} *)

val get_screen_to_world_ray : Vector2.t -> Camera3D.t -> Ray.t
(** [get_screen_to_world_ray position camera] Get a ray trace from screen
    position (i.e mouse)*)

val get_screen_to_world_ray_ex : Vector2.t -> Camera3D.t -> int -> int -> Ray.t
(** [get_screen_to_world_ray_ex position camera width height] Get a ray trace
    from screen position (i.e mouse) in a viewport*)

val get_world_to_screen : Vector3.t -> Camera3D.t -> Vector2.t
(** [get_world_to_screen position camera] Get the screen space position for a 3d
    world space position*)

val get_world_to_screen_ex : Vector3.t -> Camera3D.t -> int -> int -> Vector2.t
(** [get_world_to_screen_ex position camera width height] Get size position for
    a 3d world space position*)

val get_world_to_screen_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_world_to_screen_2d position camera] Get the screen space position for a
    2d camera world space position*)

val get_screen_to_world_2d : Vector2.t -> Camera2D.t -> Vector2.t
(** [get_screen_to_world_2d position camera] Get the world space position for a
    2d camera screen space position*)

val get_camera_matrix : Camera3D.t -> Matrix.t
(** [get_camera_matrix camera] Get camera transform matrix (view matrix)*)

val get_camera_matrix_2d : Camera2D.t -> Matrix.t
(** [get_camera_matrix_2d camera] Get camera 2d transform matrix*)

val set_target_fps : int -> unit
(** [set_target_fps fps] Set target FPS (maximum)*)

val get_frame_time : unit -> float
(** [get_frame_time ()] Get time in seconds for last frame drawn (delta time)*)

val get_time : unit -> float
(** [get_time ()] Get elapsed time in seconds since InitWindow()*)

val get_fps : unit -> int
(** [get_fps ()] Get current FPS*)

val swap_screen_buffer : unit -> unit
(** [swap_screen_buffer ()] Swap back buffer with front buffer (screen drawing)*)

val poll_input_events : unit -> unit
(** [poll_input_events ()] Register all input events*)

val wait_time : float -> unit
(** [wait_time seconds] Wait for some time (halt program execution)*)

val set_random_seed : Unsigned.uint -> unit
(** [set_random_seed seed] Set the seed for the random number generator*)

val get_random_value : int -> int -> int
(** [get_random_value min max] Get a random value between min and max (both
    included)*)

val load_random_sequence : int -> int -> int -> int ptr
(** [load_random_sequence count min max] Load random values sequence, no values
    repeated*)

val unload_random_sequence : int ptr -> unit
(** [unload_random_sequence sequence] Unload random values sequence*)

val take_screenshot : string -> unit
(** [take_screenshot file_name] Takes a screenshot of current screen (filename
    extension defines format)*)

val set_config_flags : ConfigFlags.t -> unit
(** [set_config_flags flags] Setup init configuration flags (view FLAGS)*)

val open_url : string -> unit
(** [open_url url] Open URL with default system browser (if available)*)

val set_trace_log_level : TraceLogLevel.t -> unit
(** [set_trace_log_level log_level] Set the current threshold (minimum) log
    level*)

val trace_log : TraceLogLevel.t -> string -> unit
(** [trace_log log_level text args] Show trace log messages (LOG_DEBUG,
    LOG_INFO, LOG_WARNING, LOG_ERROR...)*)

val mem_alloc : int -> unit ptr
(** [mem_alloc size] Internal memory allocator*)

val mem_realloc : unit ptr -> int -> unit ptr
(** [mem_realloc ptr size] Internal memory reallocator*)

val mem_free : unit ptr -> unit
(** [mem_free ptr] Internal memory free*)

val load_file_data : string -> string
(** [load_file_data file_name] Load file data as byte array (read)*)

val save_file_data : string -> 'a CArray.t -> bool
(** [save_file_data file_name data data_size] Save data to file from byte array
    (write), returns true on success*)

val export_data_as_code : string -> string -> bool
(** [export_data_as_code data filename] Export data to code (.h), returns true
    on success*)

val load_file_text : string -> string
(** [load_file_text file_name] Load text data from file (read), returns a '\0'
    terminated string*)

val save_file_text : string -> string -> bool
(** [save_file_text file_name text] Save text data to file (write), string must
    be ' 0' terminated, returns true on success*)

val file_rename : string -> string -> int
(** [file_rename file_name file_rename] Rename file (if exists) *)

val file_remove : string -> int
(** [file_remove file_name] Remove file (if exists) *)

val file_copy : string -> string -> int
(** [file_copy src_path dst_path] Copy file from one path to another, dstPath
    created if it doesn't exist *)

val file_move : string -> string -> int
(** [file_move src_path dst_path] Move file from one directory to another,
    dstPath created if it doesn't exist *)

val file_text_replace : string -> string -> string -> int
(** [file_text_replace file_name search replacement] Replace text in an existing
    file *)

val file_text_find_index : string -> string -> int
(** [file_text_find_index file_name search] Find text in existing file *)

val file_exists : string -> bool
(** [file_exists file_name] Check if file exists*)

val directory_exists : string -> bool
(** [directory_exists dir_path] Check if a directory path exists*)

val is_file_extension : string -> string -> bool
(** [is_file_extension file_name ext] Check file extension (including point:
    .png, .wav)*)

val get_file_length : string -> int
(** [get_file_length file_name] Get file length in bytes (NOTE: GetFileSize()
    conflicts with windows.h)*)

val get_file_mod_time : string -> Signed.long
(** [get_file_mod_time file_name] Get file modification time (last write time)*)

val get_file_extension : string -> string
(** [get_file_extension file_name] Get pointer to extension for a filename
    string (includes dot: '.png')*)

val get_file_name : string -> string
(** [get_file_name file_path] Get pointer to filename for a path string*)

val get_file_name_without_ext : string -> string
(** [get_file_name_without_ext file_path] Get filename string without extension
    (uses static string)*)

val get_directory_path : string -> string
(** [get_directory_path file_path] Get full path for a given fileName with path
    (uses static string)*)

val get_prev_directory_path : string -> string
(** [get_prev_directory_path dir_path] Get previous directory path for a given
    path (uses static string)*)

val get_working_directory : unit -> string
(** [get_working_directory ()] Get current working directory (uses static
    string)*)

val get_application_directory : unit -> string
(** [get_application_directory ()] Get the directory of the running application
    (uses static string)*)

val make_directory : string -> int
(** [make_directory dir_path] Create directories (including full path
    requested), returns 0 on success*)

val change_directory : string -> bool
(** [change_directory dir] Change working directory, return true on success*)

val is_path_file : string -> bool
(** [is_path_file path] Check if a given path is a file or a directory*)

val is_file_name_valid : string -> bool
(** [is_file_name_valid file_name] Check if fileName is valid for the
    platform/OS*)

val load_directory_files : string -> FilePathList.t
(** [load_directory_files dir_path] Load directory filepaths*)

val load_directory_files_ex : string -> string -> bool -> FilePathList.t
(** [load_directory_files_ex base_path filter scan_subdirs] Load directory
    filepaths with extension filtering and recursive directory scan. Use 'DIR'
    in the filter string to include directories in the result*)

val unload_directory_files : FilePathList.t -> unit
(** [unload_directory_files files] Unload filepaths*)

val is_file_dropped : unit -> bool
(** [is_file_dropped ()] Check if a file has been dropped into window*)

val load_dropped_files : unit -> FilePathList.t
(** [load_dropped_files ()] Load dropped filepaths*)

val unload_dropped_files : FilePathList.t -> unit
(** [unload_dropped_files files] Unload dropped filepaths*)

val get_directory_file_count : string -> Unsigned.uint
(** [get_directory_file_count dir_path] Get the file count in a directory *)

val get_directory_file_count_ex : string -> string -> bool -> Unsigned.uint
(** [get_directory_file_count_ex base_path filter scan_subdirs] Get the file
    count in a directory with extension filtering and recursive directory scan.
    Use 'DIR' in the filter string to include directories in the result *)

val compress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [compress_data data data_length comp_data_length] Compress data (DEFLATE
    algorithm)*)

val decompress_data : Unsigned.uchar CArray.t -> Unsigned.uchar CArray.t
(** [decompress_data comp_data comp_data_length data_length] Decompress data
    (DEFLATE algorithm)*)

val load_automation_event_list : string -> AutomationEventList.t
(** [load_automation_event_list file_name] Load automation events list from
    file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS*)

val unload_automation_event_list : AutomationEventList.t -> unit
(** [unload_automation_event_list list] Unload automation events list from file*)

val export_automation_event_list : AutomationEventList.t -> string -> bool
(** [export_automation_event_list list file_name] Export automation events list
    as text file*)

val set_automation_event_list : AutomationEventList.t ptr -> unit
(** [set_automation_event_list list] Set automation event list to record to*)

val set_automation_event_base_frame : int -> unit
(** [set_automation_event_base_frame frame] Set automation event internal base
    frame to start recording*)

val start_automation_event_recording : unit -> unit
(** [start_automation_event_recording ()] Start recording automation events
    (AutomationEventList must be set)*)

val stop_automation_event_recording : unit -> unit
(** [stop_automation_event_recording ()] Stop recording automation events*)

val play_automation_event : AutomationEvent.t -> unit
(** [play_automation_event event] Play a recorded automation event*)

val is_key_pressed : Key.t -> bool
(** [is_key_pressed key] Check if a key has been pressed once*)

val is_key_pressed_repeat : Key.t -> bool
(** [is_key_pressed_repeat key] Check if a key has been pressed again*)

val is_key_down : Key.t -> bool
(** [is_key_down key] Check if a key is being pressed*)

val is_key_released : Key.t -> bool
(** [is_key_released key] Check if a key has been released once*)

val is_key_up : Key.t -> bool
(** [is_key_up key] Check if a key is NOT being pressed*)

val get_key_pressed : unit -> Key.t
(** [get_key_pressed ()] Get key pressed (keycode), call it multiple times for
    keys queued, returns 0 when the queue is empty*)

val get_char_pressed : unit -> Uchar.t
(** [get_char_pressed ()] Get char pressed (unicode), call it multiple times for
    chars queued, returns 0 when the queue is empty*)

val get_key_name : Key.t -> string option
(** [get_key_name key] Get name of a QWERTY key on the current keyboard layout
    (eg returns string 'q' for KEY_A on an AZERTY keyboard) *)

val set_exit_key : Key.t -> unit
(** [set_exit_key key] Set a custom key to exit program (default is ESC)*)

val is_gamepad_available : int -> bool
(** [is_gamepad_available gamepad] Check if a gamepad is available*)

val get_gamepad_name : int -> string
(** [get_gamepad_name gamepad] Get gamepad internal name id*)

val is_gamepad_button_pressed : int -> GamepadButton.t -> bool
(** [is_gamepad_button_pressed gamepad button] Check if a gamepad button has
    been pressed once*)

val is_gamepad_button_down : int -> GamepadButton.t -> bool
(** [is_gamepad_button_down gamepad button] Check if a gamepad button is being
    pressed*)

val is_gamepad_button_released : int -> GamepadButton.t -> bool
(** [is_gamepad_button_released gamepad button] Check if a gamepad button has
    been released once*)

val is_gamepad_button_up : int -> GamepadButton.t -> bool
(** [is_gamepad_button_up gamepad button] Check if a gamepad button is NOT being
    pressed*)

val get_gamepad_button_pressed : unit -> GamepadButton.t
(** [get_gamepad_button_pressed ()] Get the last gamepad button pressed*)

val get_gamepad_axis_count : int -> int
(** [get_gamepad_axis_count gamepad] Get gamepad axis count for a gamepad*)

val get_gamepad_axis_movement : int -> GamepadAxis.t -> float
(** [get_gamepad_axis_movement gamepad axis] Get axis movement value for a
    gamepad axis*)

val set_gamepad_mappings : string -> int
(** [set_gamepad_mappings mappings] Set internal gamepad mappings
    (SDL_GameControllerDB)*)

val set_gamepad_vibration : int -> float -> float -> float -> unit
(** [set_gamepad_vibration gamepad left_motor right_motor duration] Set gamepad
    vibration for both motors (duration in seconds)*)

val is_mouse_button_pressed : MouseButton.t -> bool
(** [is_mouse_button_pressed button] Check if a mouse button has been pressed
    once*)

val is_mouse_button_down : MouseButton.t -> bool
(** [is_mouse_button_down button] Check if a mouse button is being pressed*)

val is_mouse_button_released : MouseButton.t -> bool
(** [is_mouse_button_released button] Check if a mouse button has been released
    once*)

val is_mouse_button_up : MouseButton.t -> bool
(** [is_mouse_button_up button] Check if a mouse button is NOT being pressed*)

val get_mouse_x : unit -> int
(** [get_mouse_x ()] Get mouse position X*)

val get_mouse_y : unit -> int
(** [get_mouse_y ()] Get mouse position Y*)

val get_mouse_position : unit -> Vector2.t
(** [get_mouse_position ()] Get mouse position XY*)

val get_mouse_delta : unit -> Vector2.t
(** [get_mouse_delta ()] Get mouse delta between frames*)

val set_mouse_position : int -> int -> unit
(** [set_mouse_position x y] Set mouse position XY*)

val set_mouse_offset : int -> int -> unit
(** [set_mouse_offset offset_x offset_y] Set mouse offset*)

val set_mouse_scale : float -> float -> unit
(** [set_mouse_scale scale_x scale_y] Set mouse scaling*)

val get_mouse_wheel_move : unit -> float
(** [get_mouse_wheel_move ()] Get mouse wheel movement for X or Y, whichever is
    larger*)

val get_mouse_wheel_move_v : unit -> Vector2.t
(** [get_mouse_wheel_move_v ()] Get mouse wheel movement for both X and Y*)

val set_mouse_cursor : MouseCursor.t -> unit
(** [set_mouse_cursor cursor] Set mouse cursor*)

val get_touch_x : unit -> int
(** [get_touch_x ()] Get touch position X for touch point 0 (relative to screen
    size)*)

val get_touch_y : unit -> int
(** [get_touch_y ()] Get touch position Y for touch point 0 (relative to screen
    size)*)

val get_touch_position : int -> Vector2.t
(** [get_touch_position index] Get touch position XY for a touch point index
    (relative to screen size)*)

val get_touch_point_id : int -> int
(** [get_touch_point_id index] Get touch point identifier for given index*)

val get_touch_point_count : unit -> int
(** [get_touch_point_count ()] Get number of touch points*)

val set_gestures_enabled : Gesture.t -> unit
(** [set_gestures_enabled flags] Enable a set of gestures using flags*)

val is_gesture_detected : Gesture.t -> bool
(** [is_gesture_detected gesture] Check if a gesture have been detected*)

val get_gesture_detected : unit -> Gesture.t
(** [get_gesture_detected ()] Get latest detected gesture*)

val get_gesture_hold_duration : unit -> float
(** [get_gesture_hold_duration ()] Get gesture hold time in seconds*)

val get_gesture_drag_vector : unit -> Vector2.t
(** [get_gesture_drag_vector ()] Get gesture drag vector*)

val get_gesture_drag_angle : unit -> float
(** [get_gesture_drag_angle ()] Get gesture drag angle*)

val get_gesture_pinch_vector : unit -> Vector2.t
(** [get_gesture_pinch_vector ()] Get gesture pinch delta*)

val get_gesture_pinch_angle : unit -> float
(** [get_gesture_pinch_angle ()] Get gesture pinch angle*)

val update_camera : Camera3D.t ptr -> CameraMode.t -> unit
(** [update_camera camera mode] Update camera position for selected mode*)

val update_camera_pro :
  Camera3D.t ptr -> Vector3.t -> Vector3.t -> float -> unit
(** [update_camera_pro camera movement rotation zoom] Update camera
    movement/rotation*)
