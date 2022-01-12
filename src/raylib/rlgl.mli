val matrix_mode : int -> unit
val push_matrix : unit -> unit
val pop_matrix : unit -> unit
val load_identity : unit -> unit
val translatef : float -> float -> float -> unit
val rotatef : float -> float -> float -> float -> unit
val scalef : float -> float -> float -> unit
val mult_matrixf : float Ctypes.ptr -> unit
val frustum : float -> float -> float -> float -> float -> float -> unit
val ortho : float -> float -> float -> float -> float -> float -> unit
val viewport : int -> int -> int -> int -> unit
val rl_begin : int -> unit
val rl_end : unit -> unit
val vertex2i : int -> int -> unit
val vertex2f : float -> float -> unit
val vertex3f : float -> float -> float -> unit
val tex_coord2f : float -> float -> unit
val normal3f : float -> float -> float -> unit

val color4ub :
  Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> unit

val color3f : float -> float -> float -> unit
val color4f : float -> float -> float -> float -> unit
val enable_vertex_array : Unsigned.uint -> bool
val disable_vertex_array : unit -> unit
val enable_vertex_buffer : Unsigned.uint -> unit
val disable_vertex_buffer : unit -> unit
val enable_vertex_buffer_element : Unsigned.uint -> unit
val disable_vertex_buffer_element : unit -> unit
val enable_vertex_attribute : Unsigned.uint -> unit
val disable_vertex_attribute : Unsigned.uint -> unit
val active_texture_slot : int -> unit
val enable_texture : Unsigned.uint -> unit
val disable_texture : unit -> unit
val enable_texture_cubemap : Unsigned.uint -> unit
val disable_texture_cubemap : unit -> unit
val texture_parameters : Unsigned.uint -> int -> int -> unit
val enable_shader : Unsigned.uint -> unit
val disable_shader : unit -> unit
val enable_framebuffer : Unsigned.uint -> unit
val disable_framebuffer : unit -> unit
val enable_depth_test : unit -> unit
val disable_depth_test : unit -> unit
val enable_depth_mask : unit -> unit
val disable_depth_mask : unit -> unit
val enable_backface_culling : unit -> unit
val disable_backface_culling : unit -> unit
val enable_scissor_test : unit -> unit
val disable_scissor_test : unit -> unit
val scissor : int -> int -> int -> int -> unit
val enable_wire_mode : unit -> unit
val disable_wire_mode : unit -> unit
val set_line_width : float -> unit
val get_line_width : unit -> float
val enable_smooth_lines : unit -> unit
val disable_smooth_lines : unit -> unit
val enable_stereo_render : unit -> unit
val disable_stereo_render : unit -> unit
val is_stereo_render_enabled : unit -> bool

val clear_color :
  Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> unit

val clear_screen_buffers : unit -> unit
val check_errors : unit -> unit
val set_blend_mode : int -> unit
val set_blend_factors : int -> int -> int -> unit
val rlgl_init : int -> int -> unit
val rlgl_close : unit -> unit
val load_extensions : unit Ctypes.ptr -> unit
val get_version : unit -> int
val get_framebuffer_width : unit -> int
val get_framebuffer_height : unit -> int
val get_texture_id_default : unit -> Unsigned.uint
val get_shader_id_default : unit -> Unsigned.uint
val load_render_batch : int -> int -> Rlgl_types.RlRenderBatch.t
val unload_render_batch : Rlgl_types.RlRenderBatch.t -> unit
val draw_render_batch : Rlgl_types.RlRenderBatch.t Ctypes.ptr -> unit
val set_render_batch_active : Rlgl_types.RlRenderBatch.t Ctypes.ptr -> unit
val draw_render_batch_active : unit -> unit
val check_render_batch_limit : int -> bool
val set_texture : Unsigned.uint -> unit
val load_vertex_array : unit -> Unsigned.uint
val load_vertex_buffer : unit Ctypes.ptr -> int -> bool -> Unsigned.uint
val load_vertex_buffer_element : unit Ctypes.ptr -> int -> bool -> Unsigned.uint
val update_vertex_buffer : int -> unit Ctypes.ptr -> int -> int -> unit
val unload_vertex_array : Unsigned.uint -> unit
val unload_vertex_buffer : Unsigned.uint -> unit

val set_vertex_attribute :
  Unsigned.uint -> int -> int -> bool -> int -> unit Ctypes.ptr -> unit

val set_vertex_attribute_divisor : Unsigned.uint -> int -> unit
val set_vertex_attribute_default : int -> unit Ctypes.ptr -> int -> int -> unit
val draw_vertex_array : int -> int -> unit
val draw_vertex_array_elements : int -> int -> unit Ctypes.ptr -> unit
val draw_vertex_array_instanced : int -> int -> int -> unit

val draw_vertex_array_elements_instanced :
  int -> int -> unit Ctypes.ptr -> int -> unit

val load_texture : unit Ctypes.ptr -> int -> int -> int -> int -> Unsigned.uint
val load_texture_depth : int -> int -> bool -> Unsigned.uint
val load_texture_cubemap : unit Ctypes.ptr -> int -> int -> Unsigned.uint

val update_texture :
  Unsigned.uint -> int -> int -> int -> int -> int -> unit Ctypes.ptr -> unit

val get_gl_texture_formats :
  int ->
  Unsigned.uint Ctypes.ptr ->
  Unsigned.uint Ctypes.ptr ->
  Unsigned.uint Ctypes.ptr ->
  unit

val get_pixel_format_name : Unsigned.uint -> string
val unload_texture : Unsigned.uint -> unit

val gen_texture_mipmaps :
  Unsigned.uint -> int -> int -> int -> int Ctypes.ptr -> unit

val read_texture_pixels : Unsigned.uint -> int -> int -> int -> unit Ctypes.ptr
val read_screen_pixels : int -> int -> Unsigned.uchar Ctypes.ptr
val load_framebuffer : int -> int -> Unsigned.uint

val framebuffer_attach :
  Unsigned.uint -> Unsigned.uint -> int -> int -> int -> unit

val framebuffer_complete : Unsigned.uint -> bool
val unload_framebuffer : Unsigned.uint -> unit
val load_shader_code : string -> string -> Unsigned.uint
val compile_shader : string -> int -> Unsigned.uint
val load_shader_program : Unsigned.uint -> Unsigned.uint -> Unsigned.uint
val unload_shader_program : Unsigned.uint -> unit
val get_location_uniform : Unsigned.uint -> string -> int
val get_location_attrib : Unsigned.uint -> string -> int
val set_uniform : int -> unit Ctypes.ptr -> int -> int -> unit
val set_uniform_matrix : int -> Raylib_types.Matrix.t -> unit
val set_uniform_sampler : int -> Unsigned.uint -> unit
val set_shader : Unsigned.uint -> int Ctypes.ptr -> unit
val get_matrix_modelview : unit -> Raylib_types.Matrix.t
val get_matrix_projection : unit -> Raylib_types.Matrix.t
val get_matrix_transform : unit -> Raylib_types.Matrix.t
val get_matrix_projection_stereo : int -> Raylib_types.Matrix.t
val get_matrix_view_offset_stereo : int -> Raylib_types.Matrix.t
val set_matrix_projection : Raylib_types.Matrix.t -> unit
val set_matrix_modelview : Raylib_types.Matrix.t -> unit

val set_matrix_projection_stereo :
  Raylib_types.Matrix.t -> Raylib_types.Matrix.t -> unit

val set_matrix_view_offset_stereo :
  Raylib_types.Matrix.t -> Raylib_types.Matrix.t -> unit

val load_draw_cube : unit -> unit
val load_draw_quad : unit -> unit
