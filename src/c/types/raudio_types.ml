module Types (F : Ctypes.TYPE) = struct
  open F

  module Wave = struct
    type t

    let t : t Ctypes.structure typ = structure "Wave"
    let frame_count = field t "frameCount" uint
    let sample_rate = field t "sampleRate" uint
    let sample_size = field t "sampleSize" uint
    let channels = field t "channels" uint
    let data = field t "data" (ptr void)
    let () = seal t
  end

  module AudioStream = struct
    let r_audio_buffer : [ `R_audio_buffer ] Ctypes.structure typ =
      structure "rAudioBuffer"

    let r_audio_processor : [ `R_audio_processor ] Ctypes.structure typ =
      structure "rAudioProcessor"

    type t

    let t : t Ctypes.structure typ = structure "AudioStream"
    let buffer = field t "buffer" (ptr r_audio_buffer)
    let processor = field t "processor" (ptr r_audio_processor)
    let sample_rate = field t "sampleRate" uint
    let sample_size = field t "sampleSize" uint
    let channels = field t "channels" uint
    let () = seal t
  end

  module Sound = struct
    type t

    let t : t Ctypes.structure typ = structure "Sound"
    let stream = field t "stream" AudioStream.t
    let frame_count = field t "frameCount" uint
    let () = seal t
  end

  module Music = struct
    type t

    let t : t Ctypes.structure typ = structure "Music"
    let stream = field t "stream" AudioStream.t
    let frame_count = field t "frameCount" uint
    let looping = field t "looping" bool
    let ctx_type = field t "ctxType" int
    let ctx_data = field t "ctxData" (ptr void)
    let () = seal t
  end
end
