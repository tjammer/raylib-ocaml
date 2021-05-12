(lang dune 2.8)
(name raylib)

; cannot specify conditional deps otherwise
(generate_opam_files false)

(source (github tjammer/raylib-ocaml))
(license MIT)
(authors "Tobias Mock")
(maintainers "tobiasjammer@gmail.com")

(package
 (name raylib)
 (version 0.3.0)
 (description "OCaml bindings for raylib")
 (synopsis "OCaml bindings for raylib")
 (depends
  dune
  dune-configurator
  ctypes
  ppx_cstubs))

(package
 (name raygui)
 (version 0.1.0)
 (description "OCaml bindings for raygui")
 (synopsis "OCaml bindings for raygui")
 (depends
  dune
  dune-configurator
  ctypes
  ppx_cstubs
  raylib))
