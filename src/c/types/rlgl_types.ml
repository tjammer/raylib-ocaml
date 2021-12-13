let%c () = header "#include <raylib.h>\n\n#include <rlgl.h>"

module RlVertexBuffer = struct
  let%c uint_array_4 = array 4 uint

  type%c t = {
    element_count : int; [@cname "elementCount"]
    vertices : float ptr;
    texcoords : float ptr;
    colors : uchar ptr;
    (* TODO assume opengl 11, for es2 this would be indices : short ptr *)
    indices : uint ptr;
    vao_id : uint; [@cname "vaoId"]
    vbo_id : uint_array_4; [@cname "vboId"]
  }
  [@@cname "rlVertexBuffer"]
end

module RlDrawCall = struct
  type%c t = {
    mode : int;
    vertex_count : int; [@cname "vertexCount"]
    vertex_alignment : int; [@cname "vertexAlignment"]
    texture_id : uint; [@cname "textureId"]
  }
  [@@cname "rlDrawCall"]
end

module RlRenderBatch = struct
  type%c t = {
    buffer_count : int; [@cname "bufferCount"]
    current_buffer : int; [@cname "currentBuffer"]
    vertex_buffer : RlVertexBuffer.t ptr; [@cname "vertexBuffer"]
    draws : RlDrawCall.t ptr;
    draw_counter : int; [@cname "drawCounter"]
    current_depth : float [@cname "currentDepth"]
  }
  [@@cname "rlRenderBatch"]
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
