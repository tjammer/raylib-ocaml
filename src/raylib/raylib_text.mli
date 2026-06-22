open Raylib_core

(** {2 Font Loading and Text Drawing Functions (Module: text)} *)

(** {3 Font loading/unloading functions} *)

val get_font_default : unit -> Font.t
(** [get_font_default ()] Get the default Font*)

val load_font : string -> Font.t
(** [load_font file_name] Load font from file into GPU memory (VRAM)*)

val load_font_ex : string -> int -> int CArray.t option -> Font.t
(** [load_font_ex file_name font_size codepoints] Load font from
    file with extended parameters, use None for codepoints to load the default
    character set*)

val load_font_from_image : Image.t -> Color.t -> int -> Font.t
(** [load_font_from_image image key first_char] Load font from Image (XNA style)*)

val load_font_from_memory : string -> string -> int -> int CArray.t -> Font.t
(** [load_font_from_memory file_type file_data font_size codepoints] Load font
    from memory buffer, fileType refers to extension: i.e. '.ttf'*)

val is_font_valid : Font.t -> bool
(** [is_font_valid font] Check if a font is valid (font data loaded, WARNING:
    GPU texture not checked)*)

val load_font_data :
  string -> int -> int CArray.t -> FontType.t -> GlyphInfo.t CArray.t
(** [load_font_data file_data font_size codepoints type] Load font data for
    further use*)

val gen_image_font_atlas :
  GlyphInfo.t CArray.t -> int -> int -> int -> Image.t * Rectangle.t CArray.t
(** [gen_image_font_atlas glyphs font_size padding pack_method] Generate image
    font atlas using chars info*)

val unload_font_data : GlyphInfo.t CArray.t -> unit
(** [unload_font_data glyphs] Unload font chars info data (RAM)*)

val unload_font : Font.t -> unit
(** [unload_font font] Unload font from GPU memory (VRAM)*)

val export_font_as_code : Font.t -> string -> bool
(** [export_font_as_code font file_name] Export font as code file, returns true
    on success*)

val draw_fps : int -> int -> unit
(** [draw_fps pos_x pos_y] Draw current FPS*)

val draw_text : string -> int -> int -> int -> Color.t -> unit
(** [draw_text text pos_x pos_y font_size color] Draw text (using default font)*)

val draw_text_ex :
  Font.t -> string -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_text_ex font text position font_size spacing tint] Draw text using
    font and additional parameters*)

val draw_text_pro :
  Font.t ->
  string ->
  Vector2.t ->
  Vector2.t ->
  float ->
  float ->
  float ->
  Color.t ->
  unit
(** [draw_text_pro font text position origin rotation font_size spacing tint]
    Draw text using Font and pro parameters (rotation)*)

val draw_text_codepoint : Font.t -> int -> Vector2.t -> float -> Color.t -> unit
(** [draw_text_codepoint font codepoint position font_size tint] Draw one
    character (codepoint)*)

val draw_text_codepoints :
  Font.t -> int CArray.t -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_text_codepoints font codepoints codepoint_count position font_size
     spacing tint] Draw multiple character (codepoint)*)

val set_text_line_spacing : int -> unit
(** [set_text_line_spacing spacing] Set vertical line spacing when drawing with
    line-breaks*)

(** {3 Text misc. functions} *)

val measure_text : string -> int -> int
(** [measure_text text font_size] Measure string width for default font*)

val measure_text_ex : Font.t -> string -> float -> float -> Vector2.t
(** [measure_text_ex font text font_size spacing] Measure string size for Font*)

val measure_text_codepoints :
  Font.t -> int CArray.t -> float -> float -> Vector2.t
(** [measure_text_codepoints font codepoints font_size spacing] Measure string
    size for an existing array of codepoints for Font*)

val get_glyph_index : Font.t -> int -> int
(** [get_glyph_index font codepoint] Get glyph index position in font for a
    codepoint (unicode character), fallback to '?' if not found*)

val get_glyph_info : Font.t -> int -> GlyphInfo.t
(** [get_glyph_info font codepoint] Get glyph font info data for a codepoint
    (unicode character), fallback to '?' if not found*)

val get_glyph_atlas_rec : Font.t -> int -> Rectangle.t
(** [get_glyph_atlas_rec font codepoint] Get glyph rectangle in font atlas for a
    codepoint (unicode character), fallback to '?' if not found*)

val load_utf8 : int ptr -> int -> char ptr
(** [load_utf8 codepoints length] Load UTF-8 text encoded from codepoints array*)

val unload_utf8 : char ptr -> unit
(** [unload_utf8 text] Unload UTF-8 text encoded from codepoints array*)

val load_codepoints : string -> int ptr -> int ptr
(** [load_codepoints text count] Load all codepoints from a UTF-8 text string,
    codepoints count returned by parameter*)

val unload_codepoints : int ptr -> unit
(** [unload_codepoints codepoints] Unload codepoints data from memory*)

val get_codepoint_count : string -> int
(** [get_codepoint_count text] Get total number of codepoints in a UTF-8 encoded
    string*)

val get_codepoint : string -> int ptr -> int
(** [get_codepoint text codepoint_size] Get next codepoint in a UTF-8 encoded
    string, 0x3f('?') is returned on failure*)

val get_codepoint_next : string -> int ptr -> int
(** [get_codepoint_next text codepoint_size] Get next codepoint in a UTF-8
    encoded string, 0x3f('?') is returned on failure*)

val get_codepoint_previous : string -> int ptr -> int
(** [get_codepoint_previous text codepoint_size] Get previous codepoint in a
    UTF-8 encoded string, 0x3f('?') is returned on failure*)

val codepoint_to_utf8 : int -> int ptr -> string
(** [codepoint_to_utf8 codepoint utf8_size] Encode one codepoint into UTF-8 byte
    array (array length returned as parameter)*)

val text_is_equal : string -> string -> bool
(** [text_is_equal text1 text2] Check if two text string are equal*)

val text_length : string -> int
(** [text_length text] Get text length, checks for '\0' ending*)

val text_subtext : string -> int -> int -> string
(** [text_subtext text position length] Get a piece of a text string*)

val text_remove_spaces : string -> string
(** [text_remove_spaces text] Remove text spaces, concat words*)

val get_text_between : string -> string -> string -> string
(** [get_text_between text begin end] Get text between two strings*)

val text_replace : string -> string -> string -> string
(** [text_replace text search replacement] Replace text string with new string*)

val text_replace_between : string -> string -> string -> string -> string
(** [text_replace_between text begin end replacement] Replace text between two
    specific strings*)

val text_insert : string -> string -> int -> string
(** [text_insert text insert position] Insert text in a defined byte position*)

val text_find_index : string -> string -> int
(** [text_find_index text find] Find first text occurrence within a string*)

val text_to_upper : string -> string
(** [text_to_upper text] Get upper case version of provided string*)

val text_to_lower : string -> string
(** [text_to_lower text] Get lower case version of provided string*)

val text_to_pascal : string -> string
(** [text_to_pascal text] Get Pascal case notation version of provided string*)

val text_to_snake : string -> string
(** [text_to_snake text] Get Snake case notation version of provided string*)

val text_to_camel : string -> string
(** [text_to_camel text] Get Camel case notation version of provided string*)

val text_to_integer : string -> int
(** [text_to_integer text] Get integer value from text (negative values not
    supported)*)

val text_to_float : string -> float
(** [text_to_float text] Get float value from text (negative values not
    supported)*)
