open Raylib_core

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

module CullMode : sig
  type t = Face_front | Face_back
end

module GlDataType : sig
  type t

  val unsigned_byte : t
  val float : t
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

module VaoId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module VboId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module ShaderId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module SsboId : sig
  type t

  val t : t Ctypes.typ
  val of_uint : Unsigned.uint -> t
  val to_uint : t -> Unsigned.uint
end

module VertexBuffer : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val element_count : t -> int
  val vertices : t -> float Ctypes.ptr
  val texcoords : t -> float Ctypes.ptr
  val colors : t -> Unsigned.UChar.t Ctypes.ptr

  (* TODO assume opengl 11, for es2 this would be indices : short ptr *)
  val indices : t -> Unsigned.UInt.t Ctypes.ptr
  val vao_id : t -> VaoId.t
end

module DrawCall : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val mode : t -> DrawMode.t
  val vertex_count : t -> int
  val vertex_alignment : t -> int
  val texture_id : t -> TextureId.t
end

module RenderBatch : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ
  val buffer_count : t -> int
  val current_buffer : t -> int
  val vertex_buffer : t -> VertexBuffer.t Ctypes.ptr
  val draws : t -> DrawCall.t Ctypes.ptr
  val draw_counter : t -> int
  val current_depth : t -> float
end

val matrix_mode : MatrixMode.t -> unit
(** [matrix_mode mode] Choose the current matrix to be transformed*)

val push_matrix : unit -> unit
(** [push_matrix ()] Push the current matrix to stack*)

val pop_matrix : unit -> unit
(** [pop_matrix ()] Pop latest inserted matrix from stack*)

val load_identity : unit -> unit
(** [load_identity ()] Reset current matrix to identity matrix*)

val translatef : float -> float -> float -> unit
(** [translatef x y z] Multiply the current matrix by a translation matrix*)

val rotatef : float -> float -> float -> float -> unit
(** [rotatef angle x y z] Multiply the current matrix by a rotation matrix*)

val scalef : float -> float -> float -> unit
(** [scalef x y z] Multiply the current matrix by a scaling matrix*)

val mult_matrixf : float Ctypes.ptr -> unit
(** [mult_matrixf matf] Multiply the current matrix by another matrix*)

val frustum : float -> float -> float -> float -> float -> float -> unit
(** [frustum left right bottom top znear zfar] Multiply the current matrix by a
    perspective matrix generated by parameters*)

val ortho : float -> float -> float -> float -> float -> float -> unit
(** [ortho left right bottom top znear zfar] Multiply the current matrix by an
    orthographic matrix generated by parameters*)

val viewport : int -> int -> int -> int -> unit
(** [viewport x y width height] Set the viewport area*)

val rl_begin : DrawMode.t -> unit
(** [rl_begin mode] Initialize drawing mode (how to organize vertex)*)

val rl_end : unit -> unit
(** [rl_end ()] Finish vertex providing*)

val vertex2i : int -> int -> unit
(** [vertex2i x y] Define one vertex (position) - 2 int*)

val vertex2f : float -> float -> unit
(** [vertex2f x y] Define one vertex (position) - 2 float*)

val vertex3f : float -> float -> float -> unit
(** [vertex3f x y z] Define one vertex (position) - 3 float*)

val tex_coord2f : float -> float -> unit
(** [tex_coord2f x y] Define one vertex (texture coordinate) - 2 float*)

val normal3f : float -> float -> float -> unit
(** [normal3f x y z] Define one vertex (normal) - 3 float*)

val color4ub :
  Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> unit
(** [color4ub r g b a] Define one vertex (color) - 4 byte*)

val color3f : float -> float -> float -> unit
(** [color3f x y z] Define one vertex (color) - 3 float*)

val color4f : float -> float -> float -> float -> unit
(** [color4f x y z w] Define one vertex (color) - 4 float*)

val enable_vertex_array : VaoId.t -> bool
(** [enable_vertex_array vao_id] Enable vertex array (VAO, if supported)*)

val disable_vertex_array : unit -> unit
(** [disable_vertex_array ()] Disable vertex array (VAO, if supported)*)

val enable_vertex_buffer : VboId.t -> unit
(** [enable_vertex_buffer id] Enable vertex buffer (VBO)*)

val disable_vertex_buffer : unit -> unit
(** [disable_vertex_buffer ()] Disable vertex buffer (VBO)*)

val enable_vertex_buffer_element : VboId.t -> unit
(** [enable_vertex_buffer_element id] Enable vertex buffer element (VBO element)*)

val disable_vertex_buffer_element : unit -> unit
(** [disable_vertex_buffer_element ()] Disable vertex buffer element (VBO
    element)*)

val enable_vertex_attribute : Unsigned.uint -> unit
(** [enable_vertex_attribute index] Enable vertex attribute index*)

val disable_vertex_attribute : Unsigned.uint -> unit
(** [disable_vertex_attribute index] Disable vertex attribute index*)

(* val enable_state_pointer : int -> unit Ctypes.ptr -> unit *)
(* (\** [enable_state_pointer vertex_attrib_type buffer] Enable attribute state pointer*\) *)

(* val disable_state_pointer : int -> unit *)
(* (\** [disable_state_pointer vertex_attrib_type] Disable attribute state pointer*\) *)

val active_texture_slot : int -> unit
(** [active_texture_slot slot] Select and active a texture slot*)

val enable_texture : TextureId.t -> unit
(** [enable_texture id] Enable texture*)

val disable_texture : unit -> unit
(** [disable_texture ()] Disable texture*)

val enable_texture_cubemap : TextureId.t -> unit
(** [enable_texture_cubemap id] Enable texture cubemap*)

val disable_texture_cubemap : unit -> unit
(** [disable_texture_cubemap ()] Disable texture cubemap*)

val texture_parameters : TextureId.t -> TexParam.t -> TexParam.t -> unit
(** [texture_parameters id param value] Set texture parameters (filter, wrap)*)

val cubemap_parameters : TextureId.t -> TexParam.t -> TexParam.t -> unit
(** [cubemap_parameters id param value] Set cubemap parameters (filter, wrap)*)

val enable_shader : ShaderProgramId.t -> unit
(** [enable_shader id] Enable shader program*)

val disable_shader : unit -> unit
(** [disable_shader ()] Disable shader program*)

val enable_framebuffer : FramebufferId.t -> unit
(** [enable_framebuffer id] Enable render texture (fbo)*)

val disable_framebuffer : unit -> unit
(** [disable_framebuffer ()] Disable render texture (fbo), return to default
    framebuffer*)

val get_active_framebuffer : unit -> FramebufferId.t
(** [get_active_framebuffer ()] Get the currently active render texture (fbo), 0
    for default framebuffer*)

val active_draw_buffers : int -> unit
(** [active_draw_buffers count] Activate multiple draw color buffers*)

val blit_framebuffer :
  int -> int -> int -> int -> int -> int -> int -> int -> int -> unit
(** [blit_framebuffer src_x src_y src_width src_height dst_x dst_y dst_width
     dst_height buffer_mask] Blit active framebuffer to main framebuffer*)

val bind_framebuffer : FramebufferAccess.t -> FramebufferId.t -> unit
(** [bind_framebuffer target framebuffer] Bind framebuffer (FBO)*)

val enable_color_blend : unit -> unit
(** [enable_color_blend ()] Enable color blending*)

val disable_color_blend : unit -> unit
(** [disable_color_blend ()] Disable color blending*)

val enable_depth_test : unit -> unit
(** [enable_depth_test ()] Enable depth test*)

val disable_depth_test : unit -> unit
(** [disable_depth_test ()] Disable depth test*)

val enable_depth_mask : unit -> unit
(** [enable_depth_mask ()] Enable depth write*)

val disable_depth_mask : unit -> unit
(** [disable_depth_mask ()] Disable depth write*)

val enable_backface_culling : unit -> unit
(** [enable_backface_culling ()] Enable backface culling*)

val disable_backface_culling : unit -> unit
(** [disable_backface_culling ()] Disable backface culling*)

val color_mask : bool -> bool -> bool -> bool -> unit
(** [color_mask r g b a] Color mask control*)

val set_cull_face : CullMode.t -> unit
(** [set_cull_face mode] Set face culling mode*)

val enable_scissor_test : unit -> unit
(** [enable_scissor_test ()] Enable scissor test*)

val disable_scissor_test : unit -> unit
(** [disable_scissor_test ()] Disable scissor test*)

val scissor : int -> int -> int -> int -> unit
(** [scissor x y width height] Scissor test*)

val enable_point_mode : unit -> unit
(** [enable_point_mode ()] Enable point mode*)

val disable_point_mode : unit -> unit
(** [disable_point_mode ()] Disable point mode*)

val set_point_size : float -> unit
(** [set_point_size size] Set the point drawing size*)

val get_point_size : unit -> float
(** [get_point_size ()] Get the point drawing size*)

val enable_wire_mode : unit -> unit
(** [enable_wire_mode ()] Enable wire mode*)

val disable_wire_mode : unit -> unit
(** [disable_wire_mode ()] Disable wire mode*)

val set_line_width : float -> unit
(** [set_line_width width] Set the line drawing width*)

val get_line_width : unit -> float
(** [get_line_width ()] Get the line drawing width*)

val enable_smooth_lines : unit -> unit
(** [enable_smooth_lines ()] Enable line aliasing*)

val disable_smooth_lines : unit -> unit
(** [disable_smooth_lines ()] Disable line aliasing*)

val enable_stereo_render : unit -> unit
(** [enable_stereo_render ()] Enable stereo rendering*)

val disable_stereo_render : unit -> unit
(** [disable_stereo_render ()] Disable stereo rendering*)

val is_stereo_render_enabled : unit -> bool
(** [is_stereo_render_enabled ()] Check if stereo render is enabled*)

val clear_color :
  Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> Unsigned.uchar -> unit
(** [clear_color r g b a] Clear color buffer with color*)

val clear_screen_buffers : unit -> unit
(** [clear_screen_buffers ()] Clear used screen buffers (color and depth)*)

val check_errors : unit -> unit
(** [check_errors ()] Check and log OpenGL error codes*)

val set_blend_mode : BlendMode.t -> unit
(** [set_blend_mode mode] Set blending mode*)

val set_blend_factors :
  BlendFactor.t -> BlendFactor.t -> BlendFunction.t -> unit
(** [set_blend_factors gl_src_factor gl_dst_factor gl_equation] Set blending
    mode factor and equation (using OpenGL factors)*)

val set_blend_factors_separate :
  BlendFactor.t ->
  BlendFactor.t ->
  BlendFactor.t ->
  BlendFactor.t ->
  BlendFunction.t ->
  BlendFunction.t ->
  unit
(** [set_blend_factors_separate gl_src_rgb gl_dst_rgb gl_src_alpha gl_dst_alpha
     gl_eq_rgb gl_eq_alpha] Set blending mode factors and equations separately
    (using OpenGL factors)*)

val rlgl_init : int -> int -> unit
(** [rlgl_init width height] Initialize rlgl (buffers, shaders, textures,
    states)*)

val rlgl_close : unit -> unit
(** [rlgl_close ()] De-initialize rlgl (buffers, shaders, textures)*)

val load_extensions : unit Ctypes.ptr -> unit
(** [load_extensions loader] Load OpenGL extensions (loader function required)*)

val get_version : unit -> RlGlVersion.t
(** [get_version ()] Get current OpenGL version*)

val set_framebuffer_width : int -> unit
(** [set_framebuffer_width width] Set current framebuffer width*)

val get_framebuffer_width : unit -> int
(** [get_framebuffer_width ()] Get default framebuffer width*)

val set_framebuffer_height : int -> unit
(** [set_framebuffer_height height] Set current framebuffer height*)

val get_framebuffer_height : unit -> int
(** [get_framebuffer_height ()] Get default framebuffer height*)

val get_texture_id_default : unit -> TextureId.t
(** [get_texture_id_default ()] Get default texture id*)

val get_shader_id_default : unit -> ShaderProgramId.t
(** [get_shader_id_default ()] Get default shader id*)

val get_shader_locs_default : unit -> ShaderLoc.t Ctypes.ptr
(** [get_shader_locs_default ()] Get default shader locations*)

val load_render_batch : int -> int -> RenderBatch.t
(** [load_render_batch num_buffers buffer_elements] Load a render batch system*)

val unload_render_batch : RenderBatch.t -> unit
(** [unload_render_batch batch] Unload render batch system*)

val draw_render_batch : RenderBatch.t Ctypes.ptr -> unit
(** [draw_render_batch batch] Draw render batch data (Update->Draw->Reset)*)

val set_render_batch_active : RenderBatch.t Ctypes.ptr -> unit
(** [set_render_batch_active batch] Set the active render batch for rlgl (NULL
    for default internal)*)

val draw_render_batch_active : unit -> unit
(** [draw_render_batch_active ()] Update and draw internal render batch*)

val check_render_batch_limit : int -> bool
(** [check_render_batch_limit v_count] Check internal buffer overflow for a
    given number of vertex*)

val set_texture : TextureId.t -> unit
(** [set_texture id] Set current texture for render batch and check buffers
    limits*)

val load_vertex_array : unit -> VaoId.t
(** [load_vertex_array ()] Load vertex array (VAO, if supported)*)

val load_vertex_buffer : unit Ctypes.ptr -> int -> bool -> VboId.t
(** [load_vertex_buffer buffer size dynamic] Load a vertex buffer object*)

val load_vertex_buffer_element : unit Ctypes.ptr -> int -> bool -> VboId.t
(** [load_vertex_buffer_element buffer size dynamic] Load vertex buffer elements
    object*)

val update_vertex_buffer : VboId.t -> unit Ctypes.ptr -> int -> int -> unit
(** [update_vertex_buffer buffer_id data data_size offset] Update vertex buffer
    object data on GPU buffer*)

val update_vertex_buffer_elements :
  VboId.t -> unit Ctypes.ptr -> int -> int -> unit
(** [update_vertex_buffer_elements id data data_size offset] Update vertex
    buffer elements data on GPU buffer*)

val unload_vertex_array : VaoId.t -> unit
(** [unload_vertex_array vao_id] Unload vertex array (VAO)*)

val unload_vertex_buffer : VboId.t -> unit
(** [unload_vertex_buffer vbo_id] Unload vertex buffer object*)

val set_vertex_attribute :
  Unsigned.uint -> int -> GlDataType.t -> bool -> int -> int -> unit
(** [set_vertex_attribute index comp_size type normalized stride offset] Set
    vertex attribute data configuration*)

val set_vertex_attribute_divisor : Unsigned.uint -> int -> unit
(** [set_vertex_attribute_divisor index divisor] Set vertex attribute data
    divisor*)

val set_vertex_attribute_default :
  int -> unit Ctypes.ptr -> ShaderAttributeDataType.t -> int -> unit
(** [set_vertex_attribute_default loc_index value attrib_type count] Set vertex
    attribute default value*)

val draw_vertex_array : int -> int -> unit
(** [draw_vertex_array offset count] Draw vertex array (currently active VAO)*)

val draw_vertex_array_elements : int -> int -> unit Ctypes.ptr -> unit
(** [draw_vertex_array_elements offset count buffer] Draw vertex array elements*)

val draw_vertex_array_instanced : int -> int -> int -> unit
(** [draw_vertex_array_instanced offset count instances] Draw vertex array with
    instancing*)

val draw_vertex_array_elements_instanced :
  int -> int -> unit Ctypes.ptr -> int -> unit
(** [draw_vertex_array_elements_instanced offset count buffer instances] Draw
    vertex array elements with instancing*)

val load_texture :
  unit Ctypes.ptr -> int -> int -> PixelFormat.t -> int -> TextureId.t
(** [load_texture data width height format mipmap_count] Load texture data*)

val load_texture_depth : int -> int -> bool -> TextureId.t
(** [load_texture_depth width height use_render_buffer] Load depth
    texture/renderbuffer*)

val load_texture_cubemap :
  unit Ctypes.ptr -> int -> PixelFormat.t -> int -> TextureId.t
(** [load_texture_cubemap data size format mipmap_count] Load texture cubemap
    data*)

val update_texture :
  TextureId.t ->
  int ->
  int ->
  int ->
  int ->
  PixelFormat.t ->
  unit Ctypes.ptr ->
  unit
(** [update_texture id offset_x offset_y width height format data] Update
    texture with new data on GPU*)

val get_gl_texture_formats :
  PixelFormat.t ->
  Unsigned.uint Ctypes.ptr ->
  Unsigned.uint Ctypes.ptr ->
  Unsigned.uint Ctypes.ptr ->
  unit
(** [get_gl_texture_formats format gl_internal_format gl_format gl_type] Get
    OpenGL internal formats*)

val get_pixel_format_name : PixelFormat.t -> string
(** [get_pixel_format_name format] Get name string for pixel format*)

val unload_texture : TextureId.t -> unit
(** [unload_texture id] Unload texture from GPU memory*)

val gen_texture_mipmaps :
  TextureId.t -> int -> int -> PixelFormat.t -> int Ctypes.ptr -> unit
(** [gen_texture_mipmaps id width height format mipmaps] Generate mipmap data
    for selected texture*)

val read_texture_pixels :
  TextureId.t -> int -> int -> PixelFormat.t -> unit Ctypes.ptr
(** [read_texture_pixels id width height format] Read texture pixel data*)

val read_screen_pixels : int -> int -> Unsigned.uchar Ctypes.ptr
(** [read_screen_pixels width height] Read screen pixel data (color buffer)*)

val load_framebuffer : unit -> FramebufferId.t
(** [load_framebuffer ()] Load an empty framebuffer*)

val framebuffer_attach :
  FramebufferId.t ->
  TextureId.t ->
  FramebufferAttachType.t ->
  FramebufferAttachTextureType.t ->
  int ->
  unit
(** [framebuffer_attach id tex_id attach_type tex_type mip_level] Attach
    texture/renderbuffer to a framebuffer*)

val framebuffer_complete : FramebufferId.t -> bool
(** [framebuffer_complete id] Verify framebuffer is complete*)

val unload_framebuffer : FramebufferId.t -> unit
(** [unload_framebuffer id] Delete framebuffer from GPU*)

val copy_framebuffer :
  int -> int -> int -> int -> PixelFormat.t -> unit Ctypes.ptr -> unit
(** [copy_framebuffer x y width height format pixels] Copy framebuffer pixel
    data to internal buffer*)

val resize_framebuffer : int -> int -> unit
(** [resize_framebuffer width height] Resize internal framebuffer*)

val load_shader_program : string -> string -> ShaderProgramId.t
(** [load_shader_program vs_code fs_code] Load shader from code strings*)

val load_shader : string -> Shader.t -> ShaderId.t
(** [load_shader code type] Load (compile) shader*)

val load_shader_program_ex : ShaderId.t -> ShaderId.t -> ShaderProgramId.t
(** [load_shader_program_ex vs_id fs_id] Load shader program, using already
    loaded shader ids*)

val load_shader_program_compute : ShaderId.t -> ShaderProgramId.t
(** [load_shader_program_compute cs_id] Load compute shader program*)

val unload_shader : ShaderId.t -> unit
(** [unload_shader id] Unload shader*)

val unload_shader_program : ShaderProgramId.t -> unit
(** [unload_shader_program id] Unload shader program*)

val get_location_uniform : ShaderProgramId.t -> string -> ShaderLoc.t
(** [get_location_uniform id uniform_name] Get shader location uniform*)

val get_location_attrib : ShaderProgramId.t -> string -> ShaderLoc.t
(** [get_location_attrib id attrib_name] Get shader location attribute*)

val set_uniform :
  ShaderLoc.t -> unit Ctypes.ptr -> ShaderUniformDataType.t -> int -> unit
(** [set_uniform loc_index value uniform_type count] Set shader value uniform*)

val set_uniform_matrix : ShaderLoc.t -> Matrix.t -> unit
(** [set_uniform_matrix loc_index mat] Set shader value matrix*)

val set_uniform_matrices : ShaderLoc.t -> Matrix.t Ctypes.ptr -> int -> unit
(** [set_uniform_matrices loc_index mat count] Set shader value matrices*)

val set_uniform_sampler : ShaderLoc.t -> TextureId.t -> unit
(** [set_uniform_sampler loc_index texture_id] Set shader value sampler*)

val set_shader : ShaderProgramId.t -> ShaderLoc.t Ctypes.ptr -> unit
(** [set_shader id locs] Set shader currently active*)

val compute_shader_dispatch :
  Unsigned.uint -> Unsigned.uint -> Unsigned.uint -> unit
(** [compute_shader_dispatch group_x group_y group_z] Dispatch compute shader*)

val load_shader_buffer :
  Unsigned.uint -> unit Ctypes.ptr -> BufferUsage.t -> SsboId.t
(** [load_shader_buffer size data usage_hint] Load shader storage buffer object
    (SSBO)*)

val unload_shader_buffer : SsboId.t -> unit
(** [unload_shader_buffer ssbo_id] Unload shader storage buffer object (SSBO)*)

val update_shader_buffer :
  SsboId.t -> unit Ctypes.ptr -> Unsigned.uint -> Unsigned.uint -> unit
(** [update_shader_buffer id data data_size offset] Update SSBO buffer data*)

val bind_shader_buffer : SsboId.t -> Unsigned.uint -> unit
(** [bind_shader_buffer id index] Bind SSBO buffer*)

val read_shader_buffer :
  SsboId.t -> unit Ctypes.ptr -> Unsigned.uint -> Unsigned.uint -> unit
(** [read_shader_buffer id dest count offset] Read SSBO buffer data*)

val copy_shader_buffer :
  SsboId.t ->
  SsboId.t ->
  Unsigned.uint ->
  Unsigned.uint ->
  Unsigned.uint ->
  unit
(** [copy_shader_buffer dest_id src_id dest_offset src_offset count] Copy SSBO
    data between buffers*)

val get_shader_buffer_size : SsboId.t -> int
(** [get_shader_buffer_size id] Get SSBO buffer size*)

val bind_image_texture :
  TextureId.t -> Unsigned.uint -> PixelFormat.t -> bool -> unit
(** [bind_image_texture id index format readonly] Bind image texture*)

val get_matrix_modelview : unit -> Matrix.t
(** [get_matrix_modelview ()] Get internal modelview matrix*)

val get_matrix_projection : unit -> Matrix.t
(** [get_matrix_projection ()] Get internal projection matrix*)

val get_matrix_transform : unit -> Matrix.t
(** [get_matrix_transform ()] Get internal accumulated transform matrix*)

val get_matrix_projection_stereo : int -> Matrix.t
(** [get_matrix_projection_stereo eye] Get internal projection matrix for stereo
    render*)

val get_matrix_view_offset_stereo : int -> Matrix.t
(** [get_matrix_view_offset_stereo eye] Get internal view offset matrix for
    stereo render*)

val set_matrix_projection : Matrix.t -> unit
(** [set_matrix_projection proj] Set a custom projection matrix*)

val set_matrix_modelview : Matrix.t -> unit
(** [set_matrix_modelview view] Set a custom modelview matrix*)

val set_matrix_projection_stereo : Matrix.t -> Matrix.t -> unit
(** [set_matrix_projection_stereo right left] Set eyes projection matrices for
    stereo rendering*)

val set_matrix_view_offset_stereo : Matrix.t -> Matrix.t -> unit
(** [set_matrix_view_offset_stereo right left] Set eyes view offsets matrices
    for stereo rendering*)

val load_draw_cube : unit -> unit
(** [load_draw_cube ()] Load and draw a cube*)

val load_draw_quad : unit -> unit
(** [load_draw_quad ()] Load and draw a quad*)
