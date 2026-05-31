module Types = Rlgl_c.Types
open Raylib_core

module RlVertexBuffer = struct
  type t' = Types.RlVertexBuffer.t
  type t = t' ctyp
end

module RlDrawCall = struct
  type t' = Types.RlDrawCall.t
  type t = t' ctyp
end

module RlRenderBatch = struct
  type t' = Types.RlRenderBatch.t
  type t = t' ctyp
end
