let width = 800
let height = 450
let position = Raylib.Vector3.create 0.0 0.0 0.0
let max_circles = 64

type circle_wave = {
  position : Raylib.Vector2.t;
  radius : float;
  alpha : float;
  speed : float;
  color : Raylib.Color.t;
}

let colors =
  Raylib.
    [|
      Color.orange;
      Color.red;
      Color.gold;
      Color.lime;
      Color.blue;
      Color.violet;
      Color.brown;
      Color.lightgray;
      Color.pink;
      Color.yellow;
      Color.green;
      Color.skyblue;
      Color.purple;
      Color.beige;
    |]

let random_circle () =
  Raylib.(
    let radius = get_random_value 10 40 in
    {
      alpha = 0.0;
      radius = Float.of_int radius;
      position =
        Vector2.create
          (Float.of_int (get_random_value radius (width - radius)))
          (Float.of_int (get_random_value radius (height - radius)));
      speed = Float.of_int (get_random_value 1 100) /. 2000.0;
      color = colors.(get_random_value 0 13);
    })

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlags.Msaa_4x_hint ];
  init_window width height "raylib [audio] example - module playing (streaming)";
  init_audio_device ();

  let circles = Array.init max_circles (fun _ -> random_circle ()) in

  let music = load_music_stream "resources/mini1111.xm" in
  play_music_stream music;

  set_target_fps 60;
  (circles, music)

let rec loop circles music pause =
  match Raylib.window_should_close () with
  | true ->
      let open Raylib in
      unload_music_stream music;
      close_audio_device ();
      close_window ()
  | false ->
      let open Raylib in
      update_music_stream music;

      if is_key_pressed Key.Space then (
        stop_music_stream music;
        play_music_stream music);

      let pause =
        if is_key_pressed Key.P then (
          let pause = not pause in
          if pause then pause_music_stream music else resume_music_stream music;
          pause)
        else pause
      in

      let time_played =
        get_music_time_played music
        /. get_music_time_length music
        *. Float.of_int (width - 40)
      in

      if not pause then
        (Array.iteri (fun i circle ->
             let radius = circle.radius +. (circle.speed *. 10.0) in
             let alpha, speed =
               if circle.alpha +. circle.speed > 1.0 then
                 (circle.alpha, circle.speed *. -1.0)
               else (circle.alpha +. circle.speed, circle.speed)
             in

             circles.(i) <-
               (if alpha <= 0.0 then random_circle ()
               else { circle with alpha; speed; radius })))
          circles;
      begin_drawing ();

      clear_background Color.raywhite;

      Array.iter
        (fun circle ->
          draw_circle_v circle.position circle.radius
            (fade circle.color circle.alpha))
        circles;

      draw_rectangle 20 (height - 20 - 12) (width - 40) 12 Color.lightgray;
      draw_rectangle 20
        (height - 20 - 12)
        (Int.of_float time_played) 12 Color.maroon;
      draw_rectangle_lines 20 (height - 20 - 12) (width - 40) 12 Color.gray;

      end_drawing ();
      loop circles music pause

let () =
  let circles, music = setup () in
  loop circles music false
