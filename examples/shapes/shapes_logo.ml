let width = 800
let height = 450
let color = Raylib.Color.create 239 122 8 255

let setup () =
  let open Raylib in
  init_window width height "raylib [shapes] example - raylib logo using shapes";
  set_target_fps 60;
  ()

let rec loop () =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_rectangle
        ((width / 2) - 128)
        ((height / 2) - 128)
        256 256 Color.black;
      draw_rectangle
        ((width / 2) - 112)
        ((height / 2) - 112)
        224 224 Color.raywhite;
      draw_text "raylib" ((width / 2) - 44) ((height / 2) + 48) 50 Color.black;
      draw_text "OCaml" ((width / 2) - 99) ((height / 2) + 18) 50 color;

      draw_text "this is NOT a texture!" 350 370 10 Color.gray;

      end_drawing ();

      loop ()

let () = setup () |> loop
