let width = 800
let height = 450
let max_bunnies = 50000
let max_batch_elements = 8192

type bunny = {
  position : Raylib.Vector2.t;
  speed : Raylib.Vector2.t;
  color : Raylib.Color.t;
}

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
                    ({
                       position = get_mouse_position ();
                       speed =
                         Vector2.create
                           (Float.of_int (get_random_value (-250) 250) /. 60.0)
                           (Float.of_int (get_random_value (-250) 250) /. 60.0);
                       color =
                         Color.create (get_random_value 50 240)
                           (get_random_value 80 240) (get_random_value 100 240)
                           255;
                     }
                    :: bunnies)
                    (bunnies_count + 1) (i - 1)
                else (bunnies, bunnies_count)
          in
          let new_bunnies, bunnies_count = inner [] bunnies_count 100 in
          (Array.append bunnies (Array.of_list new_bunnies), bunnies_count)
        else (bunnies, bunnies_count)
      in

      let module V = Vector2 in
      (* use Vector2.t as mutable *)
      Array.iter
        (fun b ->
          V.(set_x b.position (x b.position +. x b.speed));
          V.(set_y b.position (y b.position +. y b.speed));
          (if
             V.x b.position +. (Float.of_int (Texture.width tex_bunny) /. 2.0)
             > Float.of_int (get_screen_width ())
             || V.x b.position +. (Float.of_int (Texture.width tex_bunny) /. 2.0)
                < 0.0
           then V.(set_x b.speed (x b.speed *. -1.0)));
          if
            V.y b.position +. (Float.of_int (Texture.height tex_bunny) /. 2.0)
            > Float.of_int (get_screen_height ())
            || V.y b.position +. (Float.of_int (Texture.width tex_bunny) /. 2.0)
               < 0.0
          then V.(set_y b.speed (y b.speed *. -1.0)))
        bunnies;
      begin_drawing ();
      clear_background Color.raywhite;

      Array.iter
        (fun b ->
          draw_texture tex_bunny
            (Int.of_float (Vector2.x b.position))
            (Int.of_float (Vector2.y b.position))
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
