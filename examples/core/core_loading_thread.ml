(* Warning: OCaml threads are concurrent but not parallel.
 * It may also not be the best solution for concurency but
 * for the sake of this example it prevent dependencies.
 * However in practice you may want to use something more
 * advanced like JaneStreet Async or Lwt.
*)

type state_t = Waiting | Loading of int | Finished

let setup () =
  Raylib.init_window 800 450 "raylib [core] example - loading thread";
  Raylib.set_target_fps 60

let data_progress = ref 0

let load_data_thread () =
  let rec loop prev_time =
    let time = Raylib.get_time () in
    data_progress := !data_progress + Int.of_float (50.0 *. (time -. prev_time));
    Thread.delay 0.05;
    loop time
  in
  loop (Raylib.get_time ())


let rec loop state =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
    let open Raylib in
    let state =
      match state with
      | Waiting ->
        if is_key_pressed Key.Enter
        then begin
          ignore (Thread.create load_data_thread ());
          Loading 0
        end
        else Waiting
      | Loading frames_counter ->
        if !data_progress >= 500
        then Finished
        else Loading (frames_counter + 1)
      | Finished ->
        if is_key_pressed Key.Enter
        then Waiting
        else Finished
    in
    begin_drawing ();
    clear_background Color.raywhite;
    begin
      match state with
      | Waiting ->
        draw_text "PRESS ENTER to START LOADING DATA" 150 170  20 Color.darkgray
      | Loading frames_counter ->
        draw_rectangle 150 200 !data_progress 60 Color.skyblue;
        if (frames_counter / 15) mod 2 == 1
        then draw_text "LOADING DATA..." 240 210 40 Color.darkblue
        else ()
      | Finished ->
        draw_rectangle 150 200 500 60 Color.lime;
        draw_text "DATA LOADED!" 250 210 40 Color.green;
    end;
    end_drawing ();
    loop state

let () =
  setup ();
  loop Waiting
