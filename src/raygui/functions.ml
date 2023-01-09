include Raygui_fixed_types
include Raygui_functions.Description (Raygui_c.C_generated_gui)

let to_struct a = (a : 'a Raylib.ctyp :> 'a Ctypes.structure)

(* coercion with the ptr type did not work :( *)
let to_struct_ptr a = Ctypes.( !@ ) a |> to_struct |> Ctypes.addr
(* let to_struct_ptr a =
 *   (a : 'a Raylib.ctyp Raylib.ptr :> 'a Ctypes.structure Raylib.ptr) *)

let set_font fnt = _set_font @@ to_struct fnt
let get_font () = Raylib.to_ctyp @@ _get_font ()
let window_box bx = _window_box @@ to_struct bx
let group_box bx = _group_box @@ to_struct bx
let line bx = _line @@ to_struct bx
let panel bx = _panel @@ to_struct bx

let scroll_panel a b c =
  _scroll_panel (to_struct a) (to_struct b) (to_struct_ptr c) |> Raylib.to_ctyp

let label bx = _label @@ to_struct bx
let button bx = _button @@ to_struct bx
let label_button bx = _label_button @@ to_struct bx
let toggle rct = _toggle @@ to_struct rct
let toggle_group rct = _toggle_group @@ to_struct rct
let check_box rct = _check_box @@ to_struct rct
let combo_box rct = _combo_box @@ to_struct rct

let dropdown_box rct labels vl edit =
  let vl_ptr = Raylib.ptr_of_int vl in
  let rt = _dropdown_box (to_struct rct) labels vl_ptr edit in
  (Ctypes.(!@vl_ptr), rt)

let spinner rct label vl ~min ~max edit =
  let vl_ptr = Raylib.ptr_of_int vl in
  let rt = _spinner (to_struct rct) label vl_ptr min max edit in
  (Ctypes.(!@vl_ptr), rt)

let value_box rct label vl ~min ~max edit =
  let vl_ptr = Raylib.ptr_of_int vl in
  let rt = _value_box (to_struct rct) label vl_ptr min max edit in
  (Ctypes.(!@vl_ptr), rt)

let text_box rct txt state =
  let open Ctypes in
  let str_arr = CArray.of_string txt in
  let rt =
    _text_box (to_struct rct) (CArray.start str_arr)
      (CArray.length str_arr + 1)
      state
  in
  (String.init (CArray.length str_arr) (CArray.unsafe_get str_arr), rt)

let text_box_multi rct txt state =
  let open Ctypes in
  let str_arr = CArray.of_string txt in
  let rt =
    _text_box_multi (to_struct rct) (CArray.start str_arr)
      (CArray.length str_arr + 1)
      state
  in
  (String.init (CArray.length str_arr) (CArray.unsafe_get str_arr), rt)

let slider rct label txt value ~min ~max =
  _slider (to_struct rct) label txt value min max

let slider_bar rct label txt value ~min ~max =
  _slider_bar (to_struct rct) label txt value min max

let progress_bar rct label txt value ~min ~max =
  _progress_bar (to_struct rct) label txt value min max

let status_bar rct = _status_bar @@ to_struct rct
let dummy_rec rct = _dummy_rec @@ to_struct rct
let scroll_bar rct value ~min ~max = _scroll_bar (to_struct rct) value min max
let grid rct b c = _grid (to_struct rct) b c |> Raylib.to_ctyp

let list_view rct label index active =
  let vl_ptr = Raylib.ptr_of_int index in
  let rt = _list_view (to_struct rct) label vl_ptr active in
  (rt, Ctypes.(!@vl_ptr))

let list_view_ex rct strings focus index active =
  let open Ctypes in
  let str_arr = CArray.of_list Ctypes.string strings in
  let focus_ptr = Raylib.ptr_of_int focus in
  let index_ptr = Raylib.ptr_of_int index in
  let active =
    _list_view_ex (to_struct rct) (CArray.start str_arr) (List.length strings)
      focus_ptr index_ptr active
  in
  (active, !@focus_ptr, !@index_ptr)

let message_box rct = _message_box @@ to_struct rct

let text_input_box rct title message buttons text =
  let open Ctypes in
  let str_arr = CArray.of_string text in
  let rt =
    _text_input_box (to_struct rct) title message buttons (CArray.start str_arr)
  in
  (String.init (CArray.length str_arr) (CArray.unsafe_get str_arr), rt)

let color_picker rct col =
  _color_picker (to_struct rct) (to_struct col) |> Raylib.to_ctyp

let color_panel rct col =
  _color_panel (to_struct rct) (to_struct col) |> Raylib.to_ctyp

let color_bar_alpha rct = _color_bar_alpha @@ to_struct rct
let color_bar_hue rct = _color_bar_hue @@ to_struct rct
