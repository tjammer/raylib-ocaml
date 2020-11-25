let width = 800

let height = 450

let setup () =
  let open Raylib in
  init_window width height "raylib [audio] example - Multichannel sound playing";
  init_audio_device ();

  let fx_wav = load_sound "resources/sound.wav" in
  let fx_ogg = load_sound "resources/target.ogg" in

  set_sound_volume fx_wav 0.2;

  set_target_fps 60;
  (fx_wav, fx_ogg)

let rec loop fx_wav fx_ogg =
  let open Raylib in
  match window_should_close () with
  | true ->
      stop_sound_multi ();
      unload_sound fx_wav;
      unload_sound fx_ogg;
      close_window ()
  | false ->
      if is_key_pressed Key.Enter then play_sound_multi fx_wav;
      if is_key_pressed Key.Space then play_sound_multi fx_ogg;

      begin_drawing ();

      clear_background Color.raywhite;

      draw_text "MULTICHANNEL SOUND PLAYING" 20 20 20 Color.gray;
      draw_text "Press SPACE to play new ogg instance!" 200 120 20
        Color.lightgray;
      draw_text "Press ENTER to play new wav instance!" 200 180 20
        Color.lightgray;

      draw_text
        (Printf.sprintf "CONCURRENT SOUNDS PLAYING: %02i"
           (get_sounds_playing ()))
        220 280 20 Color.red;

      end_drawing ();
      loop fx_wav fx_ogg

let () =
  let fx_wav, fx_ogg = setup () in
  loop fx_wav fx_ogg
