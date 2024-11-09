let screen_width = 800
let screen_height = 450

module Ball = struct
  type t = {
    position : Raylib.Vector2.t;
    speed : Raylib.Vector2.t;
    radius : int;
  }
end

module State = struct
  type t = { ball : Ball.t; pause : bool; frames_counter : int }

  let draw { ball; pause; frames_counter } =
    let open Raylib in
    begin_drawing ();
    clear_background Color.raywhite;
    draw_circle_v ball.position (Float.of_int ball.radius) Color.maroon;

    draw_text "PRESS SPACE to PAUSE BALL MOVEMENT" 10
      (get_screen_height () - 25)
      20 Color.lightgray;

    if pause && mod_float (Float.of_int frames_counter /. 30.) 2. = 0. then
      draw_text "PAUSED" 350 200 30 Color.gray;

    draw_fps 10 10;
    end_drawing ()
end

let setup () =
  let open Raylib in
  set_config_flags [ ConfigFlags.Msaa_4x_hint ];
  init_window screen_width screen_height
    "raylib [shapes] example - bouncing ball";
  let ball =
    let position =
      Vector2.create
        ((Float.of_int @@ get_screen_width ()) /. 2.)
        ((Float.of_int @@ get_screen_height ()) /. 2.)
    in
    let speed = Vector2.create 5. 4. in
    let radius = 20 in
    { Ball.position; speed; radius }
  in
  set_target_fps 60;
  { State.ball; pause = false; frames_counter = 0 }

let rec loop (state : State.t) =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let state =
        if is_key_pressed Key.Space then { state with pause = not state.pause }
        else state
      in
      let state =
        if state.pause then
          { state with frames_counter = state.frames_counter + 1 }
        else
          let { Ball.position; radius; speed } = state.ball in
          let position =
            Vector2.create
              (Vector2.x position +. Vector2.x speed)
              (Vector2.y position +. Vector2.y speed)
          in

          (* Check walls collision for bouncing *)
          let speed_x =
            if
              Vector2.x position >= Float.of_int (get_screen_width () - radius)
              || Vector2.x position <= Float.of_int radius
            then Vector2.x speed *. -1.
            else Vector2.x speed
          in
          let speed_y =
            if
              Vector2.y position >= Float.of_int (get_screen_height () - radius)
              || Vector2.y position <= Float.of_int radius
            then Vector2.y speed *. -1.
            else Vector2.y speed
          in
          let speed = Vector2.create speed_x speed_y in
          let ball = { Ball.position; radius; speed } in
          { state with ball }
      in
      State.draw state;
      loop state

let () = setup () |> loop
