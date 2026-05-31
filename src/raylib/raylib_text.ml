include Raylib_c_text.Raylib_text_generated.Functions
open Ctypes
open Raylib_core

let load_font_ex filename size = function
  | None -> _load_font_ex filename size None 0
  | Some arr ->
      _load_font_ex filename size (Some (CArray.start arr)) (CArray.length arr)

let load_font_data font_data font_size codepoints codepoint_count ty =
  let count = ptr_of_int 0 in
  let glyphs =
    _load_font_data font_data (String.length font_data) font_size codepoints
      codepoint_count ty count
  in
  CArray.from_ptr glyphs !@count

let measure_text_codepoints font codepoints font_size spacing =
  _measure_text_codepoints font (CArray.start codepoints)
    (CArray.length codepoints) font_size spacing

let draw_text_codepoints font codepoints pos size spacing tint =
  let count = CArray.length codepoints in
  _draw_text_codepoints font (CArray.start codepoints) count pos size spacing
    tint
