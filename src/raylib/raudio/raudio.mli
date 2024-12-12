open Raylib

(** {1 Types} *)

module Wave : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val sample_rate : t -> Unsigned.uint
  (** Frequency (samples per second) *)

  val sample_size : t -> Unsigned.uint
  (** Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)

  val channels : t -> Unsigned.uint
  (** Number of channels (1-mono, 2-stereo, ...) *)

  val set_sample_rate : t -> Unsigned.uint -> unit
  val set_sample_size : t -> Unsigned.uint -> unit
  val set_channels : t -> Unsigned.uint -> unit
end

module AudioStream : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val sample_rate : t -> Unsigned.uint
  (** Frequency (samples per second) *)

  val sample_size : t -> Unsigned.uint
  (** Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)

  val channels : t -> Unsigned.uint
  (** Number of channels (1-mono, 2-stereo, ...) *)

  val set_sample_rate : t -> Unsigned.uint -> unit
  val set_sample_size : t -> Unsigned.uint -> unit
  val set_channels : t -> Unsigned.uint -> unit
end

module Sound : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val stream : t -> AudioStream.t
  (** Audio stream *)

  val set_stream : t -> AudioStream.t -> unit
end

module Music : sig
  type t'
  type t = t' ctyp

  val t : t Ctypes.typ

  val stream : t -> AudioStream.t
  (** Audio stream *)

  val looping : t -> bool
  (** Music looping enable *)

  val ctx_type : t -> int
  (** Type of music context (audio filetype) *)

  val set_stream : t -> AudioStream.t -> unit
  val set_looping : t -> bool -> unit
  val set_ctx_type : t -> int -> unit
end

(** {1 Functions}*)

(** {2 Audio Loading and Playing Functions (Module: audio)} *)

(** {3 Audio device management functions} *)
val init_audio_device : unit -> unit
(** [init_audio_device ()] Initialize audio device and context*)

val close_audio_device : unit -> unit
(** [close_audio_device ()] Close the audio device and context*)

val is_audio_device_ready : unit -> bool
(** [is_audio_device_ready ()] Check if audio device has been initialized successfully*)

val set_master_volume : float -> unit
(** [set_master_volume volume] Set master volume (listener)*)

val get_master_volume : unit -> float
(** [get_master_volume ()] Get master volume (listener)*)

val load_wave : string -> Wave.t
(** [load_wave file_name] Load wave data from file*)

val load_wave_from_memory : string -> string -> int -> Wave.t
(** [load_wave_from_memory file_type file_data data_size] Load wave from memory buffer, fileType refers to extension: i.e. '.wav'*)

val is_wave_ready : Wave.t -> bool
(** [is_wave_ready wave] Checks if wave data is ready*)

val load_sound : string -> Sound.t
(** [load_sound file_name] Load sound from file*)

val load_sound_from_wave : Wave.t -> Sound.t
(** [load_sound_from_wave wave] Load sound from wave data*)

val load_sound_alias : Sound.t -> Sound.t
(** [load_sound_alias source] Create a new sound that shares the same sample data as the source sound, does not own the sound data*)

val is_sound_ready : Sound.t -> bool
(** [is_sound_ready sound] Checks if a sound is ready*)

val update_sound : Sound.t -> unit ptr -> int -> unit
(** [update_sound sound data sample_count] Update sound buffer with new data*)

val unload_wave : Wave.t -> unit
(** [unload_wave wave] Unload wave data*)

val unload_sound : Sound.t -> unit
(** [unload_sound sound] Unload sound*)

val unload_sound_alias : Sound.t -> unit
(** [unload_sound_alias alias] Unload a sound alias (does not deallocate sample data)*)

val export_wave : Wave.t -> string -> bool
(** [export_wave wave file_name] Export wave data to file, returns true on success*)

val export_wave_as_code : Wave.t -> string -> bool
(** [export_wave_as_code wave file_name] Export wave sample data to code (.h), returns true on success*)

(** {3 Wave/Sound management functions} *)

val play_sound : Sound.t -> unit
(** [play_sound sound] Play a sound*)

val stop_sound : Sound.t -> unit
(** [stop_sound sound] Stop playing a sound*)

val pause_sound : Sound.t -> unit
(** [pause_sound sound] Pause a sound*)

val resume_sound : Sound.t -> unit
(** [resume_sound sound] Resume a paused sound*)

val is_sound_playing : Sound.t -> bool
(** [is_sound_playing sound] Check if a sound is currently playing*)

val set_sound_volume : Sound.t -> float -> unit
(** [set_sound_volume sound volume] Set volume for a sound (1.0 is max level)*)

val set_sound_pitch : Sound.t -> float -> unit
(** [set_sound_pitch sound pitch] Set pitch for a sound (1.0 is base level)*)

val set_sound_pan : Sound.t -> float -> unit
(** [set_sound_pan sound pan] Set pan for a sound (0.5 is center)*)

val wave_copy : Wave.t -> Wave.t
(** [wave_copy wave] Copy a wave to a new wave*)

val wave_crop : Wave.t ptr -> int -> int -> unit
(** [wave_crop wave init_sample final_sample] Crop a wave to defined samples range*)

val wave_format : Wave.t ptr -> int -> int -> int -> unit
(** [wave_format wave sample_rate sample_size channels] Convert wave data to desired format*)

val load_wave_samples : Wave.t -> float ptr
(** [load_wave_samples wave] Load samples data from wave as a 32bit float data array*)

val unload_wave_samples : float ptr -> unit
(** [unload_wave_samples samples] Unload samples data loaded with LoadWaveSamples()*)

val load_music_stream : string -> Music.t
(** [load_music_stream file_name] Load music stream from file*)

val load_music_stream_from_memory : string -> string -> int -> Music.t
(** [load_music_stream_from_memory file_type data data_size] Load music stream from data*)

val is_music_ready : Music.t -> bool
(** [is_music_ready music] Checks if a music stream is ready*)

val unload_music_stream : Music.t -> unit
(** [unload_music_stream music] Unload music stream*)

val play_music_stream : Music.t -> unit
(** [play_music_stream music] Start music playing*)

val is_music_stream_playing : Music.t -> bool
(** [is_music_stream_playing music] Check if music is playing*)

val update_music_stream : Music.t -> unit
(** [update_music_stream music] Updates buffers for music streaming*)

val stop_music_stream : Music.t -> unit
(** [stop_music_stream music] Stop music playing*)

val pause_music_stream : Music.t -> unit
(** [pause_music_stream music] Pause music playing*)

val resume_music_stream : Music.t -> unit
(** [resume_music_stream music] Resume playing paused music*)

val seek_music_stream : Music.t -> float -> unit
(** [seek_music_stream music position] Seek music to a position (in seconds)*)

val set_music_volume : Music.t -> float -> unit
(** [set_music_volume music volume] Set volume for music (1.0 is max level)*)

val set_music_pitch : Music.t -> float -> unit
(** [set_music_pitch music pitch] Set pitch for a music (1.0 is base level)*)

val set_music_pan : Music.t -> float -> unit
(** [set_music_pan music pan] Set pan for a music (0.5 is center)*)

val get_music_time_length : Music.t -> float
(** [get_music_time_length music] Get music time length (in seconds)*)

val get_music_time_played : Music.t -> float
(** [get_music_time_played music] Get current music time played (in seconds)*)

val load_audio_stream : int -> int -> int -> AudioStream.t
(** [load_audio_stream sample_rate sample_size channels] Load audio stream (to stream raw audio pcm data)*)

(** {3 AudioStream management functions} *)

val is_audio_stream_ready : AudioStream.t -> bool
(** [is_audio_stream_ready stream] Checks if an audio stream is ready*)

val unload_audio_stream : AudioStream.t -> unit
(** [unload_audio_stream stream] Unload audio stream and free memory*)

val update_audio_stream : AudioStream.t -> unit ptr -> int -> unit
(** [update_audio_stream stream data frame_count] Update audio stream buffers with data*)

val is_audio_stream_processed : AudioStream.t -> bool
(** [is_audio_stream_processed stream] Check if any audio stream buffers requires refill*)

val play_audio_stream : AudioStream.t -> unit
(** [play_audio_stream stream] Play audio stream*)

val pause_audio_stream : AudioStream.t -> unit
(** [pause_audio_stream stream] Pause audio stream*)

val resume_audio_stream : AudioStream.t -> unit
(** [resume_audio_stream stream] Resume audio stream*)

val is_audio_stream_playing : AudioStream.t -> bool
(** [is_audio_stream_playing stream] Check if audio stream is playing*)

val stop_audio_stream : AudioStream.t -> unit
(** [stop_audio_stream stream] Stop audio stream*)

val set_audio_stream_volume : AudioStream.t -> float -> unit
(** [set_audio_stream_volume stream volume] Set volume for audio stream (1.0 is max level)*)

val set_audio_stream_pitch : AudioStream.t -> float -> unit
(** [set_audio_stream_pitch stream pitch] Set pitch for audio stream (1.0 is base level)*)

val set_audio_stream_pan : AudioStream.t -> float -> unit
(** [set_audio_stream_pan stream pan] Set pan for audio stream (0.5 is centered)*)

val set_audio_stream_buffer_size_default : int -> unit
(** [set_audio_stream_buffer_size_default size] Default size for new audio streams*)
