let screen_width = 800
let screen_height = 450

module Screen = struct
  type t = Logo | Title | Gameplay | Ending

  let default = Logo

  let draw = function
    | Logo ->
        Raylib.draw_text "LOGO SCREEN" 20 20 40 Raylib.Color.lightgray;
        Raylib.draw_text "WAIT for 2 SECONDS..." 290 220 20 Raylib.Color.gray
    | Title ->
        Raylib.draw_rectangle 0 0 screen_width screen_height Raylib.Color.green;
        Raylib.draw_text "TITLE SCREEN" 20 20 40 Raylib.Color.darkgreen;
        Raylib.draw_text "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN" 120 220
          20 Raylib.Color.darkgreen
    | Gameplay ->
        Raylib.draw_rectangle 0 0 screen_width screen_height Raylib.Color.purple;
        Raylib.draw_text "GAMEPLAY SCREEN" 20 20 40 Raylib.Color.maroon;
        Raylib.draw_text "PRESS ENTER or TAP to JUMP to ENDING SCREEN" 130 220
          20 Raylib.Color.maroon
    | Ending ->
        Raylib.draw_rectangle 0 0 screen_width screen_height Raylib.Color.blue;
        Raylib.draw_text "ENDING SCREEN" 20 20 40 Raylib.Color.darkblue;
        Raylib.draw_text "PRESS ENTER or TAP to RETURN to TITLE SCREEN" 120 220
          20 Raylib.Color.darkblue
end

let setup () =
  Raylib.init_window screen_width screen_height
    "raylib [core] example - basic screen manager";
  Raylib.set_target_fps 60

let rec loop ~frames_counter ~current_screen () =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let current_screen, frames_counter =
      let next =
        Raylib.is_key_pressed Raylib.Key.Enter
        || Raylib.is_gesture_detected Raylib.Gesture.Tap
      in
      match current_screen with
      | Screen.Logo ->
          let frames_counter = frames_counter + 1 in
          let screen =
            (* Wait for 2 seconds (120 frames) before jumping to TITLE screen *)
            if frames_counter > 120 then Screen.Title else current_screen
          in
          (screen, frames_counter)
      | Title -> ((if next then Gameplay else current_screen), frames_counter)
      | Gameplay -> ((if next then Ending else current_screen), frames_counter)
      | Ending -> ((if next then Title else current_screen), frames_counter)
    in
    Raylib.begin_drawing ();
    Raylib.clear_background Raylib.Color.raywhite;
    Screen.draw current_screen;
    Raylib.end_drawing ();
    loop ~frames_counter ~current_screen ()

let () = setup () |> loop ~frames_counter:0 ~current_screen:Screen.default
