let width = 800

let height = 450

let max_bunnies = 50000

let max_batch_elements = 8192

type vec2 = { x : float; y : float }

type bunny = { position : vec2; speed : vec2; color : Raylib.Color.t }

let setup () =
  let open Raylib in
  init_window width height "raylib [textures] example - bunnymark";
  let tex_bunny = load_texture "resources/wabbit_alpha.png" in
  set_target_fps 60;
  tex_bunny

let rec loop bunnies bunnies_count tex_bunny =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let bunnies, bunnies_count =
        if is_mouse_button_down MouseButton.Left then
          let rec inner bunnies bunnies_count = function
            | 0 -> (bunnies, bunnies_count)
            | i ->
                if bunnies_count < max_bunnies then
                  inner
                    ( (let pos = get_mouse_position () in
                       {
                         position = { x = Vector2.x pos; y = Vector2.y pos };
                         speed =
                           {
                             x =
                               Float.of_int (get_random_value (-250) 250)
                               /. 60.0;
                             y =
                               Float.of_int (get_random_value (-250) 250)
                               /. 60.0;
                           };
                         color =
                           Color.create (get_random_value 50 240)
                             (get_random_value 80 240)
                             (get_random_value 100 240) 255;
                       })
                    :: bunnies )
                    (bunnies_count + 1) (i - 1)
                else (bunnies, bunnies_count)
          in
          let new_bunnies, bunnies_count = inner [] bunnies_count 100 in
          (Array.append bunnies (Array.of_list new_bunnies), bunnies_count)
        else (bunnies, bunnies_count)
      in

      let tex_width = Float.of_int (Texture.width tex_bunny) in
      let tex_height = Float.of_int (Texture.height tex_bunny) in
      let bunnies =
        Array.map
          (fun b ->
            let position =
              { x = b.position.x +. b.speed.x; y = b.position.y +. b.speed.y }
            in

            let speed =
              if
                position.x +. (tex_width /. 2.0) > Float.of_int width
                || position.y +. (tex_width /. 2.0) < 0.0
              then { b.speed with x = b.speed.x *. -1.0 }
              else b.speed
            in
            let speed =
              if
                position.y +. (tex_height /. 2.0) > Float.of_int height
                || position.y +. (tex_height /. 2.0) < 0.0
              then { speed with y = speed.y *. -1.0 }
              else speed
            in
            { b with position; speed })
          bunnies
      in
      begin_drawing ();
      clear_background Color.raywhite;

      Array.iter
        (fun b ->
          draw_texture tex_bunny
            (Int.of_float b.position.x)
            (Int.of_float b.position.y)
            b.color)
        bunnies;

      draw_rectangle 0 0 width 40 Color.black;
      draw_text
        (Printf.sprintf "bunnies: %i" bunnies_count)
        120 10 20 Color.green;
      draw_text
        (Printf.sprintf "batched draw calls: %i"
           (1 + (bunnies_count / max_batch_elements)))
        320 10 20 Color.maroon;

      draw_fps 10 10;

      end_drawing ();
      loop bunnies bunnies_count tex_bunny

let () = setup () |> loop [||] 0
