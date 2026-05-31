module RlGlVersion : sig
  type t = Gl_software | Gl_11 | Gl_21 | Gl_33 | Gl_43 | Gl_es_20 | Gl_es_30
end

module FramebufferAttachType : sig
  type t =
    | Color_channel0
    | Color_channel1
    | Color_channel2
    | Color_channel3
    | Color_channel4
    | Color_channel5
    | Color_channel6
    | Color_channel7
    | Depth
    | Stencil
end

module FramebufferAttachTextureType : sig
  type t =
    | Cubemap_positive_x
    | Cubemap_negative_x
    | Cubemap_positive_y
    | Cubemap_negative_y
    | Cubemap_positive_z
    | Cubemap_negative_z
    | Texture2d
    | Renderbuffer
end

module Shader : sig
  type t

  val fragment_shader : t
  val vertex_shader : t
  val compute_shader : t
end

module BufferUsage : sig
  type t

  val stream_draw : t
  val stream_read : t
  val stream_copy : t
  val static_draw : t
  val static_read : t
  val static_copy : t
  val dynamic_draw : t
  val dynamic_read : t
  val dynamic_copy : t
end

module BlendFactor : sig
  type t

  val zero : t
  val one : t
  val src_color : t
  val one_minus_src_color : t
  val src_alpha : t
  val one_minus_src_alpha : t
  val dst_alpha : t
  val one_minus_dst_alpha : t
  val dst_color : t
  val one_minus_dst_color : t
  val src_alpha_saturate : t
  val constant_color : t
  val one_minus_constant_color : t
  val constant_alpha : t
  val one_minus_constant_alpha : t
end

module BlendFunction : sig
  type t

  val func_add : t
  val min_eq : t
  val max_eq : t
  val func_subtract : t
  val func_reverse_subtract : t
  val blend_equation : t
  val blend_equation_rgb : t
  val blend_equation_alpha : t
  val blend_dst_rgb : t
  val blend_src_rgb : t
  val blend_dst_alpha : t
  val blend_src_alpha : t
  val blend_color : t
end

module DrawMode : sig
  type t

  val lines : t
  val triangles : t
  val quads : t
end

module MatrixMode : sig
  type t

  val modelview : t
  val projection : t
  val texture : t
end

module FramebufferAccess : sig
  type t

  val read_framebuffer : t
  val draw_framebuffer : t
end

module TexParam : sig
  type t

  val wrap_s : t
  val wrap_t : t
  val mag_filter : t
  val min_filter : t
  val filter_nearest : t
  val filter_linear : t
  val filter_mip_nearest : t
  val filter_nearest_mip_linear : t
  val filter_linear_mip_nearest : t
  val filter_mip_linear : t
  val filter_anisotropic : t
  val mipmap_bias_ratio : t
  val wrap_repeat : t
  val wrap_clamp : t
  val wrap_mirror_repeat : t
  val wrap_mirror_clamp : t
end

val matrix_mode : MatrixMode.t -> unit
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
val rl_begin : DrawMode.t -> unit
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
val texture_parameters : Unsigned.uint -> TexParam.t -> TexParam.t -> unit
val cubemap_parameters : Unsigned.uint -> TexParam.t -> TexParam.t -> unit
val enable_shader : Unsigned.uint -> unit
val disable_shader : unit -> unit
val enable_framebuffer : Unsigned.uint -> unit
val disable_framebuffer : unit -> unit
val get_active_framebuffer : unit -> Unsigned.uint
val active_draw_buffers : int -> unit

val blit_framebuffer :
  int -> int -> int -> int -> int -> int -> int -> int -> int -> unit

val bind_framebuffer : FramebufferAccess.t -> Unsigned.uint -> unit
val enable_color_blend : unit -> unit
val disable_color_blend : unit -> unit
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
  Unsigned.uint -> int -> int -> bool -> int -> int -> unit

val set_vertex_attribute_divisor : Unsigned.uint -> int -> unit
val set_vertex_attribute_default : int -> unit Ctypes.ptr -> int -> int -> unit
val draw_vertex_array : int -> int -> unit
val draw_vertex_array_elements : int -> int -> unit Ctypes.ptr -> unit
val draw_vertex_array_instanced : int -> int -> int -> unit

val draw_vertex_array_elements_instanced :
  int -> int -> unit Ctypes.ptr -> int -> unit

val load_texture : unit Ctypes.ptr -> int -> int -> int -> int -> Unsigned.uint
val load_texture_depth : int -> int -> bool -> Unsigned.uint
val load_texture_cubemap : unit Ctypes.ptr -> int -> int -> int -> Unsigned.uint

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
val load_framebuffer : unit -> Unsigned.uint

val framebuffer_attach :
  Unsigned.uint -> Unsigned.uint -> int -> int -> int -> unit

val framebuffer_complete : Unsigned.uint -> bool
val unload_framebuffer : Unsigned.uint -> unit
val load_shader_program : string -> string -> Unsigned.uint
val load_shader : string -> Shader.t -> Unsigned.uint
val load_shader_program_ex : Unsigned.uint -> Unsigned.uint -> Unsigned.uint
val load_shader_program_compute : Unsigned.uint -> Unsigned.uint
val unload_shader : Unsigned.uint -> unit
val unload_shader_program : Unsigned.uint -> unit
val get_location_uniform : Unsigned.uint -> string -> int
val get_location_attrib : Unsigned.uint -> string -> int
val set_uniform : int -> unit Ctypes.ptr -> int -> int -> unit
val set_uniform_matrix : int -> Raylib_core.Matrix.t -> unit
val set_uniform_sampler : int -> Unsigned.uint -> unit
val set_shader : Unsigned.uint -> int Ctypes.ptr -> unit

val compute_shader_dispatch :
  Unsigned.uint -> Unsigned.uint -> Unsigned.uint -> unit

val load_shader_buffer : Unsigned.uint -> unit Ctypes.ptr -> int -> int
val unload_shader_buffer : Unsigned.uint -> unit

val update_shader_buffer :
  Unsigned.uint -> unit Ctypes.ptr -> Unsigned.uint -> Unsigned.uint -> unit

val bind_shader_buffer : Unsigned.uint -> Unsigned.uint -> unit

val read_shader_buffer :
  Unsigned.uint -> unit Ctypes.ptr -> Unsigned.uint -> Unsigned.uint -> unit

val copy_shader_buffer :
  Unsigned.uint ->
  Unsigned.uint ->
  Unsigned.uint ->
  Unsigned.uint ->
  Unsigned.uint ->
  unit

val get_shader_buffer_size : Unsigned.uint -> int
val bind_image_texture : Unsigned.uint -> Unsigned.uint -> int -> bool -> unit
val get_matrix_modelview : unit -> Raylib_core.Matrix.t
val get_matrix_projection : unit -> Raylib_core.Matrix.t
val get_matrix_transform : unit -> Raylib_core.Matrix.t
val get_matrix_projection_stereo : int -> Raylib_core.Matrix.t
val get_matrix_view_offset_stereo : int -> Raylib_core.Matrix.t
val set_matrix_projection : Raylib_core.Matrix.t -> unit
val set_matrix_modelview : Raylib_core.Matrix.t -> unit

val set_matrix_projection_stereo :
  Raylib_core.Matrix.t -> Raylib_core.Matrix.t -> unit

val set_matrix_view_offset_stereo :
  Raylib_core.Matrix.t -> Raylib_core.Matrix.t -> unit

val load_draw_cube : unit -> unit
val load_draw_quad : unit -> unit
