module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Raudio_fixed_types

  let init_audio_device = foreign "InitAudioDevice" (void @-> returning void)
  let close_audio_device = foreign "CloseAudioDevice" (void @-> returning void)

  let is_audio_device_ready =
    foreign "IsAudioDeviceReady" (void @-> returning bool)

  let set_master_volume = foreign "SetMasterVolume" (float @-> returning void)
  let get_master_volume = foreign "GetMasterVolume" (void @-> returning float)
  let load_wave = foreign "LoadWave" (string @-> returning Wave.t)

  let load_wave_from_memory =
    foreign "LoadWaveFromMemory" (string @-> string @-> int @-> returning Wave.t)

  let is_wave_ready = foreign "IsWaveReady" (Wave.t @-> returning bool)
  let load_sound = foreign "LoadSound" (string @-> returning Sound.t)

  let load_sound_from_wave =
    foreign "LoadSoundFromWave" (Wave.t @-> returning Sound.t)

  let load_sound_alias = foreign "LoadSoundAlias" (Sound.t @-> returning Sound.t)
  let is_sound_ready = foreign "IsSoundReady" (Sound.t @-> returning bool)

  let update_sound =
    foreign "UpdateSound" (Sound.t @-> ptr void @-> int @-> returning void)

  let unload_wave = foreign "UnloadWave" (Wave.t @-> returning void)
  let unload_sound = foreign "UnloadSound" (Sound.t @-> returning void)

  let unload_sound_alias =
    foreign "UnloadSoundAlias" (Sound.t @-> returning void)

  let export_wave = foreign "ExportWave" (Wave.t @-> string @-> returning bool)

  let export_wave_as_code =
    foreign "ExportWaveAsCode" (Wave.t @-> string @-> returning bool)

  let play_sound = foreign "PlaySound" (Sound.t @-> returning void)
  let stop_sound = foreign "StopSound" (Sound.t @-> returning void)
  let pause_sound = foreign "PauseSound" (Sound.t @-> returning void)
  let resume_sound = foreign "ResumeSound" (Sound.t @-> returning void)
  let is_sound_playing = foreign "IsSoundPlaying" (Sound.t @-> returning bool)

  let set_sound_volume =
    foreign "SetSoundVolume" (Sound.t @-> float @-> returning void)

  let set_sound_pitch =
    foreign "SetSoundPitch" (Sound.t @-> float @-> returning void)

  let set_sound_pan =
    foreign "SetSoundPan" (Sound.t @-> float @-> returning void)

  let wave_copy = foreign "WaveCopy" (Wave.t @-> returning Wave.t)

  let wave_crop =
    foreign "WaveCrop" (ptr Wave.t @-> int @-> int @-> returning void)

  let wave_format =
    foreign "WaveFormat" (ptr Wave.t @-> int @-> int @-> int @-> returning void)

  let load_wave_samples =
    foreign "LoadWaveSamples" (Wave.t @-> returning (ptr float))

  let unload_wave_samples =
    foreign "UnloadWaveSamples" (ptr float @-> returning void)

  let load_music_stream =
    foreign "LoadMusicStream" (string @-> returning Music.t)

  let load_music_stream_from_memory =
    foreign "LoadMusicStreamFromMemory"
      (string @-> string @-> int @-> returning Music.t)

  let is_music_ready = foreign "IsMusicReady" (Music.t @-> returning bool)

  let unload_music_stream =
    foreign "UnloadMusicStream" (Music.t @-> returning void)

  let play_music_stream = foreign "PlayMusicStream" (Music.t @-> returning void)

  let is_music_stream_playing =
    foreign "IsMusicStreamPlaying" (Music.t @-> returning bool)

  let update_music_stream =
    foreign "UpdateMusicStream" (Music.t @-> returning void)

  let stop_music_stream = foreign "StopMusicStream" (Music.t @-> returning void)

  let pause_music_stream =
    foreign "PauseMusicStream" (Music.t @-> returning void)

  let resume_music_stream =
    foreign "ResumeMusicStream" (Music.t @-> returning void)

  let seek_music_stream =
    foreign "SeekMusicStream" (Music.t @-> float @-> returning void)

  let set_music_volume =
    foreign "SetMusicVolume" (Music.t @-> float @-> returning void)

  let set_music_pitch =
    foreign "SetMusicPitch" (Music.t @-> float @-> returning void)

  let set_music_pan =
    foreign "SetMusicPan" (Music.t @-> float @-> returning void)

  let get_music_time_length =
    foreign "GetMusicTimeLength" (Music.t @-> returning float)

  let get_music_time_played =
    foreign "GetMusicTimePlayed" (Music.t @-> returning float)

  let load_audio_stream =
    foreign "LoadAudioStream" (int @-> int @-> int @-> returning AudioStream.t)

  let is_audio_stream_ready =
    foreign "IsAudioStreamReady" (AudioStream.t @-> returning bool)

  let unload_audio_stream =
    foreign "UnloadAudioStream" (AudioStream.t @-> returning void)

  let update_audio_stream =
    foreign "UpdateAudioStream"
      (AudioStream.t @-> ptr void @-> int @-> returning void)

  let is_audio_stream_processed =
    foreign "IsAudioStreamProcessed" (AudioStream.t @-> returning bool)

  let play_audio_stream =
    foreign "PlayAudioStream" (AudioStream.t @-> returning void)

  let pause_audio_stream =
    foreign "PauseAudioStream" (AudioStream.t @-> returning void)

  let resume_audio_stream =
    foreign "ResumeAudioStream" (AudioStream.t @-> returning void)

  let is_audio_stream_playing =
    foreign "IsAudioStreamPlaying" (AudioStream.t @-> returning bool)

  let stop_audio_stream =
    foreign "StopAudioStream" (AudioStream.t @-> returning void)

  let set_audio_stream_volume =
    foreign "SetAudioStreamVolume" (AudioStream.t @-> float @-> returning void)

  let set_audio_stream_pitch =
    foreign "SetAudioStreamPitch" (AudioStream.t @-> float @-> returning void)

  let set_audio_stream_pan =
    foreign "SetAudioStreamPan" (AudioStream.t @-> float @-> returning void)

  let set_audio_stream_buffer_size_default =
    foreign "SetAudioStreamBufferSizeDefault" (int @-> returning void)

  (* let set_audio_stream_callback = *)
  (*   foreign "SetAudioStreamCallback" (AudioStream.t @-> audio_callback @-> returning void) *)

  (* let attach_audio_stream_processor = *)
  (*   foreign "AttachAudioStreamProcessor" (AudioStream.t @-> audio_callback @-> returning void) *)

  (* let detach_audio_stream_processor = *)
  (*   foreign "DetachAudioStreamProcessor" (AudioStream.t @-> audio_callback @-> returning void) *)

  (* let attach_audio_mixed_processor = *)
  (*   foreign "AttachAudioMixedProcessor" (audio_callback @-> returning void) *)

  (* let detach_audio_mixed_processor = *)
  (*   foreign "DetachAudioMixedProcessor" (audio_callback @-> returning void) *)
end
