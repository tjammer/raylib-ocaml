(lang dune 2.8)
(name raylib)
(version 0.2.2)

(generate_opam_files true)

(source (github tjammer/raylib-ocaml))
(license MIT)
(authors "Tobias Mock")
(maintainers "tobiasjammer@gmail.com")

(package
 (name raylib)
 (synopsis "OCaml bindings for raylib")
 (depends
  dune
  dune-configurator
  ctypes
  ppx_cstubs))

(package
 (name raygui)
 (synopsis "OCaml bindings for raygui")
 (depends
  dune
  dune-configurator
  ctypes
  ppx_cstubs
  raylib))
