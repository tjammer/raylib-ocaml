module Types = Raylib_c_types

module M (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  let init_window =
    foreign "InitWindow" (int @-> int @-> string @-> returning void)

  let window_should_close = foreign "WindowShouldClose" (void @-> returning bool)

  let close_window = foreign "CloseWindow" (void @-> returning void)

  let begin_drawing = foreign "BeginDrawing" (void @-> returning void)

  let end_drawing = foreign "EndDrawing" (void @-> returning void)

  let set_target_fps = foreign "SetTargetFPS" (int @-> returning void)

  let draw_fps = foreign "DrawFPS" (int @-> int @-> returning void)

  module Color = struct
    let t = Types.Color.t

    let create r g b a =
      let color = make t in
      setf color Types.Color.r (Unsigned.UInt8.of_int r);
      setf color Types.Color.g (Unsigned.UInt8.of_int g);
      setf color Types.Color.b (Unsigned.UInt8.of_int b);
      setf color Types.Color.a (Unsigned.UInt8.of_int a);
      color

    let white = create 245 245 245 255

    let lightgray = create 200 200 200 255
  end

  let clear_background = foreign "ClearBackground" (Color.t @-> returning void)

  let draw_text =
    foreign "DrawText"
      (string @-> int @-> int @-> int @-> Color.t @-> returning void)
end
