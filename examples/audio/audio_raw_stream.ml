open Raylib

let width = 800.
let max_samples = 512
let frequency = ref 440.0
let audio_frequency = ref 440.0
let data = Array.make max_samples 0.0
let sine_idx = ref 0.0

let audio_input_callback buf (frames : Unsigned.uint) =
  audio_frequency := !frequency +. ((!audio_frequency -. !frequency) *. 0.95);

  let incr = !audio_frequency /. 44100.0 in
  let shortbuf = Ctypes.(coerce (ptr void) (ptr short) buf) in
  let iframes = Unsigned.UInt.to_int frames in
  let d = Ctypes.CArray.from_ptr shortbuf iframes in
  for i = 0 to iframes - 1 do
    Ctypes.CArray.set d i
      (int_of_float (23000.0 *. sin (2.0 *. Float.pi *. !sine_idx)));
    sine_idx := !sine_idx +. incr;
    if Float.compare !sine_idx 1.0 > 0 then sine_idx := !sine_idx -. 1.0
  done;
  ()

let setup () =
  init_window (int_of_float width) 450
    "raylib [audio] example - raw audio streaming";
  init_audio_device ();
  set_audio_stream_buffer_size_default 4096;
  let stream = load_audio_stream 44100 16 1 in
  Raylib_callbacks.set_audio_stream_callback stream audio_input_callback;
  play_audio_stream stream;
  set_target_fps 30;
  (stream, 1.0)

let rec run (stream, old_frequency) =
  if window_should_close () then (
    unload_audio_stream stream;
    close_audio_device ();
    close_window ())
  else
    let mouse_pos = get_mouse_position () in

    if is_mouse_button_down MouseButton.Left then (
      let fp = Vector2.y mouse_pos in
      let pan = Vector2.x mouse_pos /. width in
      set_audio_stream_pan stream pan;
      frequency := 40.0 +. fp);

    if !frequency <> old_frequency then (
      let wavelength = 22050.0 /. !frequency |> int_of_float in
      let wavelength =
        if wavelength > max_samples / 2 then max_samples / 2
        else if wavelength < 1 then 1
        else wavelength
      in

      (* write sine wave *)
      for i = 0 to (wavelength * 2) - 1 do
        let value =
          sin Float.(pi *. 2.0 *. of_int i /. of_int wavelength) *. 32000.0
        in
        Array.set data i value
      done;
      for j = wavelength * 2 to max_samples - 1 do
        Array.set data j 0.0
      done);

    begin_drawing ();
    clear_background Color.raywhite;
    draw_text
      (Format.sprintf "sine frequency: %i" (int_of_float !frequency))
      (get_screen_width () - 220)
      10 20 Color.red;
    draw_text "click mouse button to change frequency or pan" 10 10 20
      Color.darkgray;

    for i = 0 to int_of_float width - 1 do
      let y =
        250.0
        +. 50.0
           *. Array.get data (i * max_samples / int_of_float width)
           /. 32000.0
      in
      draw_pixel_v (Vector2.create (float_of_int i) y) Color.red
    done;

    end_drawing ();
    run (stream, !frequency)

let () = setup () |> run
