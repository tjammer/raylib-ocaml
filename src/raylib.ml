open Ctypes
include Raylib_c_function_descriptions.Description
          (Raylib_c.Raylib_c_generated_functions)

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
