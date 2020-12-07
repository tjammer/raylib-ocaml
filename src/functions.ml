include Ctypes_reexports
open Ctypes
include Raylib_functions.Description (Raylib_c.Raylib_c_generated_functions)

(* CArray wrapped functions *)
let load_file_data path =
  let count = ptr_of_uint (Unsigned.UInt.of_int 0) in
  let data = _load_file_data path count in
  CArray.from_ptr data (Unsigned.UInt.to_int !@count)

let save_file_data path data =
  let count = CArray.length data in
  _save_file_data path (to_voidp (CArray.start data)) count

let get_directory_files path =
  let count = ptr_of_int 0 in
  let files = _get_directory_files path count in
  CArray.from_ptr files !@count

let get_dropped_files () =
  let count = ptr_of_int 0 in
  let files = _get_dropped_files count in
  CArray.from_ptr files !@count

let compress_data in_data =
  let in_count = CArray.length in_data in
  let out_count = ptr_of_int 0 in
  let out_data = _compress_data (CArray.start in_data) in_count out_count in
  CArray.from_ptr out_data !@out_count

let decompress_data in_data =
  let in_count = CArray.length in_data in
  let out_count = ptr_of_int 0 in
  let out_data = _decompress_data (CArray.start in_data) in_count out_count in
  CArray.from_ptr out_data !@out_count

let load_model_animations path =
  let count = ptr_of_int 0 in
  let anims = _load_model_animations path count in
  CArray.from_ptr anims !@count
