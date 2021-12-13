module Types = Raylib_generated_types
module Constants = Raylib_generated_constants

module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  open Raylib_generated_types
  open Raylib_generated_types__.Rlgl_generated_types

(*------------------------------------------------------------------------------------*)
(* Functions Declaration - Matrix operations*)
(*------------------------------------------------------------------------------------*)
(* Choose the current matrix to be transformed*)
let rl_matrix_mode = foreign "rlMatrixMode" (int @-> returning void)

(* Push the current matrix to stack*)
let rl_push_matrix = foreign "rlPushMatrix" (void @-> returning void)

(* Pop lattest inserted matrix from stack*)
let rl_pop_matrix = foreign "rlPopMatrix" (void @-> returning void)

(* Reset current matrix to identity matrix*)
let rl_load_identity = foreign "rlLoadIdentity" (void @-> returning void)

(* Multiply the current matrix by a translation matrix*)
let rl_translatef = foreign "rlTranslatef" (float @-> float @-> float @-> returning void)

(* Multiply the current matrix by a rotation matrix*)
let rl_rotatef = foreign "rlRotatef" (float @-> float @-> float @-> float @-> returning void)

(* Multiply the current matrix by a scaling matrix*)
let rl_scalef = foreign "rlScalef" (float @-> float @-> float @-> returning void)

(* Multiply the current matrix by another matrix*)
let rl_mult_matrixf = foreign "rlMultMatrixf" (ptr float @-> returning void)

let rl_frustum = foreign "rlFrustum" (double @-> double @-> double @-> double @-> double @-> double @-> returning void)
let rl_ortho = foreign "rlOrtho" (double @-> double @-> double @-> double @-> double @-> double @-> returning void)
(* Set the viewport area*)
let rl_viewport = foreign "rlViewport" (int @-> int @-> int @-> int @-> returning void)


(*------------------------------------------------------------------------------------*)
(* Functions Declaration - Vertex level operations*)
(*------------------------------------------------------------------------------------*)
(* Initialize drawing mode (how to organize vertex)*)
let rl_begin = foreign "rlBegin" (int @-> returning void)

(* Finish vertex providing*)
let rl_end = foreign "rlEnd" (void @-> returning void)

(* Define one vertex (position) - 2 int*)
let rl_vertex2i = foreign "rlVertex2i" (int @-> int @-> returning void)

(* Define one vertex (position) - 2 float*)
let rl_vertex2f = foreign "rlVertex2f" (float @-> float @-> returning void)

(* Define one vertex (position) - 3 float*)
let rl_vertex3f = foreign "rlVertex3f" (float @-> float @-> float @-> returning void)

(* Define one vertex (texture coordinate) - 2 float*)
let rl_tex_coord2f = foreign "rlTexCoord2f" (float @-> float @-> returning void)

(* Define one vertex (normal) - 3 float*)
let rl_normal3f = foreign "rlNormal3f" (float @-> float @-> float @-> returning void)

(* Define one vertex (color) - 4 byte*)
let rl_color4ub = foreign "rlColor4ub" (uchar @-> uchar @-> uchar @-> uchar @-> returning void)

(* Define one vertex (color) - 3 float*)
let rl_color3f = foreign "rlColor3f" (float @-> float @-> float @-> returning void)

(* Define one vertex (color) - 4 float*)
let rl_color4f = foreign "rlColor4f" (float @-> float @-> float @-> float @-> returning void)


(*------------------------------------------------------------------------------------*)
(* Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)*)
(* NOTE: This functions are used to completely abstract raylib code from OpenGL layer,*)
(* some of them are direct wrappers over OpenGL calls, some others are custom*)
(*------------------------------------------------------------------------------------*)

(* Vertex buffers state*)
(* Enable vertex array (VAO, if supported)*)
let rl_enable_vertex_array = foreign "rlEnableVertexArray" (uint @-> returning bool)

(* Disable vertex array (VAO, if supported)*)
let rl_disable_vertex_array = foreign "rlDisableVertexArray" (void @-> returning void)

(* Enable vertex buffer (VBO)*)
let rl_enable_vertex_buffer = foreign "rlEnableVertexBuffer" (uint @-> returning void)

(* Disable vertex buffer (VBO)*)
let rl_disable_vertex_buffer = foreign "rlDisableVertexBuffer" (void @-> returning void)

(* Enable vertex buffer element (VBO element)*)
let rl_enable_vertex_buffer_element = foreign "rlEnableVertexBufferElement" (uint @-> returning void)

(* Disable vertex buffer element (VBO element)*)
let rl_disable_vertex_buffer_element = foreign "rlDisableVertexBufferElement" (void @-> returning void)

(* Enable vertex attribute index*)
let rl_enable_vertex_attribute = foreign "rlEnableVertexAttribute" (uint @-> returning void)

(* Disable vertex attribute index*)
let rl_disable_vertex_attribute = foreign "rlDisableVertexAttribute" (uint @-> returning void)

(* TODO handle opengl 11 correctly *)
(*#if defined(GRAPHICS_API_OPENGL_11)
let rl_enable_state_pointer = foreign "rlEnableStatePointer" (int @-> ptr void @-> returning void)
let rl_disable_state_pointer = foreign "rlDisableStatePointer" (int @-> returning void)
#endif*)

(* Textures state*)
(* Select and active a texture slot*)
let rl_active_texture_slot = foreign "rlActiveTextureSlot" (int @-> returning void)

(* Enable texture*)
let rl_enable_texture = foreign "rlEnableTexture" (uint @-> returning void)

(* Disable texture*)
let rl_disable_texture = foreign "rlDisableTexture" (void @-> returning void)

(* Enable texture cubemap*)
let rl_enable_texture_cubemap = foreign "rlEnableTextureCubemap" (uint @-> returning void)

(* Disable texture cubemap*)
let rl_disable_texture_cubemap = foreign "rlDisableTextureCubemap" (void @-> returning void)

(* Set texture parameters (filter, wrap)*)
let rl_texture_parameters = foreign "rlTextureParameters" (uint @-> int @-> int @-> returning void)


(* Shader state*)
(* Enable shader program*)
let rl_enable_shader = foreign "rlEnableShader" (uint @-> returning void)

(* Disable shader program*)
let rl_disable_shader = foreign "rlDisableShader" (void @-> returning void)


(* Framebuffer state*)
(* Enable render texture (fbo)*)
let rl_enable_framebuffer = foreign "rlEnableFramebuffer" (uint @-> returning void)

(* Disable render texture (fbo), return to default framebuffer*)
let rl_disable_framebuffer = foreign "rlDisableFramebuffer" (void @-> returning void)


(* General render state*)
(* Enable depth test*)
let rl_enable_depth_test = foreign "rlEnableDepthTest" (void @-> returning void)

(* Disable depth test*)
let rl_disable_depth_test = foreign "rlDisableDepthTest" (void @-> returning void)

(* Enable depth write*)
let rl_enable_depth_mask = foreign "rlEnableDepthMask" (void @-> returning void)

(* Disable depth write*)
let rl_disable_depth_mask = foreign "rlDisableDepthMask" (void @-> returning void)

(* Enable backface culling*)
let rl_enable_backface_culling = foreign "rlEnableBackfaceCulling" (void @-> returning void)

(* Disable backface culling*)
let rl_disable_backface_culling = foreign "rlDisableBackfaceCulling" (void @-> returning void)

(* Enable scissor test*)
let rl_enable_scissor_test = foreign "rlEnableScissorTest" (void @-> returning void)

(* Disable scissor test*)
let rl_disable_scissor_test = foreign "rlDisableScissorTest" (void @-> returning void)

(* Scissor test*)
let rl_scissor = foreign "rlScissor" (int @-> int @-> int @-> int @-> returning void)

(* Enable wire mode*)
let rl_enable_wire_mode = foreign "rlEnableWireMode" (void @-> returning void)

(* Disable wire mode*)
let rl_disable_wire_mode = foreign "rlDisableWireMode" (void @-> returning void)

(* Set the line drawing width*)
let rl_set_line_width = foreign "rlSetLineWidth" (float @-> returning void)

(* Get the line drawing width*)
let rl_get_line_width = foreign "rlGetLineWidth" (void @-> returning float)

(* Enable line aliasing*)
let rl_enable_smooth_lines = foreign "rlEnableSmoothLines" (void @-> returning void)

(* Disable line aliasing*)
let rl_disable_smooth_lines = foreign "rlDisableSmoothLines" (void @-> returning void)

(* Enable stereo rendering*)
let rl_enable_stereo_render = foreign "rlEnableStereoRender" (void @-> returning void)

(* Disable stereo rendering*)
let rl_disable_stereo_render = foreign "rlDisableStereoRender" (void @-> returning void)

(* Check if stereo render is enabled*)
let rl_is_stereo_render_enabled = foreign "rlIsStereoRenderEnabled" (void @-> returning bool)


(* Clear color buffer with color*)
let rl_clear_color = foreign "rlClearColor" (uchar @-> uchar @-> uchar @-> uchar @-> returning void)

(* Clear used screen buffers (color and depth)*)
let rl_clear_screen_buffers = foreign "rlClearScreenBuffers" (void @-> returning void)

(* Check and log OpenGL error codes*)
let rl_check_errors = foreign "rlCheckErrors" (void @-> returning void)

(* Set blending mode*)
let rl_set_blend_mode = foreign "rlSetBlendMode" (int @-> returning void)

(* Set blending mode factor and equation (using OpenGL factors)*)
let rl_set_blend_factors = foreign "rlSetBlendFactors" (int @-> int @-> int @-> returning void)


(*------------------------------------------------------------------------------------*)
(* Functions Declaration - rlgl functionality*)
(*------------------------------------------------------------------------------------*)
(* rlgl initialization functions*)
(* Initialize rlgl (buffers, shaders, textures, states)*)
let rlgl_init = foreign "rlglInit" (int @-> int @-> returning void)

(* De-inititialize rlgl (buffers, shaders, textures)*)
let rlgl_close = foreign "rlglClose" (void @-> returning void)

(* Load OpenGL extensions (loader function required)*)
let rl_load_extensions = foreign "rlLoadExtensions" (ptr void @-> returning void)

(* Get current OpenGL version*)
let rl_get_version = foreign "rlGetVersion" (void @-> returning int)

(* Get default framebuffer width*)
let rl_get_framebuffer_width = foreign "rlGetFramebufferWidth" (void @-> returning int)

(* Get default framebuffer height*)
let rl_get_framebuffer_height = foreign "rlGetFramebufferHeight" (void @-> returning int)


(* Get default texture id*)
let rl_get_texture_id_default = foreign "rlGetTextureIdDefault" (void @-> returning uint)

(* Get default shader id*)
let rl_get_shader_id_default = foreign "rlGetShaderIdDefault" (void @-> returning uint)

(* TODO uncommenting this results in a linker error but I cant find the spelling or type error? *)
(* Get default shader locations*)
(* let rl_get_shader_locs_default = foreign "rlGetShaderLocsDefault " (void @-> returning (ptr int)) *)


(* Render batch management*)
(* NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode*)
(* but this render batch API is exposed in case of custom batches are required*)
(* Load a render batch system*)
let rl_load_render_batch = foreign "rlLoadRenderBatch" (int @-> int @-> returning RlRenderBatch.t)

(* Unload render batch system*)
let rl_unload_render_batch = foreign "rlUnloadRenderBatch" (RlRenderBatch.t @-> returning void)

(* Draw render batch data (Update->Draw->Reset)*)
let rl_draw_render_batch = foreign "rlDrawRenderBatch" (ptr RlRenderBatch.t @-> returning void)

(* Set the active render batch for rlgl (NULL for default internal)*)
let rl_set_render_batch_active = foreign "rlSetRenderBatchActive" (ptr RlRenderBatch.t @-> returning void)

(* Update and draw internal render batch*)
let rl_draw_render_batch_active = foreign "rlDrawRenderBatchActive" (void @-> returning void)

(* Check internal buffer overflow for a given number of vertex*)
let rl_check_render_batch_limit = foreign "rlCheckRenderBatchLimit" (int @-> returning bool)

(* Set current texture for render batch and check buffers limits*)
let rl_set_texture = foreign "rlSetTexture" (uint @-> returning void)


(*------------------------------------------------------------------------------------------------------------------------*)

(* Vertex buffers management*)
(* Load vertex array (vao) if supported*)
let rl_load_vertex_array = foreign "rlLoadVertexArray" (void @-> returning uint)

(* Load a vertex buffer attribute*)
let rl_load_vertex_buffer = foreign "rlLoadVertexBuffer" (ptr void @-> int @-> bool @-> returning uint)

(* Load a new attributes element buffer*)
let rl_load_vertex_buffer_element = foreign "rlLoadVertexBufferElement" (ptr void @-> int @-> bool @-> returning uint)

(* Update GPU buffer with new data*)
let rl_update_vertex_buffer = foreign "rlUpdateVertexBuffer" (int @-> ptr void @-> int @-> int @-> returning void)

let rl_unload_vertex_array = foreign "rlUnloadVertexArray" (uint @-> returning void)
let rl_unload_vertex_buffer = foreign "rlUnloadVertexBuffer" (uint @-> returning void)
let rl_set_vertex_attribute = foreign "rlSetVertexAttribute" (uint @-> int @-> int @-> bool @-> int @-> ptr void @-> returning void)
let rl_set_vertex_attribute_divisor = foreign "rlSetVertexAttributeDivisor" (uint @-> int @-> returning void)
(* Set vertex attribute default value*)
let rl_set_vertex_attribute_default = foreign "rlSetVertexAttributeDefault" (int @-> ptr void @-> int @-> int @-> returning void)

let rl_draw_vertex_array = foreign "rlDrawVertexArray" (int @-> int @-> returning void)
let rl_draw_vertex_array_elements = foreign "rlDrawVertexArrayElements" (int @-> int @-> ptr void @-> returning void)
let rl_draw_vertex_array_instanced = foreign "rlDrawVertexArrayInstanced" (int @-> int @-> int @-> returning void)
let rl_draw_vertex_array_elements_instanced = foreign "rlDrawVertexArrayElementsInstanced" (int @-> int @-> ptr void @-> int @-> returning void)

(* Textures management*)
(* Load texture in GPU*)
let rl_load_texture = foreign "rlLoadTexture" (ptr void @-> int @-> int @-> int @-> int @-> returning uint)

(* Load depth texture/renderbuffer (to be attached to fbo)*)
let rl_load_texture_depth = foreign "rlLoadTextureDepth" (int @-> int @-> bool @-> returning uint)

(* Load texture cubemap*)
let rl_load_texture_cubemap = foreign "rlLoadTextureCubemap" (ptr void @-> int @-> int @-> returning uint)

(* Update GPU texture with new data*)
let rl_update_texture = foreign "rlUpdateTexture" (uint @-> int @-> int @-> int @-> int @-> int @-> ptr void @-> returning void)

(* Get OpenGL internal formats*)
let rl_get_gl_texture_formats = foreign "rlGetGlTextureFormats" (int @-> ptr uint @-> ptr uint @-> ptr uint @-> returning void)

(* Get name string for pixel format*)
let rl_get_pixel_format_name = foreign "rlGetPixelFormatName" (uint @-> returning (string))

(* Unload texture from GPU memory*)
let rl_unload_texture = foreign "rlUnloadTexture" (uint @-> returning void)

(* Generate mipmap data for selected texture*)
let rl_gen_texture_mipmaps = foreign "rlGenTextureMipmaps" (uint @-> int @-> int @-> int @-> ptr int @-> returning void)

(* Read texture pixel data*)
let rl_read_texture_pixels = foreign "rlReadTexturePixels" (uint @-> int @-> int @-> int @-> returning (ptr void))

(* Read screen pixel data (color buffer)*)
let rl_read_screen_pixels = foreign "rlReadScreenPixels" (int @-> int @-> returning (ptr uchar))


(* Framebuffer management (fbo)*)
(* Load an empty framebuffer*)
let rl_load_framebuffer = foreign "rlLoadFramebuffer" (int @-> int @-> returning uint)

(* Attach texture/renderbuffer to a framebuffer*)
let rl_framebuffer_attach = foreign "rlFramebufferAttach" (uint @-> uint @-> int @-> int @-> int @-> returning void)

(* Verify framebuffer is complete*)
let rl_framebuffer_complete = foreign "rlFramebufferComplete" (uint @-> returning bool)

(* Delete framebuffer from GPU*)
let rl_unload_framebuffer = foreign "rlUnloadFramebuffer" (uint @-> returning void)


(* Shaders management*)
(* Load shader from code strings*)
let rl_load_shader_code = foreign "rlLoadShaderCode" (string @-> string @-> returning uint)

(* Compile custom shader and return shader id (type: GL_VERTEX_SHADER, GL_FRAGMENT_SHADER)*)
let rl_compile_shader = foreign "rlCompileShader" (string @-> int @-> returning uint)

(* Load custom shader program*)
let rl_load_shader_program = foreign "rlLoadShaderProgram" (uint @-> uint @-> returning uint)

(* Unload shader program*)
let rl_unload_shader_program = foreign "rlUnloadShaderProgram" (uint @-> returning void)

(* Get shader location uniform*)
let rl_get_location_uniform = foreign "rlGetLocationUniform" (uint @-> string @-> returning int)

(* Get shader location attribute*)
let rl_get_location_attrib = foreign "rlGetLocationAttrib" (uint @-> string @-> returning int)

(* Set shader value uniform*)
let rl_set_uniform = foreign "rlSetUniform" (int @-> ptr void @-> int @-> int @-> returning void)

(* Set shader value matrix*)
let rl_set_uniform_matrix = foreign "rlSetUniformMatrix" (int @-> Matrix.t @-> returning void)

(* Set shader value sampler*)
let rl_set_uniform_sampler = foreign "rlSetUniformSampler" (int @-> uint @-> returning void)

(* Set shader currently active (id and locations)*)
let rl_set_shader = foreign "rlSetShader" (uint @-> ptr int @-> returning void)


(* Matrix state management*)
(* Get internal modelview matrix*)
let rl_get_matrix_modelview = foreign "rlGetMatrixModelview" (void @-> returning Matrix.t)

(* Get internal projection matrix*)
let rl_get_matrix_projection = foreign "rlGetMatrixProjection" (void @-> returning Matrix.t)

(* Get internal accumulated transform matrix*)
let rl_get_matrix_transform = foreign "rlGetMatrixTransform" (void @-> returning Matrix.t)

(* Get internal projection matrix for stereo render (selected eye)*)
let rl_get_matrix_projection_stereo = foreign "rlGetMatrixProjectionStereo" (int @-> returning Matrix.t)

(* Get internal view offset matrix for stereo render (selected eye)*)
let rl_get_matrix_view_offset_stereo = foreign "rlGetMatrixViewOffsetStereo" (int @-> returning Matrix.t)

(* Set a custom projection matrix (replaces internal projection matrix)*)
let rl_set_matrix_projection = foreign "rlSetMatrixProjection" (Matrix.t @-> returning void)

(* Set a custom modelview matrix (replaces internal modelview matrix)*)
let rl_set_matrix_modelview = foreign "rlSetMatrixModelview" (Matrix.t @-> returning void)

(* Set eyes projection matrices for stereo rendering*)
let rl_set_matrix_projection_stereo = foreign "rlSetMatrixProjectionStereo" (Matrix.t @-> Matrix.t @-> returning void)

(* Set eyes view offsets matrices for stereo rendering*)
let rl_set_matrix_view_offset_stereo = foreign "rlSetMatrixViewOffsetStereo" (Matrix.t @-> Matrix.t @-> returning void)


(* Quick and dirty cube/quad buffers load->draw->unload*)
(* Load and draw a cube*)
let rl_load_draw_cube = foreign "rlLoadDrawCube" (void @-> returning void)

(* Load and draw a quad*)
let rl_load_draw_quad = foreign "rlLoadDrawQuad" (void @-> returning void)


end
