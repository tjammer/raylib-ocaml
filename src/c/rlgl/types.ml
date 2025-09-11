module Types (F : Ctypes.TYPE) = struct
  open F

  module RlVertexBuffer = struct
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

  module RlDrawCall = struct
    type t

    let t : t Ctypes.structure typ = structure "rlDrawCall"
    let mode = field t "mode" int
    let vertex_count = field t "vertexCount" int
    let vertex_alignment = field t "vertexAlignment" int
    let texture_id = field t "textureId" uint
    let () = seal t
  end

  module RlRenderBatch = struct
    type t

    let t : t Ctypes.structure typ = structure "rlRenderBatch"
    let buffer_count = field t "bufferCount" int
    let current_buffer = field t "currentBuffer" int
    let vertex_buffer = field t "vertexBuffer" (ptr RlVertexBuffer.t)
    let draws = field t "draws" (ptr RlDrawCall.t)
    let draw_counter = field t "drawCounter" int
    let current_depth = field t "currentDepth" float
    let () = seal t
  end

  (* TODO unnecessary
module RlglData = struct
  type%c t = {
    current_batch : RlRenderBatch ptr;
    default_batch : RlRenderBatch;
    current_matrix_mode : int;
    current_matrix : Matrix.t ptr;
    modelview : Matrix.t;
    projection : Matrix.t;
    transform : Matrix.t;


  }
end
    struct {
        int currentMatrixMode;              // Current matrix mode
        Matrix *currentMatrix;            // Current matrix pointer
        Matrix modelview;                 // Default modelview matrix
        Matrix projection;                // Default projection matrix
        Matrix transform;                 // Transform matrix to be used with rlTranslate, rlRotate, rlScale
        bool transformRequired;             // Require transform matrix application to current draw-call vertex (if required)
        Matrix stack[RL_MAX_MATRIX_STACK_SIZE];// Matrix stack for push/pop
        int stackCounter;                   // Matrix stack counter

        unsigned int defaultTextureId;      // Default texture used on shapes/poly drawing (required by shader)
        unsigned int activeTextureId[RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS];    // Active texture ids to be enabled on batch drawing (0 active by default)
        unsigned int defaultVShaderId;      // Default vertex shader id (used by default shader program)
        unsigned int defaultFShaderId;      // Default fragment shader id (used by default shader program)
        unsigned int defaultShaderId;       // Default shader program id, supports vertex color and diffuse texture
        int *defaultShaderLocs;             // Default shader locations pointer to be used on rendering
        unsigned int currentShaderId;       // Current shader id to be used on rendering (by default, defaultShaderId)
        int *currentShaderLocs;             // Current shader locations pointer to be used on rendering (by default, defaultShaderLocs)

        bool stereoRender;                  // Stereo rendering flag
        Matrix projectionStereo[2];       // VR stereo rendering eyes projection matrices
        Matrix viewOffsetStereo[2];       // VR stereo rendering eyes view offset matrices

        int currentBlendMode;               // Blending mode active
        int glBlendSrcFactor;               // Blending source factor
        int glBlendDstFactor;               // Blending destination factor
        int glBlendEquation;                // Blending equation

        int framebufferWidth;               // Default framebuffer width
        int framebufferHeight;              // Default framebuffer height

    } State;            // Renderer state
    struct {
        bool vao;                           // VAO support (OpenGL ES2 could not support VAO extension) (GL_ARB_vertex_array_object)
        bool instancing;                    // Instancing supported (GL_ANGLE_instanced_arrays, GL_EXT_draw_instanced + GL_EXT_instanced_arrays)
        bool texNPOT;                       // NPOT textures full support (GL_ARB_texture_non_power_of_two, GL_OES_texture_npot)
        bool texDepth;                      // Depth textures supported (GL_ARB_depth_texture, GL_WEBGL_depth_texture, GL_OES_depth_texture)
        bool texFloat32;                    // float textures support (32 bit per channel) (GL_OES_texture_float)
        bool texCompDXT;                    // DDS texture compression support (GL_EXT_texture_compression_s3tc, GL_WEBGL_compressed_texture_s3tc, GL_WEBKIT_WEBGL_compressed_texture_s3tc)
        bool texCompETC1;                   // ETC1 texture compression support (GL_OES_compressed_ETC1_RGB8_texture, GL_WEBGL_compressed_texture_etc1)
        bool texCompETC2;                   // ETC2/EAC texture compression support (GL_ARB_ES3_compatibility)
        bool texCompPVRT;                   // PVR texture compression support (GL_IMG_texture_compression_pvrtc)
        bool texCompASTC;                   // ASTC texture compression support (GL_KHR_texture_compression_astc_hdr, GL_KHR_texture_compression_astc_ldr)
        bool texMirrorClamp;                // Clamp mirror wrap mode supported (GL_EXT_texture_mirror_clamp)
        bool texAnisoFilter;                // Anisotropic texture filtering support (GL_EXT_texture_filter_anisotropic)

        float maxAnisotropyLevel;           // Maximum anisotropy level supported (minimum is 2.0f)
        int maxDepthBits;                   // Maximum bits for depth component

    } ExtSupported;     // Extensions supported flags
} rlglData;

   * *)
end
