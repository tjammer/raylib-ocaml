open Raylib_fixed_types
module Math = Raylib_math.Description (Raylib_c.Raylib_c_generated_math)
include Raylib_functions.Description (Raylib_c.Raylib_c_generated_functions)
open Ctypes

module Wave = struct
  type t' = Wave.t
  type t = t' Raylib.ctyp

  let t = Wave.t
  let sample_rate wave = getf wave Wave.sample_rate
  let sample_size wave = getf wave Wave.sample_size
  let channels wave = getf wave Wave.channels
  let set_sample_rate wave sample_rate = setf wave Wave.sample_rate sample_rate
  let set_sample_size wave sample_size = setf wave Wave.sample_size sample_size
  let set_channels wave channels = setf wave Wave.channels channels
end

module AudioStream = struct
  type t' = AudioStream.t
  type t = t' Raylib.ctyp

  let t = AudioStream.t
  let sample_rate audiostream = getf audiostream AudioStream.sample_rate
  let sample_size audiostream = getf audiostream AudioStream.sample_size
  let channels audiostream = getf audiostream AudioStream.channels

  let set_sample_rate audiostream sample_rate =
    setf audiostream AudioStream.sample_rate sample_rate

  let set_sample_size audiostream sample_size =
    setf audiostream AudioStream.sample_size sample_size

  let set_channels audiostream channels =
    setf audiostream AudioStream.channels channels
end

module Sound = struct
  type t' = Sound.t
  type t = t' Raylib.ctyp

  let t = Sound.t
  let stream sound = getf sound Sound.stream
  let set_stream sound stream = setf sound Sound.stream stream
end

module Music = struct
  type t' = Music.t
  type t = t' Raylib.ctyp

  let t = Music.t
  let stream music = getf music Music.stream
  let looping music = getf music Music.looping
  let ctx_type music = getf music Music.ctx_type
  let set_stream music stream = setf music Music.stream stream
  let set_looping music looping = setf music Music.looping looping
  let set_ctx_type music ctx_type = setf music Music.ctx_type ctx_type
end
