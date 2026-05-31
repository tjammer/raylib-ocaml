include Raylib_c_models.Raylib_models_generated.Functions
open Ctypes
open Raylib_core

let load_model_animations path =
  let count = ptr_of_int 0 in
  let anims = _load_model_animations path count in
  CArray.from_ptr anims !@count

let unload_model_animations model_animations =
  let count = CArray.length model_animations in
  _unload_model_animations (CArray.start model_animations) count
