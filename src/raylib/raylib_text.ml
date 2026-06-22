include Raylib_c_text.Raylib_text_generated.Functions
open Ctypes
open Raylib_core

let load_font_ex filename size = function
  | None -> _load_font_ex filename size None 0
  | Some arr ->
      _load_font_ex filename size (Some (CArray.start arr)) (CArray.length arr)

let load_font_from_memory file_type file_data font_size codepoints =
  let count = CArray.length codepoints in
  _load_font_from_memory file_type file_data (String.length file_data) font_size
    (CArray.start codepoints) count

let load_font_data font_data font_size codepoints ty =
  let in_count = CArray.length codepoints in
  let out_count = ptr_of_int 0 in
  let glyphs =
    _load_font_data font_data (String.length font_data) font_size
      (CArray.start codepoints) in_count ty out_count
  in
  CArray.from_ptr glyphs !@out_count

let gen_image_font_atlas glyphs font_size padding pack_method =
  let recs_t = ptr Rectangle.t in
  let recs = allocate recs_t (from_voidp Rectangle.t null) in
  let count = CArray.length glyphs in
  let image =
    _gen_image_font_atlas (CArray.start glyphs) recs count font_size padding
      pack_method
  in
  (image, CArray.from_ptr !@recs count)

let unload_font_data glyphs =
  let count = CArray.length glyphs in
  _unload_font_data (CArray.start glyphs) count

let measure_text_codepoints font codepoints font_size spacing =
  _measure_text_codepoints font (CArray.start codepoints)
    (CArray.length codepoints) font_size spacing

let draw_text_codepoints font codepoints pos size spacing tint =
  let count = CArray.length codepoints in
  _draw_text_codepoints font (CArray.start codepoints) count pos size spacing
    tint
