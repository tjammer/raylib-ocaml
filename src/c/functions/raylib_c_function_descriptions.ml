module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  module Types =
    Raylib_c_type_descriptions.Descriptions (Raylib_c_generated_types)

  let init_window =
    foreign "InitWindow" (int @-> int @-> string @-> returning void)

  let window_should_close = foreign "WindowShouldClose" (void @-> returning bool)

  let close_window = foreign "CloseWindow" (void @-> returning void)

  let begin_drawing = foreign "BeginDrawing" (void @-> returning void)

  let end_drawing = foreign "EndDrawing" (void @-> returning void)

  let set_target_fps = foreign "SetTargetFPS" (int @-> returning void)

  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  let clear_background =
    foreign "ClearBackground" (Types.Color.t @-> returning void)

  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Types.Color.t @-> returning void)
end
