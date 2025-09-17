type audio_callback = unit Ctypes.ptr -> Unsigned.uint -> unit

type load_file_data_callback =
  string -> int Ctypes.ptr -> Unsigned.uchar Ctypes.ptr

type save_file_data_callback = string -> unit Ctypes.ptr -> int -> bool
type load_file_text_callback = string -> char Ctypes.ptr
type save_file_text_callback = string -> char Ctypes.ptr -> bool

include Raylib_callbacks_c.Raylib_callbacks_generated.Functions
open Ctypes
open Foreign

(* module Audio_callback = *)
(*   (val dynamic_funptr ~runtime_lock:true ~thread_registration:true *)
(*          (ptr void @-> uint @-> returning void)) *)

let end_drawing2 =
  foreign ~release_runtime_lock:true "EndDrawing" (void @-> returning void)

let save = ref None

let _set_audio_stream_callback =
  let audio_callback =
    Foreign.funptr ~thread_registration:true ~runtime_lock:true
      Ctypes.(ptr void @-> uint @-> returning void)
  in
  foreign ~release_runtime_lock:true "SetAudioStreamCallback"
    (* (Raylib.AudioStream.t @-> Audio_callback.t @-> returning void) *)
    (Raylib.AudioStream.t @-> audio_callback @-> returning void)

let set_audio_stream_callback stream cb =
  save := Some cb;
  (* Gc.full_major (); *)
  _set_audio_stream_callback stream (Option.get !save)
(* (Audio_callback.of_fun cb) *)
