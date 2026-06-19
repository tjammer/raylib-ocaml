module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Raylib_core
  open Rlgl_types_generated

  (*------------------------------------------------------------------------------------*)
  (* Functions Declaration - Matrix operations*)
  (*------------------------------------------------------------------------------------*)
  (* Choose the current matrix to be transformed*)
  let matrix_mode = foreign "rlMatrixMode" (MatrixMode.t @-> returning void)

  (* Push the current matrix to stack*)
  let push_matrix = foreign "rlPushMatrix" (void @-> returning void)

  (* Pop lattest inserted matrix from stack*)
  let pop_matrix = foreign "rlPopMatrix" (void @-> returning void)

  (* Reset current matrix to identity matrix*)
  let load_identity = foreign "rlLoadIdentity" (void @-> returning void)

  (* Multiply the current matrix by a translation matrix*)
  let translatef =
    foreign "rlTranslatef" (float @-> float @-> float @-> returning void)

  (* Multiply the current matrix by a rotation matrix*)
  let rotatef =
    foreign "rlRotatef" (float @-> float @-> float @-> float @-> returning void)

  (* Multiply the current matrix by a scaling matrix*)
  let scalef = foreign "rlScalef" (float @-> float @-> float @-> returning void)

  (* Multiply the current matrix by another matrix*)
  let mult_matrixf = foreign "rlMultMatrixf" (ptr float @-> returning void)

  let frustum =
    foreign "rlFrustum"
      (double @-> double @-> double @-> double @-> double @-> double
     @-> returning void)

  let ortho =
    foreign "rlOrtho"
      (double @-> double @-> double @-> double @-> double @-> double
     @-> returning void)

  (* Set the viewport area*)
  let viewport =
    foreign "rlViewport" (int @-> int @-> int @-> int @-> returning void)

  (*------------------------------------------------------------------------------------*)
  (* Functions Declaration - Vertex level operations*)
  (*------------------------------------------------------------------------------------*)
  (* Initialize drawing mode (how to organize vertex)*)
  let rl_begin = foreign "rlBegin" (DrawMode.t @-> returning void)

  (* Finish vertex providing*)
  let rl_end = foreign "rlEnd" (void @-> returning void)

  (* Define one vertex (position) - 2 int*)
  let vertex2i = foreign "rlVertex2i" (int @-> int @-> returning void)

  (* Define one vertex (position) - 2 float*)
  let vertex2f = foreign "rlVertex2f" (float @-> float @-> returning void)

  (* Define one vertex (position) - 3 float*)
  let vertex3f =
    foreign "rlVertex3f" (float @-> float @-> float @-> returning void)

  (* Define one vertex (texture coordinate) - 2 float*)
  let tex_coord2f = foreign "rlTexCoord2f" (float @-> float @-> returning void)

  (* Define one vertex (normal) - 3 float*)
  let normal3f =
    foreign "rlNormal3f" (float @-> float @-> float @-> returning void)

  (* Define one vertex (color) - 4 byte*)
  let color4ub =
    foreign "rlColor4ub" (uchar @-> uchar @-> uchar @-> uchar @-> returning void)

  (* Define one vertex (color) - 3 float*)
  let color3f =
    foreign "rlColor3f" (float @-> float @-> float @-> returning void)

  (* Define one vertex (color) - 4 float*)
  let color4f =
    foreign "rlColor4f" (float @-> float @-> float @-> float @-> returning void)

  (*------------------------------------------------------------------------------------*)
  (* Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)*)
  (* NOTE: This functions are used to completely abstract raylib code from OpenGL layer,*)
  (* some of them are direct wrappers over OpenGL calls, some others are custom*)
  (*------------------------------------------------------------------------------------*)

  (* Vertex buffers state*)
  (* Enable vertex array (VAO, if supported)*)
  let enable_vertex_array =
    foreign "rlEnableVertexArray" (VaoId.t @-> returning bool)

  (* Disable vertex array (VAO, if supported)*)
  let disable_vertex_array =
    foreign "rlDisableVertexArray" (void @-> returning void)

  (* Enable vertex buffer (VBO)*)
  let enable_vertex_buffer =
    foreign "rlEnableVertexBuffer" (VboId.t @-> returning void)

  (* Disable vertex buffer (VBO)*)
  let disable_vertex_buffer =
    foreign "rlDisableVertexBuffer" (void @-> returning void)

  (* Enable vertex buffer element (VBO element)*)
  let enable_vertex_buffer_element =
    foreign "rlEnableVertexBufferElement" (VboId.t @-> returning void)

  (* Disable vertex buffer element (VBO element)*)
  let disable_vertex_buffer_element =
    foreign "rlDisableVertexBufferElement" (void @-> returning void)

  (* Enable vertex attribute index*)
  let enable_vertex_attribute =
    foreign "rlEnableVertexAttribute" (uint @-> returning void)

  (* Disable vertex attribute index*)
  let disable_vertex_attribute =
    foreign "rlDisableVertexAttribute" (uint @-> returning void)

  (* TODO handle opengl 11 correctly *)
  (*#if defined(GRAPHICS_API_OPENGL_11)
    let enable_state_pointer = foreign "rlEnableStatePointer" (int @-> ptr void @-> returning void)
    let disable_state_pointer = foreign "rlDisableStatePointer" (int @-> returning void)
    #endif*)

  (* Textures state*)
  (* Select and active a texture slot*)
  let active_texture_slot =
    foreign "rlActiveTextureSlot" (int @-> returning void)

  (* Enable texture*)
  let enable_texture = foreign "rlEnableTexture" (TextureId.t @-> returning void)

  (* Disable texture*)
  let disable_texture = foreign "rlDisableTexture" (void @-> returning void)

  (* Enable texture cubemap*)
  let enable_texture_cubemap =
    foreign "rlEnableTextureCubemap" (TextureId.t @-> returning void)

  (* Disable texture cubemap*)
  let disable_texture_cubemap =
    foreign "rlDisableTextureCubemap" (void @-> returning void)

  (* Set texture parameters (filter, wrap)*)
  let texture_parameters =
    foreign "rlTextureParameters"
      (TextureId.t @-> TexParam.t @-> TexParam.t @-> returning void)

  let cubemap_parameters =
    foreign "rlCubemapParameters"
      (TextureId.t @-> TexParam.t @-> TexParam.t @-> returning void)

  (* Shader state*)
  (* Enable shader program*)
  let enable_shader =
    foreign "rlEnableShader" (ShaderProgramId.t @-> returning void)

  (* Disable shader program*)
  let disable_shader = foreign "rlDisableShader" (void @-> returning void)

  (* Framebuffer state*)
  (* Enable render texture (fbo)*)
  let enable_framebuffer =
    foreign "rlEnableFramebuffer" (FramebufferId.t @-> returning void)

  (* Disable render texture (fbo), return to default framebuffer*)
  let disable_framebuffer =
    foreign "rlDisableFramebuffer" (void @-> returning void)

  let get_active_framebuffer =
    foreign "rlGetActiveFramebuffer" (void @-> returning FramebufferId.t)

  let active_draw_buffers =
    foreign "rlActiveDrawBuffers" (int @-> returning void)

  let blit_framebuffer =
    foreign "rlBlitFramebuffer"
      (int @-> int @-> int @-> int @-> int @-> int @-> int @-> int @-> int
     @-> returning void)

  let bind_framebuffer =
    foreign "rlBindFramebuffer"
      (FramebufferAccess.t @-> FramebufferId.t @-> returning void)

  (* General render state*)
  let enable_color_blend = foreign "rlEnableColorBlend" (void @-> returning void)

  let disable_color_blend =
    foreign "rlDisableColorBlend" (void @-> returning void)
  (* Enable depth test*)

  let enable_depth_test = foreign "rlEnableDepthTest" (void @-> returning void)

  (* Disable depth test*)
  let disable_depth_test = foreign "rlDisableDepthTest" (void @-> returning void)

  (* Enable depth write*)
  let enable_depth_mask = foreign "rlEnableDepthMask" (void @-> returning void)

  (* Disable depth write*)
  let disable_depth_mask = foreign "rlDisableDepthMask" (void @-> returning void)

  (* Enable backface culling*)
  let enable_backface_culling =
    foreign "rlEnableBackfaceCulling" (void @-> returning void)

  (* Disable backface culling*)
  let disable_backface_culling =
    foreign "rlDisableBackfaceCulling" (void @-> returning void)

  let color_mask =
    foreign "rlColorMask" (bool @-> bool @-> bool @-> bool @-> returning void)

  let set_cull_face = foreign "rlSetCullFace" (CullMode.t @-> returning void)

  (* Enable scissor test*)
  let enable_scissor_test =
    foreign "rlEnableScissorTest" (void @-> returning void)

  (* Disable scissor test*)
  let disable_scissor_test =
    foreign "rlDisableScissorTest" (void @-> returning void)

  (* Scissor test*)
  let scissor =
    foreign "rlScissor" (int @-> int @-> int @-> int @-> returning void)

  let enable_point_mode = foreign "rlEnablePointMode" (void @-> returning void)
  let disable_point_mode = foreign "rlDisablePointMode" (void @-> returning void)
  let set_point_size = foreign "rlSetPointSize" (float @-> returning void)
  let get_point_size = foreign "rlGetPointSize" (void @-> returning float)

  (* Enable wire mode*)
  let enable_wire_mode = foreign "rlEnableWireMode" (void @-> returning void)

  (* Disable wire mode*)
  let disable_wire_mode = foreign "rlDisableWireMode" (void @-> returning void)

  (* Set the line drawing width*)
  let set_line_width = foreign "rlSetLineWidth" (float @-> returning void)

  (* Get the line drawing width*)
  let get_line_width = foreign "rlGetLineWidth" (void @-> returning float)

  (* Enable line aliasing*)
  let enable_smooth_lines =
    foreign "rlEnableSmoothLines" (void @-> returning void)

  (* Disable line aliasing*)
  let disable_smooth_lines =
    foreign "rlDisableSmoothLines" (void @-> returning void)

  (* Enable stereo rendering*)
  let enable_stereo_render =
    foreign "rlEnableStereoRender" (void @-> returning void)

  (* Disable stereo rendering*)
  let disable_stereo_render =
    foreign "rlDisableStereoRender" (void @-> returning void)

  (* Check if stereo render is enabled*)
  let is_stereo_render_enabled =
    foreign "rlIsStereoRenderEnabled" (void @-> returning bool)

  (* Clear color buffer with color*)
  let clear_color =
    foreign "rlClearColor"
      (uchar @-> uchar @-> uchar @-> uchar @-> returning void)

  (* Clear used screen buffers (color and depth)*)
  let clear_screen_buffers =
    foreign "rlClearScreenBuffers" (void @-> returning void)

  (* Check and log OpenGL error codes*)
  let check_errors = foreign "rlCheckErrors" (void @-> returning void)

  (* Set blending mode*)
  let set_blend_mode = foreign "rlSetBlendMode" (BlendMode.t @-> returning void)

  (* Set blending mode factor and equation (using OpenGL factors)*)
  let set_blend_factors =
    foreign "rlSetBlendFactors"
      (BlendFactor.t @-> BlendFactor.t @-> BlendFunction.t @-> returning void)

  let set_blend_factors_separate =
    foreign "rlSetBlendFactorsSeparate"
      (BlendFactor.t @-> BlendFactor.t @-> BlendFactor.t @-> BlendFactor.t
     @-> BlendFunction.t @-> BlendFunction.t @-> returning void)

  (*------------------------------------------------------------------------------------*)
  (* Functions Declaration - rlgl functionality*)
  (*------------------------------------------------------------------------------------*)
  (* rlgl initialization functions*)
  (* Initialize rlgl (buffers, shaders, textures, states)*)
  let rlgl_init = foreign "rlglInit" (int @-> int @-> returning void)

  (* De-inititialize rlgl (buffers, shaders, textures)*)
  let rlgl_close = foreign "rlglClose" (void @-> returning void)

  (* Load OpenGL extensions (loader function required)*)
  let load_extensions = foreign "rlLoadExtensions" (ptr void @-> returning void)

  (* Get current OpenGL version*)
  let get_version = foreign "rlGetVersion" (void @-> returning RlGlVersion.t)

  let set_framebuffer_width =
    foreign "rlSetFramebufferWidth" (int @-> returning void)

  (* Get default framebuffer width*)
  let get_framebuffer_width =
    foreign "rlGetFramebufferWidth" (void @-> returning int)

  let set_framebuffer_height =
    foreign "rlSetFramebufferHeight" (int @-> returning void)

  (* Get default framebuffer height*)
  let get_framebuffer_height =
    foreign "rlGetFramebufferHeight" (void @-> returning int)

  (* Get default texture id*)
  let get_texture_id_default =
    foreign "rlGetTextureIdDefault" (void @-> returning TextureId.t)

  (* Get default shader id*)
  let get_shader_id_default =
    foreign "rlGetShaderIdDefault" (void @-> returning ShaderProgramId.t)

  (* Get default shader locations*)
  let get_shader_locs_default =
    foreign "rlGetShaderLocsDefault" (void @-> returning (ptr ShaderLoc.t))

  (* Render batch management*)
  (* NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode*)
  (* but this render batch API is exposed in case of custom batches are required*)
  (* Load a render batch system*)
  let load_render_batch =
    foreign "rlLoadRenderBatch" (int @-> int @-> returning RenderBatch.t)

  (* Unload render batch system*)
  let unload_render_batch =
    foreign "rlUnloadRenderBatch" (RenderBatch.t @-> returning void)

  (* Draw render batch data (Update->Draw->Reset)*)
  let draw_render_batch =
    foreign "rlDrawRenderBatch" (ptr RenderBatch.t @-> returning void)

  (* Set the active render batch for rlgl (NULL for default internal)*)
  let set_render_batch_active =
    foreign "rlSetRenderBatchActive" (ptr RenderBatch.t @-> returning void)

  (* Update and draw internal render batch*)
  let draw_render_batch_active =
    foreign "rlDrawRenderBatchActive" (void @-> returning void)

  (* Check internal buffer overflow for a given number of vertex*)
  let check_render_batch_limit =
    foreign "rlCheckRenderBatchLimit" (int @-> returning bool)

  (* Set current texture for render batch and check buffers limits*)
  let set_texture = foreign "rlSetTexture" (TextureId.t @-> returning void)

  (*------------------------------------------------------------------------------------------------------------------------*)

  (* Vertex buffers management*)
  (* Load vertex array (vao) if supported*)
  let load_vertex_array =
    foreign "rlLoadVertexArray" (void @-> returning VaoId.t)

  (* Load a vertex buffer attribute*)
  let load_vertex_buffer =
    foreign "rlLoadVertexBuffer"
      (ptr void @-> int @-> bool @-> returning VboId.t)

  (* Load a new attributes element buffer*)
  let load_vertex_buffer_element =
    foreign "rlLoadVertexBufferElement"
      (ptr void @-> int @-> bool @-> returning VboId.t)

  (* Update GPU buffer with new data*)
  let update_vertex_buffer =
    foreign "rlUpdateVertexBuffer"
      (VboId.t @-> ptr void @-> int @-> int @-> returning void)

  let update_vertex_buffer_elements =
    foreign "rlUpdateVertexBufferElements"
      (VboId.t @-> ptr void @-> int @-> int @-> returning void)

  let unload_vertex_array =
    foreign "rlUnloadVertexArray" (VaoId.t @-> returning void)

  let unload_vertex_buffer =
    foreign "rlUnloadVertexBuffer" (VboId.t @-> returning void)

  let set_vertex_attribute =
    foreign "rlSetVertexAttribute"
      (uint @-> int @-> GlDataType.t @-> bool @-> int @-> int @-> returning void)

  let set_vertex_attribute_divisor =
    foreign "rlSetVertexAttributeDivisor" (uint @-> int @-> returning void)

  (* Set vertex attribute default value*)
  let set_vertex_attribute_default =
    foreign "rlSetVertexAttributeDefault"
      (int @-> ptr void @-> ShaderAttributeDataType.t @-> int @-> returning void)

  let draw_vertex_array =
    foreign "rlDrawVertexArray" (int @-> int @-> returning void)

  let draw_vertex_array_elements =
    foreign "rlDrawVertexArrayElements"
      (int @-> int @-> ptr void @-> returning void)

  let draw_vertex_array_instanced =
    foreign "rlDrawVertexArrayInstanced" (int @-> int @-> int @-> returning void)

  let draw_vertex_array_elements_instanced =
    foreign "rlDrawVertexArrayElementsInstanced"
      (int @-> int @-> ptr void @-> int @-> returning void)

  (* Textures management*)
  (* Load texture in GPU*)
  let load_texture =
    foreign "rlLoadTexture"
      (ptr void @-> int @-> int @-> PixelFormat.t @-> int
     @-> returning TextureId.t)

  (* Load depth texture/renderbuffer (to be attached to fbo)*)
  let load_texture_depth =
    foreign "rlLoadTextureDepth" (int @-> int @-> bool @-> returning TextureId.t)

  (* Load texture cubemap*)
  let load_texture_cubemap =
    foreign "rlLoadTextureCubemap"
      (ptr void @-> int @-> PixelFormat.t @-> int @-> returning TextureId.t)

  (* Update GPU texture with new data*)
  let update_texture =
    foreign "rlUpdateTexture"
      (TextureId.t @-> int @-> int @-> int @-> int @-> PixelFormat.t
     @-> ptr void @-> returning void)

  (* Get OpenGL internal formats*)
  let get_gl_texture_formats =
    foreign "rlGetGlTextureFormats"
      (PixelFormat.t @-> ptr uint @-> ptr uint @-> ptr uint @-> returning void)

  (* Get name string for pixel format*)
  let get_pixel_format_name =
    foreign "rlGetPixelFormatName" (PixelFormat.t @-> returning string)

  (* Unload texture from GPU memory*)
  let unload_texture = foreign "rlUnloadTexture" (TextureId.t @-> returning void)

  (* Generate mipmap data for selected texture*)
  let gen_texture_mipmaps =
    foreign "rlGenTextureMipmaps"
      (TextureId.t @-> int @-> int @-> PixelFormat.t @-> ptr int
     @-> returning void)

  (* Read texture pixel data*)
  let read_texture_pixels =
    foreign "rlReadTexturePixels"
      (TextureId.t @-> int @-> int @-> PixelFormat.t @-> returning (ptr void))

  (* Read screen pixel data (color buffer)*)
  let read_screen_pixels =
    foreign "rlReadScreenPixels" (int @-> int @-> returning (ptr uchar))

  (* Framebuffer management (fbo)*)
  (* Load an empty framebuffer*)
  let load_framebuffer =
    foreign "rlLoadFramebuffer" (void @-> returning FramebufferId.t)

  (* Attach texture/renderbuffer to a framebuffer*)
  let framebuffer_attach =
    foreign "rlFramebufferAttach"
      (FramebufferId.t @-> TextureId.t @-> FramebufferAttachType.t
     @-> FramebufferAttachTextureType.t @-> int @-> returning void)

  (* Verify framebuffer is complete*)
  let framebuffer_complete =
    foreign "rlFramebufferComplete" (FramebufferId.t @-> returning bool)

  (* Delete framebuffer from GPU*)
  let unload_framebuffer =
    foreign "rlUnloadFramebuffer" (FramebufferId.t @-> returning void)

  let copy_framebuffer =
    foreign "rlCopyFramebuffer"
      (int @-> int @-> int @-> int @-> PixelFormat.t @-> ptr void
     @-> returning void)

  let resize_framebuffer =
    foreign "rlResizeFramebuffer" (int @-> int @-> returning void)

  (* Shaders management*)
  (* Load shader from code strings*)
  let load_shader_program =
    foreign "rlLoadShaderProgram"
      (string @-> string @-> returning ShaderProgramId.t)

  (* Compile custom shader and return shader id (type: GL_VERTEX_SHADER, GL_FRAGMENT_SHADER)*)
  let load_shader =
    foreign "rlLoadShader" (string @-> Shader.t @-> returning ShaderId.t)

  (* Load custom shader program*)
  let load_shader_program_ex =
    foreign "rlLoadShaderProgramEx"
      (ShaderId.t @-> ShaderId.t @-> returning ShaderProgramId.t)

  let load_shader_program_compute =
    foreign "rlLoadShaderProgramCompute"
      (ShaderId.t @-> returning ShaderProgramId.t)

  (* Unload shader, loaded with rlLoadShader() *)
  let unload_shader = foreign "rlUnloadShader" (ShaderId.t @-> returning void)

  (* Unload shader program*)
  let unload_shader_program =
    foreign "rlUnloadShaderProgram" (ShaderProgramId.t @-> returning void)

  (* Get shader location uniform*)
  let get_location_uniform =
    foreign "rlGetLocationUniform"
      (ShaderProgramId.t @-> string @-> returning ShaderLoc.t)

  (* Get shader location attribute*)
  let get_location_attrib =
    foreign "rlGetLocationAttrib"
      (ShaderProgramId.t @-> string @-> returning ShaderLoc.t)

  (* Set shader value uniform*)
  let set_uniform =
    foreign "rlSetUniform"
      (ShaderLoc.t @-> ptr void @-> ShaderUniformDataType.t @-> int
     @-> returning void)

  (* Set shader value matrix*)
  let set_uniform_matrix =
    foreign "rlSetUniformMatrix" (ShaderLoc.t @-> Matrix.t @-> returning void)

  let set_uniform_matrices =
    foreign "rlSetUniformMatrices"
      (ShaderLoc.t @-> ptr Matrix.t @-> int @-> returning void)

  (* Set shader value sampler*)
  let set_uniform_sampler =
    foreign "rlSetUniformSampler"
      (ShaderLoc.t @-> TextureId.t @-> returning void)

  (* Set shader currently active (id and locations)*)
  let set_shader =
    foreign "rlSetShader"
      (ShaderProgramId.t @-> ptr ShaderLoc.t @-> returning void)

  (* Compute shader management *)
  let compute_shader_dispatch =
    foreign "rlComputeShaderDispatch" (uint @-> uint @-> uint @-> returning void)

  (* Shader buffer storage object management (ssbo) *)
  (* Load shader storage buffer object (SSBO) *)
  let load_shader_buffer =
    foreign "rlLoadShaderBuffer"
      (uint @-> ptr void @-> BufferUsage.t @-> returning SsboId.t)

  (* Unload shader storage buffer object (SSBO) *)
  let unload_shader_buffer =
    foreign "rlUnloadShaderBuffer" (SsboId.t @-> returning void)

  (* Update SSBO buffer data *)
  let update_shader_buffer =
    foreign "rlUpdateShaderBuffer"
      (SsboId.t @-> ptr void @-> uint @-> uint @-> returning void)

  (* Bind SSBO buffer *)
  let bind_shader_buffer =
    foreign "rlBindShaderBuffer" (SsboId.t @-> uint @-> returning void)

  (* Read SSBO buffer data (GPU->CPU) *)
  let read_shader_buffer =
    foreign "rlReadShaderBuffer"
      (SsboId.t @-> ptr void @-> uint @-> uint @-> returning void)

  (* Copy SSBO data between buffers *)
  let copy_shader_buffer =
    foreign "rlCopyShaderBuffer"
      (SsboId.t @-> SsboId.t @-> uint @-> uint @-> uint @-> returning void)

  (* Get SSBO buffer size *)
  let get_shader_buffer_size =
    foreign "rlGetShaderBufferSize" (SsboId.t @-> returning int)

  let bind_image_texture =
    foreign "rlBindImageTexture"
      (TextureId.t @-> uint @-> PixelFormat.t @-> bool @-> returning void)

  (* Matrix state management*)
  (* Get internal modelview matrix*)
  let get_matrix_modelview =
    foreign "rlGetMatrixModelview" (void @-> returning Matrix.t)

  (* Get internal projection matrix*)
  let get_matrix_projection =
    foreign "rlGetMatrixProjection" (void @-> returning Matrix.t)

  (* Get internal accumulated transform matrix*)
  let get_matrix_transform =
    foreign "rlGetMatrixTransform" (void @-> returning Matrix.t)

  (* Get internal projection matrix for stereo render (selected eye)*)
  let get_matrix_projection_stereo =
    foreign "rlGetMatrixProjectionStereo" (int @-> returning Matrix.t)

  (* Get internal view offset matrix for stereo render (selected eye)*)
  let get_matrix_view_offset_stereo =
    foreign "rlGetMatrixViewOffsetStereo" (int @-> returning Matrix.t)

  (* Set a custom projection matrix (replaces internal projection matrix)*)
  let set_matrix_projection =
    foreign "rlSetMatrixProjection" (Matrix.t @-> returning void)

  (* Set a custom modelview matrix (replaces internal modelview matrix)*)
  let set_matrix_modelview =
    foreign "rlSetMatrixModelview" (Matrix.t @-> returning void)

  (* Set eyes projection matrices for stereo rendering*)
  let set_matrix_projection_stereo =
    foreign "rlSetMatrixProjectionStereo"
      (Matrix.t @-> Matrix.t @-> returning void)

  (* Set eyes view offsets matrices for stereo rendering*)
  let set_matrix_view_offset_stereo =
    foreign "rlSetMatrixViewOffsetStereo"
      (Matrix.t @-> Matrix.t @-> returning void)

  (* Quick and dirty cube/quad buffers load->draw->unload*)
  (* Load and draw a cube*)
  let load_draw_cube = foreign "rlLoadDrawCube" (void @-> returning void)

  (* Load and draw a quad*)
  let load_draw_quad = foreign "rlLoadDrawQuad" (void @-> returning void)
end
