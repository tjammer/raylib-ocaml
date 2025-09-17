(** Audio callbacks*)

type audio_callback = unit Ctypes.ptr -> Unsigned.uint -> unit

val set_audio_stream_callback : Raylib.AudioStream.t -> audio_callback -> unit
(** [set_audio_stream_callback stream callback] Audio thread callback to request
    new data*)

val attach_audio_stream_processor :
  Raylib.AudioStream.t -> audio_callback -> unit
(** [attach_audio_stream_processor stream processor] Attach audio stream
    processor to stream, receives the samples as 'float'*)

val detach_audio_stream_processor :
  Raylib.AudioStream.t -> audio_callback -> unit
(** [detach_audio_stream_processor stream processor] Detach audio stream
    processor from stream*)

val attach_audio_mixed_processor : audio_callback -> unit
(** [attach_audio_mixed_processor processor] Attach audio stream processor to
    the entire audio pipeline, receives the samples as 'float'*)

val detach_audio_mixed_processor : audio_callback -> unit
(** [detach_audio_mixed_processor processor] Detach audio stream processor from
    the entire audio pipeline*)

(** File callbacks *)

type load_file_data_callback =
  string -> int Ctypes.ptr -> Unsigned.uchar Ctypes.ptr

type save_file_data_callback = string -> unit Ctypes.ptr -> int -> bool
type load_file_text_callback = string -> char Ctypes.ptr
type save_file_text_callback = string -> char Ctypes.ptr -> bool

val set_load_file_data_callback : load_file_data_callback -> unit
(** [set_load_file_data_callback callback] Set custom file binary data loader*)

val set_save_file_data_callback : save_file_data_callback -> unit
(** [set_save_file_data_callback callback] Set custom file binary data saver*)

val set_load_file_text_callback : load_file_text_callback -> unit
(** [set_load_file_text_callback callback] Set custom file text data loader*)

val set_save_file_text_callback : save_file_text_callback -> unit
(** [set_save_file_text_callback callback] Set custom file text data saver*)
