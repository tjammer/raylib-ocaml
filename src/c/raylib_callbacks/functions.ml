open Ctypes

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Raylib_c.Types

  let audio_callback =
    Foreign.funptr Ctypes.(ptr void @-> uint @-> returning void)

  let set_audio_stream_callback =
    foreign "SetAudioStreamCallback"
      (AudioStream.t @-> audio_callback @-> returning void)

  let attach_audio_stream_processor =
    foreign "AttachAudioStreamProcessor"
      (AudioStream.t @-> audio_callback @-> returning void)

  let detach_audio_stream_processor =
    foreign "DetachAudioStreamProcessor"
      (AudioStream.t @-> audio_callback @-> returning void)

  let attach_audio_mixed_processor =
    foreign "AttachAudioMixedProcessor" (audio_callback @-> returning void)

  let detach_audio_mixed_processor =
    foreign "DetachAudioMixedProcessor" (audio_callback @-> returning void)

  let load_file_data_callback =
    Foreign.funptr Ctypes.(string @-> ptr int @-> returning (ptr uchar))

  let save_file_data_callback =
    Foreign.funptr Ctypes.(string @-> ptr void @-> int @-> returning bool)

  let load_file_text_callback =
    Foreign.funptr Ctypes.(string @-> returning (ptr char))

  let save_file_text_callback =
    Foreign.funptr Ctypes.(string @-> ptr char @-> returning bool)

  let set_load_file_data_callback =
    foreign "SetLoadFileDataCallback"
      (load_file_data_callback @-> returning void)

  let set_save_file_data_callback =
    foreign "SetSaveFileDataCallback"
      (save_file_data_callback @-> returning void)

  let set_load_file_text_callback =
    foreign "SetLoadFileTextCallback"
      (load_file_text_callback @-> returning void)

  let set_save_file_text_callback =
    foreign "SetSaveFileTextCallback"
      (save_file_text_callback @-> returning void)
end

module Types (F : Ctypes.TYPE) = struct end
