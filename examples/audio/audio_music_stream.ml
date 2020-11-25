let width = 800

let height = 450

let setup () =
  let open Raylib in
  init_window width height "raylib [audio] example - music playing (streaming)";
  init_audio_device ();

  let music = load_music_stream "resources/country.mp3" in

  play_music_stream music;

  set_target_fps 60;
  music

let rec loop music pause =
  let open Raylib in
  match window_should_close () with
  | true ->
      unload_music_stream music;
      close_audio_device ();
      close_window ()
  | false ->
      update_music_stream music;

      (* Restart music playing (stop and play) *)
      if is_key_pressed Key.Space then (
        stop_music_stream music;
        play_music_stream music );

      let pause =
        if is_key_pressed Key.P then (
          let pause = not pause in
          if pause then pause_music_stream music else resume_music_stream music;
          pause )
        else pause
      in

      let time_played =
        get_music_time_played music /. get_music_time_length music *. 400.0
      in
      if time_played > 400.0 then stop_music_stream music;

      begin_drawing ();

      clear_background Color.raywhite;

      draw_text "MUSIC SHOULD BE PLAYING!" 255 150 20 Color.lightgray;

      draw_rectangle 200 200 400 12 Color.lightgray;
      draw_rectangle 200 200 (Int.of_float time_played) 12 Color.maroon;
      draw_rectangle_lines 200 200 400 12 Color.gray;

      draw_text "PRESS SPACE TO RESTART MUSIC" 215 250 20 Color.lightgray;
      draw_text "PRESS P TO PAUSE/RESUME MUSIC" 208 280 20 Color.lightgray;

      end_drawing ();
      loop music pause

let () =
  let music = setup () in
  loop music false
