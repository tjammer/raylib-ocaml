include Ctypes_reexports
include Raylib_types
open Ctypes_reexports
open Ctypes
include Raylib_c.Raylib_generated.Functions

(* CArray or string wrapped functions *)
let load_file_data path =
  let count = ptr_of_int 0 in
  let data = _load_file_data path count in
  let s = string_from_ptr data ~length:!@count in
  _unload_file_data data;
  s

let save_file_data path data =
  let count = CArray.length data in
  _save_file_data path (to_voidp (CArray.start data)) count

let export_data_as_code data filename =
  _export_data_as_code data (String.length data) filename

let _strlen ptr =
  let i = ref 0 in
  while !@(ptr +@ !i) <> '\000' do
    incr i
  done;
  !i

let load_file_text path =
  let text = _load_file_text path in
  let count = _strlen text in
  let s = string_from_ptr text ~length:count in
  _unload_file_text text;
  s

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

let get_char_pressed () = _get_char_pressed () |> Uchar.of_int
