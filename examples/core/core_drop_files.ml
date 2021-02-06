let width = 800
let height = 450

let setup () =
  let open Raylib in
  init_window width height "raylib [core] example - drop files";
  set_target_fps 60

let draw dropped_files =
  let open Raylib in
  begin_drawing ();
  clear_background Color.raywhite;
  let count = List.length dropped_files in
  if count == 0
  then draw_text "Drop your files to this window!" 100 40 20 Color.darkgray
  else
    begin
      draw_text "Dropped files:" 100 40 20 Color.darkgray;
      List.iteri
        (fun i file_name ->
           let fade_fac = if i mod 2 == 0 then 0.5 else 0.3 in
           draw_rectangle 0 (85 + 40 * i) width 40 (fade Color.lightgray fade_fac);
           draw_text file_name 120 (100 + 40 * i) 10 Color.gray)
        dropped_files;
      draw_text "Drop new files..." 100 (110 + 40 * count) 20 Color.darkgray
    end;
  end_drawing ()

let rec loop dropped_files =
  let open Raylib in
  if window_should_close ()
  then close_window ()
  else
    let dropped_files =
      if is_file_dropped ()
      then Ctypes.CArray.to_list (get_dropped_files ())
      else dropped_files
    in
    draw dropped_files;
    loop dropped_files

let () =
  setup ();
  loop []
