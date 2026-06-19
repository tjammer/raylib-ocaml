module Types (F : Ctypes.TYPE) = struct
  open F

  module RlGlVersion = struct
    type t = Gl_software | Gl_11 | Gl_21 | Gl_33 | Gl_43 | Gl_es_20 | Gl_es_30

    let vals =
      [
        (Gl_software, constant "RL_OPENGL_SOFTWARE" int64_t);
        (Gl_11, constant "RL_OPENGL_11" int64_t);
        (Gl_21, constant "RL_OPENGL_21" int64_t);
        (Gl_33, constant "RL_OPENGL_33" int64_t);
        (Gl_43, constant "RL_OPENGL_43" int64_t);
        (Gl_es_20, constant "RL_OPENGL_ES_20" int64_t);
        (Gl_es_30, constant "RL_OPENGL_ES_30" int64_t);
      ]

    let t = enum "rlGlVersion" ~typedef:true vals
  end

  module FramebufferAttachType = struct
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

    let vals =
      [
        (Color_channel0, constant "RL_ATTACHMENT_COLOR_CHANNEL0" int64_t);
        (Color_channel1, constant "RL_ATTACHMENT_COLOR_CHANNEL1" int64_t);
        (Color_channel2, constant "RL_ATTACHMENT_COLOR_CHANNEL2" int64_t);
        (Color_channel3, constant "RL_ATTACHMENT_COLOR_CHANNEL3" int64_t);
        (Color_channel4, constant "RL_ATTACHMENT_COLOR_CHANNEL4" int64_t);
        (Color_channel5, constant "RL_ATTACHMENT_COLOR_CHANNEL5" int64_t);
        (Color_channel6, constant "RL_ATTACHMENT_COLOR_CHANNEL6" int64_t);
        (Color_channel7, constant "RL_ATTACHMENT_COLOR_CHANNEL7" int64_t);
        (Depth, constant "RL_ATTACHMENT_DEPTH" int64_t);
        (Stencil, constant "RL_ATTACHMENT_STENCIL" int64_t);
      ]

    let t = enum "rlFramebufferAttachType" ~typedef:true vals
  end

  module FramebufferAttachTextureType = struct
    type t =
      | Cubemap_positive_x
      | Cubemap_negative_x
      | Cubemap_positive_y
      | Cubemap_negative_y
      | Cubemap_positive_z
      | Cubemap_negative_z
      | Texture2d
      | Renderbuffer

    let vals =
      [
        (Cubemap_positive_x, constant "RL_ATTACHMENT_CUBEMAP_POSITIVE_X" int64_t);
        (Cubemap_negative_x, constant "RL_ATTACHMENT_CUBEMAP_NEGATIVE_X" int64_t);
        (Cubemap_positive_y, constant "RL_ATTACHMENT_CUBEMAP_POSITIVE_Y" int64_t);
        (Cubemap_negative_y, constant "RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y" int64_t);
        (Cubemap_positive_z, constant "RL_ATTACHMENT_CUBEMAP_POSITIVE_Z" int64_t);
        (Cubemap_negative_z, constant "RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z" int64_t);
        (Texture2d, constant "RL_ATTACHMENT_TEXTURE2D" int64_t);
        (Renderbuffer, constant "RL_ATTACHMENT_RENDERBUFFER" int64_t);
      ]

    let t = enum "rlFramebufferAttachTextureType" ~typedef:true vals
  end

  module CullMode = struct
    type t = Face_front | Face_back

    let t =
      enum "rlCullMode" ~typedef:true
        [
          (Face_front, constant "RL_CULL_FACE_FRONT" int64_t);
          (Face_back, constant "RL_CULL_FACE_BACK" int64_t);
        ]
  end

  module Shader = struct
    type t = Signed.Int64.t

    let t = int64_t
    let fragment_shader = constant "RL_FRAGMENT_SHADER" int64_t
    let vertex_shader = constant "RL_VERTEX_SHADER" int64_t
    let compute_shader = constant "RL_COMPUTE_SHADER" int64_t
  end

  module BufferUsage = struct
    type t = Signed.Int64.t

    let t = int64_t
    let stream_draw = constant "RL_STREAM_DRAW" int64_t
    let stream_read = constant "RL_STREAM_READ" int64_t
    let stream_copy = constant "RL_STREAM_COPY" int64_t
    let static_draw = constant "RL_STATIC_DRAW" int64_t
    let static_read = constant "RL_STATIC_READ" int64_t
    let static_copy = constant "RL_STATIC_COPY" int64_t
    let dynamic_draw = constant "RL_DYNAMIC_DRAW" int64_t
    let dynamic_read = constant "RL_DYNAMIC_READ" int64_t
    let dynamic_copy = constant "RL_DYNAMIC_COPY" int64_t
  end

  module BlendFactor = struct
    type t = Signed.Int64.t

    let t = int64_t
    let zero = constant "RL_ZERO" int64_t
    let one = constant "RL_ONE" int64_t
    let src_color = constant "RL_SRC_COLOR" int64_t
    let one_minus_src_color = constant "RL_ONE_MINUS_SRC_COLOR" int64_t
    let src_alpha = constant "RL_SRC_ALPHA" int64_t
    let one_minus_src_alpha = constant "RL_ONE_MINUS_SRC_ALPHA" int64_t
    let dst_alpha = constant "RL_DST_ALPHA" int64_t
    let one_minus_dst_alpha = constant "RL_ONE_MINUS_DST_ALPHA" int64_t
    let dst_color = constant "RL_DST_COLOR" int64_t
    let one_minus_dst_color = constant "RL_ONE_MINUS_DST_COLOR" int64_t
    let src_alpha_saturate = constant "RL_SRC_ALPHA_SATURATE" int64_t
    let constant_color = constant "RL_CONSTANT_COLOR" int64_t

    let one_minus_constant_color =
      constant "RL_ONE_MINUS_CONSTANT_COLOR" int64_t

    let constant_alpha = constant "RL_CONSTANT_ALPHA" int64_t

    let one_minus_constant_alpha =
      constant "RL_ONE_MINUS_CONSTANT_ALPHA" int64_t
  end

  module BlendFunction = struct
    type t = Signed.Int64.t

    let t = int64_t
    let func_add = constant "RL_FUNC_ADD" int64_t
    let min_eq = constant "RL_MIN" int64_t
    let max_eq = constant "RL_MAX" int64_t
    let func_subtract = constant "RL_FUNC_SUBTRACT" int64_t
    let func_reverse_subtract = constant "RL_FUNC_REVERSE_SUBTRACT" int64_t
    let blend_equation = constant "RL_BLEND_EQUATION" int64_t
    let blend_equation_rgb = constant "RL_BLEND_EQUATION_RGB" int64_t
    let blend_equation_alpha = constant "RL_BLEND_EQUATION_ALPHA" int64_t
    let blend_dst_rgb = constant "RL_BLEND_DST_RGB" int64_t
    let blend_src_rgb = constant "RL_BLEND_SRC_RGB" int64_t
    let blend_dst_alpha = constant "RL_BLEND_DST_ALPHA" int64_t
    let blend_src_alpha = constant "RL_BLEND_SRC_ALPHA" int64_t
    let blend_color = constant "RL_BLEND_COLOR" int64_t
  end

  module DrawMode = struct
    type t = Signed.Int64.t

    let t = int64_t
    let lines = constant "RL_LINES" int64_t
    let triangles = constant "RL_TRIANGLES" int64_t
    let quads = constant "RL_QUADS" int64_t
  end

  module MatrixMode = struct
    type t = Signed.Int64.t

    let t = int64_t
    let modelview = constant "RL_MODELVIEW" int64_t
    let projection = constant "RL_PROJECTION" int64_t
    let texture = constant "RL_TEXTURE" int64_t
  end

  module FramebufferAccess = struct
    type t = Signed.Int64.t

    let t = int64_t
    let read_framebuffer = constant "RL_READ_FRAMEBUFFER" int64_t
    let draw_framebuffer = constant "RL_DRAW_FRAMEBUFFER" int64_t
  end

  module TexParam = struct
    type t = Signed.Int64.t

    let t = int64_t
    let wrap_s = constant "RL_TEXTURE_WRAP_S" int64_t
    let wrap_t = constant "RL_TEXTURE_WRAP_T" int64_t
    let mag_filter = constant "RL_TEXTURE_MAG_FILTER" int64_t
    let min_filter = constant "RL_TEXTURE_MIN_FILTER" int64_t
    let filter_nearest = constant "RL_TEXTURE_FILTER_NEAREST" int64_t
    let filter_linear = constant "RL_TEXTURE_FILTER_LINEAR" int64_t
    let filter_mip_nearest = constant "RL_TEXTURE_FILTER_MIP_NEAREST" int64_t

    let filter_nearest_mip_linear =
      constant "RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR" int64_t

    let filter_linear_mip_nearest =
      constant "RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST" int64_t

    let filter_mip_linear = constant "RL_TEXTURE_FILTER_MIP_LINEAR" int64_t
    let filter_anisotropic = constant "RL_TEXTURE_FILTER_ANISOTROPIC" int64_t
    let mipmap_bias_ratio = constant "RL_TEXTURE_MIPMAP_BIAS_RATIO" int64_t
    let wrap_repeat = constant "RL_TEXTURE_WRAP_REPEAT" int64_t
    let wrap_clamp = constant "RL_TEXTURE_WRAP_CLAMP" int64_t
    let wrap_mirror_repeat = constant "RL_TEXTURE_WRAP_MIRROR_REPEAT" int64_t
    let wrap_mirror_clamp = constant "RL_TEXTURE_WRAP_MIRROR_CLAMP" int64_t
  end

  module GlDataType = struct
    type t = Signed.Int64.t

    let t = int64_t
    let unsigned_byte = constant "RL_UNSIGNED_BYTE" int64_t
    let float = constant "RL_FLOAT" int64_t
  end

  module ShaderLocAlias = struct
    type t = Signed.Int64.t

    let t = int64_t
    let map_diffuse = constant "RL_SHADER_LOC_MAP_DIFFUSE" int64_t
    let map_specular = constant "RL_SHADER_LOC_MAP_SPECULAR" int64_t
  end

  module VaoId = struct
    type t = Unsigned.uint

    let t = uint
    let of_uint x = x
    let to_uint x = x
  end

  module VboId = struct
    type t = Unsigned.uint

    let t = uint
    let of_uint x = x
    let to_uint x = x
  end

  module ShaderId = struct
    type t = Unsigned.uint

    let t = uint
    let of_uint x = x
    let to_uint x = x
  end

  module SsboId = struct
    type t = Unsigned.uint

    let t = uint
    let of_uint x = x
    let to_uint x = x
  end

  module VertexBuffer = struct
    let uint_array_5 = array 5 uint

    type t

    let t : t Ctypes.structure typ = structure "rlVertexBuffer"
    let element_count = field t "elementCount" int
    let vertices = field t "vertices" (ptr float)
    let texcoords = field t "texcoords" (ptr float)
    let colors = field t "colors" (ptr uchar)

    (* TODO assume opengl 11, for es2 this would be indices : short ptr *)
    let indices = field t "indices" (ptr uint)
    let vao_id = field t "vaoId" uint
    let vbo_id = field t "vboId" uint_array_5
    let () = seal t
  end

  module DrawCall = struct
    type t

    let t : t Ctypes.structure typ = structure "rlDrawCall"
    let mode = field t "mode" int
    let vertex_count = field t "vertexCount" int
    let vertex_alignment = field t "vertexAlignment" int
    let texture_id = field t "textureId" uint
    let () = seal t
  end

  module RenderBatch = struct
    type t

    let t : t Ctypes.structure typ = structure "rlRenderBatch"
    let buffer_count = field t "bufferCount" int
    let current_buffer = field t "currentBuffer" int
    let vertex_buffer = field t "vertexBuffer" (ptr VertexBuffer.t)
    let draws = field t "draws" (ptr DrawCall.t)
    let draw_counter = field t "drawCounter" int
    let current_depth = field t "currentDepth" float
    let () = seal t
  end
end
