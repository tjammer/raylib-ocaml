let width = 800
let height = 450
let storage_position_score = 0
let storage_position_hiscore = 1

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - storage save/load values";
  (0, 0, 0)

let draw (score, hiscore, frame_counter) =
  let open Raylib in
  begin_drawing ();
  clear_background Color.raywhite;
  draw_text (Printf.sprintf "SCORE: %i" score) 280 130 40 Color.maroon;
  draw_text (Printf.sprintf "HI-SCORE: %i" hiscore) 210 200 50 Color.black;
  draw_text (Printf.sprintf "frames: %i" frame_counter) 10 10 20 Color.lime;

  draw_text "Press R to generate random numbers" 220 40 20 Color.lightgray;
  draw_text "Press ENTER to SAVE values" 250 310 20 Color.lightgray;
  draw_text "Press SPACE to LOAD values" 252 350 20 Color.lightgray;
  end_drawing ();
  (score, hiscore, frame_counter)

let update (score, hiscore, frame_counter) =
  let open Raylib in
  let score, hiscore =
    match
      (is_key_pressed Key.R, is_key_pressed Key.Enter, is_key_pressed Key.Space)
    with
    | true, _, _ -> (get_random_value 1000 2000, get_random_value 2000 4000)
    | _, true, _ ->
        assert (save_storage_value storage_position_score score);
        assert (save_storage_value storage_position_hiscore hiscore);
        (score, hiscore)
    | _, _, true ->
        ( load_storage_value storage_position_score,
          load_storage_value storage_position_hiscore )
    | _, _, _ -> (score, hiscore)
  in
  (score, hiscore, frame_counter + 1)

let rec loop (score, hiscore, frame_counter) =
  let open Raylib in
  if window_should_close () then close_window ()
  else (score, hiscore, frame_counter) |> draw |> update |> loop

let () = setup () |> loop
