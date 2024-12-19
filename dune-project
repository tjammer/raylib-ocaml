(lang dune 3.17)
(using ctypes 0.3)

(name raylib)

; cannot specify conditional deps otherwise
(generate_opam_files false)

(source (github tjammer/raylib-ocaml))
(license MIT)
(authors "Tobias Mock")
(maintainers "tobiasjammer@gmail.com")

(package
 (name raylib)
 (version 1.3.1)
 (description "OCaml bindings for raylib")
 (synopsis "OCaml bindings for raylib")
 (depends
  (dune (>= 3.17))
   dune-configurator
  (ctypes (>= 0.14))
  (integers (>= 0.5))
  (patch (>= 2.0))))

(package
 (name raygui)
 (version 1.3.1)
 (description "OCaml bindings for raygui")
 (synopsis "OCaml bindings for raygui")
 (depends
  (dune (>= 3.17))
   dune-configurator
  (ctypes (>= 0.14))
  (raylib (>= 0.6))
  (patch (>= 2.0))))

(package
 (name raylib-gen)
 (version 0.1.0)
 (description "Binding generation for raylib")
 (synopsis "Binding generation for raylib")
 (depends
   (dune (>= 3.17))
   yojson
   re))
