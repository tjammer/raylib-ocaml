open Ctypes_reexports
open Ctypes
include Raylib_c.Functions

(* CArray wrapped functions *)
let load_file_data path =
  let count = ptr_of_uint (Unsigned.UInt.of_int 0) in
  let data = _load_file_data path count in
  CArray.from_ptr data (Unsigned.UInt.to_int !@count)

let save_file_data path data =
  let count = CArray.length data in
  _save_file_data path (to_voidp (CArray.start data)) count

let export_data_as_code data filename =
  _export_data_as_code data (String.length data) filename

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

let unload_model_animations model_animations =
  let count = CArray.length model_animations in
  _unload_model_animations (CArray.start model_animations) count

let load_font_ex filename size = function
  | None -> _load_font_ex filename size None 0
  | Some arr ->
      _load_font_ex filename size (Some (CArray.start arr)) (CArray.length arr)

let draw_text_codepoints font codepoints pos size spacing tint =
  let count = CArray.length codepoints in
  _draw_text_codepoints font (CArray.start codepoints) count pos size spacing
    tint

let get_char_pressed () = _get_char_pressed () |> Uchar.of_int
