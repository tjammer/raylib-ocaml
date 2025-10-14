1.5.1 (2025-10-14)
------------------

* Fix constness of ptr argument to `GuiListViewEx`
* Distingish msys and other mingw environments

1.5.0 (2025-10-08)
------------------

* Upgrade dependency patch to 3.0.0
* Correctly set `glyph_count` in `Font.set_glyphs`
* Export `Raylib_c` module
* Upgrade to raylib 5.5

1.4.0 (2024-12-20)
------------------

* Fix buffer handling of raygui text boxes (#46)
* Port 7 new examples (thank you @gpetiot)
* Fix documentation of raygui list view functions (#56)
* Enable FLAC format by default (#57)
* Use dune 3 and its new `ctypes` stanza (#53)

1.3.1 (2024-09-24)
------------------

* Work around patching on windows with powershell

1.3.0 (2024-05-21)
------------------

* Enable jpg and bmp image formats by default
* Fix raygui build for gcc14

1.2.1 (2024-01-12)
------------------

* Fix FreeBSD build

1.2.0 (2024-01-11)
------------------

* Upgrade raylib to 5.0.0
* Make Raylib.Matrix.t usable with Rlgl

1.1.0 (2023-07-16)
------------------

* Add ctor for Texture struct
* Fix return type of get_char_pressed

1.0.0 (2023-03-24) 
------------------

* Upgrade raylib to 4.5.0

0.6.0 (2023-01-10)
------------------

* Support OCaml 5
* Upgrade raylib to 4.2.0

0.5.1 (2022-01-22)
------------------

* Support "elf" system variable

0.5.0 (2022-01-20)
------------------

* Expose ctypes type value
* Expose audio-related fields
* Add rlgl bindings (module Raylib.Rlgl)
* Upgrade raylib to 4.0

0.4.0 (2021-07-07)
------------------

* Upgrade raylib to 3.7.0

0.3.2 (2021-06-01)
------------------

* Fix Makefile patch for windows

0.3.1 (2021-05-12)
------------------

* Use conf packages instead of depexts for raylib
* Fix raygui version

0.3 (2021-05-05)
----------------

* Update bindings to raylib 3.5
* Add WIP raygui bindings
* Add bindings for working with models
* Fix / Make more conveniant 3D and rlgl part
* Update dune and ocamlformat to recent versions

