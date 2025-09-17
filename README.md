![logo](images/logo.png)

# raylib-ocaml

OCaml bindings for <a href="https://www.raylib.com/" target="_blank">raylib</a> (5.0.0), a simple and easy-to-use library to enjoy videogames programming.

The documentation can be viewed [online](https://tjammer.github.io/raylib-ocaml/raylib/Raylib/index.html).

The bindings are pretty faithful to the original C code, the biggest difference is the conversion of all function names from CamelCase to snake_case.
Wherever possible, integer arguments are changed to their own variant types, eg. `int key` to `Key.t`.

Bindings exist for (nearly) all functions and types, but only a subset are tested thus far (see examples folder). Contributions are welcome.

## Example

``` ocaml
let setup () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let rec loop () =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let open Raylib in
    begin_drawing ();
    clear_background Color.raywhite;
    draw_text "Congrats! You created your first window!" 190 200 20
      Color.lightgray;
    end_drawing ();
    loop ()

let () = setup () |> loop
```
More examples can be found in the examples folder.

Although the original raylib is written in C, most functions take their arguments by value, which maps nicely to a functional language like OCaml. In the few cases where pointers are needed for arrays (mainly the 3D part of raylib), raylib-ocaml tries to use the `CArray` type of ctypes, which it also re-exports in the main `Raylib` module.

## Installation

During the build of raylib-ocaml, the raylib C library is built from source, therefore its dependencies must be installed (<a href="https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux" target="_blank">details here</a>).
For some distros, depexts exist (feel free to contribute depexts for missing distros) to automatically install these dependencies:

``` sh
opam depext raylib
```

raylib-ocaml can be installed via `opam`:

``` sh
opam install raylib
```

## Examples
To build the examples, make sure the raylib C submodule is available with `git
submodule update --init --recursive`, and that all needed dependencies are
installed.

``` sh
opam install . --deps-only
```

Finally, simply
``` sh
dune build
```
inside this repo. The binaries can then be found in `_build/default/examples`.

## Raygui
In addition to raylib, there are bindings to <a href="https://github.com/raysan5/raygui" target="_blank">raygui</a>, an immediate mode gui library which complements raylib.
The documentation of the raygui bindings can be viewed [online](https://tjammer.github.io/raylib-ocaml/raygui/Raygui/index.html) as well.
As with the raylib bindings, the bindings stick close to the C source.
An exception to this are the `*_style` functions, which take a polymorphic variant.
An example can be found in `examples/gui`.

![gui_example](images/raygui.gif)

## TODO
* Split the library into components (core, sound, 3D, VR etc) for a smaller memory footprint
