type audio_callback = unit Ctypes.ptr -> Unsigned.uint -> unit

type load_file_data_callback =
  string -> int Ctypes.ptr -> Unsigned.uchar Ctypes.ptr

type save_file_data_callback = string -> unit Ctypes.ptr -> int -> bool
type load_file_text_callback = string -> char Ctypes.ptr
type save_file_text_callback = string -> char Ctypes.ptr -> bool

include Raylib_callbacks_c.Raylib_callbacks_generated.Functions
