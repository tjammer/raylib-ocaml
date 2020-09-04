(lang dune 2.6)
(name raylib)
(version 0.2.0)

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
