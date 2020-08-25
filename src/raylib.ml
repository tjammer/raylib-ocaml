include Raylib_functions.Description
          (Raylib_c.Raylib_c_generated_functions)
include Raylib_generated_constants

module Types = Raylib_functions.Types

module Color = struct
  let t = Types.Color.t

  let create r g b a =
    let open Ctypes in
    let color = make t in
    setf color Types.Color.r (Unsigned.UInt8.of_int r);
    setf color Types.Color.g (Unsigned.UInt8.of_int g);
    setf color Types.Color.b (Unsigned.UInt8.of_int b);
    setf color Types.Color.a (Unsigned.UInt8.of_int a);
    color

  (* Some Basic Colors *)
  let lightgray = create 200 200 200 255

  let gray = create 130 130 130 255

  let darkgray = create 80 80 80 255

  let yellow = create 253 249 0 255

  let gold = create 255 203 0 255

  let orange = create 255 161 0 255

  let pink = create 255 109 194 255

  let red = create 230 41 55 255

  let maroon = create 190 33 55 255

  let green = create 0 228 48 255

  let lime = create 0 158 47 255

  let darkgreen = create 0 117 44 255

  let skyblue = create 102 191 255 255

  let blue = create 0 121 241 255

  let darkblue = create 0 82 172 255

  let purple = create 200 122 255 255

  let violet = create 135 60 190 255

  let darkpurple = create 112 31 126 255

  let beige = create 211 176 131 255

  let brown = create 127 106 79 255

  let darkbrown = create 76 63 47 255

  let white = create 255 255 255 255

  let black = create 0 0 0 255

  let blank = create 0 0 0 0

  let magenta = create 255 0 255 255

  let raywhite = create 245 245 245 255
end
