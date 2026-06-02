include Rlgl_c.Rlgl_types_generated
include Rlgl_c.Rlgl_generated.Functions
open Raylib_core
open Ctypes

module VertexBuffer = struct
  type t' = VertexBuffer.t
  type t = t' ctyp

  let t = VertexBuffer.t
  let element_count vb = getf vb VertexBuffer.element_count
  let vertices vb = getf vb VertexBuffer.vertices
  let texcoords vb = getf vb VertexBuffer.texcoords
  let colors vb = getf vb VertexBuffer.colors
  let indices vb = getf vb VertexBuffer.indices
  let vao_id vb = getf vb VertexBuffer.vao_id
end

module DrawCall = struct
  type t' = DrawCall.t
  type t = t' ctyp

  let t = DrawCall.t
  let mode dc = getf dc DrawCall.mode
  let vertex_count dc = getf dc DrawCall.vertex_count
  let vertex_alignment dc = getf dc DrawCall.vertex_alignment
  let texture_id dc = getf dc DrawCall.texture_id
end

module RenderBatch = struct
  type t' = RenderBatch.t
  type t = t' ctyp

  let t = RenderBatch.t
  let buffer_count rb = getf rb RenderBatch.buffer_count
  let current_buffer rb = getf rb RenderBatch.current_buffer
  let vertex_buffer rb = getf rb RenderBatch.vertex_buffer
  let draws rb = getf rb RenderBatch.draws
  let draw_counter rb = getf rb RenderBatch.draw_counter
  let current_depth rb = getf rb RenderBatch.current_depth
end
