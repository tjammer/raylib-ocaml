open Ctypes

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Raylib_core

  let get_font_default = foreign "GetFontDefault" (void @-> returning Font.t)
  let load_font = foreign "LoadFont" (string @-> returning Font.t)

  let _load_font_ex =
    foreign "LoadFontEx"
      (string @-> int @-> ptr_opt int @-> int @-> returning Font.t)

  let load_font_from_image =
    foreign "LoadFontFromImage"
      (Image.t @-> Color.t @-> int @-> returning Font.t)

  let load_font_from_memory =
    foreign "LoadFontFromMemory"
      (string @-> string @-> int @-> int @-> ptr int @-> int
     @-> returning Font.t)

  let is_font_valid = foreign "IsFontValid" (Font.t @-> returning bool)

  let _load_font_data =
    foreign "LoadFontData"
      (string @-> int @-> int @-> ptr int @-> int @-> int @-> ptr int
      @-> returning (ptr GlyphInfo.t))

  let gen_image_font_atlas =
    foreign "GenImageFontAtlas"
      (ptr GlyphInfo.t
      @-> ptr (ptr Rectangle.t)
      @-> int @-> int @-> int @-> int @-> returning Image.t)

  let unload_font_data =
    foreign "UnloadFontData" (ptr GlyphInfo.t @-> int @-> returning void)

  let unload_font = foreign "UnloadFont" (Font.t @-> returning void)

  let export_font_as_code =
    foreign "ExportFontAsCode" (Font.t @-> string @-> returning bool)

  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_text_ex =
    foreign "DrawTextEx"
      (Font.t @-> string @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_text_pro =
    foreign "DrawTextPro"
      (Font.t @-> string @-> Vector2.t @-> Vector2.t @-> float @-> float
     @-> float @-> Color.t @-> returning void)

  let draw_text_codepoint =
    foreign "DrawTextCodepoint"
      (Font.t @-> int @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let _draw_text_codepoints =
    foreign "DrawTextCodepoints"
      (Font.t @-> ptr int @-> int @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let set_text_line_spacing =
    foreign "SetTextLineSpacing" (int @-> returning void)

  let measure_text = foreign "MeasureText" (string @-> int @-> returning int)

  let measure_text_ex =
    foreign "MeasureTextEx"
      (Font.t @-> string @-> float @-> float @-> returning Vector2.t)

  let _measure_text_codepoints =
    foreign "MeasureTextCodepoints"
      (Font.t @-> ptr int @-> int @-> float @-> float @-> returning Vector2.t)

  let get_glyph_index =
    foreign "GetGlyphIndex" (Font.t @-> int @-> returning int)

  let get_glyph_info =
    foreign "GetGlyphInfo" (Font.t @-> int @-> returning GlyphInfo.t)

  let get_glyph_atlas_rec =
    foreign "GetGlyphAtlasRec" (Font.t @-> int @-> returning Rectangle.t)

  let load_utf8 = foreign "LoadUTF8" (ptr int @-> int @-> returning (ptr char))
  let unload_utf8 = foreign "UnloadUTF8" (ptr char @-> returning void)

  let load_codepoints =
    foreign "LoadCodepoints" (string @-> ptr int @-> returning (ptr int))

  let unload_codepoints = foreign "UnloadCodepoints" (ptr int @-> returning void)

  let get_codepoint_count =
    foreign "GetCodepointCount" (string @-> returning int)

  let get_codepoint =
    foreign "GetCodepoint" (string @-> ptr int @-> returning int)

  let get_codepoint_next =
    foreign "GetCodepointNext" (string @-> ptr int @-> returning int)

  let get_codepoint_previous =
    foreign "GetCodepointPrevious" (string @-> ptr int @-> returning int)

  let codepoint_to_utf8 =
    foreign "CodepointToUTF8" (int @-> ptr int @-> returning string)

  (* let load_text_lines = *)
  (*   foreign "LoadTextLines" (string @-> ptr int @-> returning (ptr (ptr char))) *)

  (* let unload_text_lines = *)
  (*   foreign "UnloadTextLines" (ptr (ptr char) @-> int @-> returning void) *)

  (* let text_copy = foreign "TextCopy" (string @-> string @-> returning int) *)

  let text_is_equal =
    foreign "TextIsEqual" (string @-> string @-> returning bool)

  let text_length = foreign "TextLength" (string @-> returning int)

  (* let text_format = *)
  (*   foreign "TextFormat" (string @-> ... @-> returning string) *)

  let text_subtext =
    foreign "TextSubtext" (string @-> int @-> int @-> returning string)

  let text_remove_spaces =
    foreign "TextRemoveSpaces" (string @-> returning string)

  let get_text_between =
    foreign "GetTextBetween" (string @-> string @-> string @-> returning string)

  let text_replace =
    foreign "TextReplace" (string @-> string @-> string @-> returning string)

  (* let text_replace_alloc = *)
  (*   foreign "TextReplaceAlloc" *)
  (*     (string @-> string @-> string @-> returning string) *)

  let text_replace_between =
    foreign "TextReplaceBetween"
      (string @-> string @-> string @-> string @-> returning string)

  (* let text_replace_between_alloc = *)
  (*   foreign "TextReplaceBetweenAlloc" *)
  (*     (string @-> string @-> string @-> string @-> returning string) *)

  let text_insert =
    foreign "TextInsert" (string @-> string @-> int @-> returning string)

  (* let text_insert_alloc = *)
  (*   foreign "TextInsertAlloc" (string @-> string @-> int @-> returning string) *)

  (* let text_join = *)
  (*   foreign "TextJoin" (string @-> int @-> string @-> returning string) *)

  (* let text_split = *)
  (*   foreign "TextSplit" (string @-> char @-> ptr int @-> returning string)) *)

  (* let text_append = *)
  (*   foreign "TextAppend" (string @-> string @-> ptr int @-> returning void) *)

  let text_find_index =
    foreign "TextFindIndex" (string @-> string @-> returning int)

  let text_to_upper = foreign "TextToUpper" (string @-> returning string)
  let text_to_lower = foreign "TextToLower" (string @-> returning string)
  let text_to_pascal = foreign "TextToPascal" (string @-> returning string)
  let text_to_snake = foreign "TextToSnake" (string @-> returning string)
  let text_to_camel = foreign "TextToCamel" (string @-> returning string)
  let text_to_integer = foreign "TextToInteger" (string @-> returning int)
  let text_to_float = foreign "TextToFloat" (string @-> returning float)
end

module Types (F : Ctypes.TYPE) = struct end
