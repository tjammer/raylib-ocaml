(lang dune 3.20)

(using ctypes 0.3)

(name raylib)

(generate_opam_files true)

(source
 (github tjammer/raylib-ocaml))

(license MIT)

(authors "Tobias Mock")

(maintainers "tobiasjammer@gmail.com")

(package
 (name raylib)
 (version 1.5.0)
 (description "OCaml bindings for raylib")
 (synopsis "OCaml bindings for raylib")
 (depends
  (ocaml
   (>= 4.08.0))
  (dune
   (>= 3.20))
  dune-configurator
  (ctypes
   (>= 0.14))
  (integers
   (>= 0.5))
  (patch
   (>= 3.0.0))
  (conf-mesa
   (or
    (= :os linux)
    (= :os-family bsd)))
  (conf-libxcursor
   (or
    (= :os linux)
    (= :os-family bsd)))
  (conf-libxi
   (or
    (= :os linux)
    (= :os-family bsd)))
  (conf-libxinerama
   (or
    (= :os linux)
    (= :os-family bsd)))
  (conf-libxrandr
   (or
    (= :os linux)
    (= :os-family bsd)))))

(package
 (name raygui)
 (version 1.5.0)
 (description "OCaml bindings for raygui")
 (synopsis "OCaml bindings for raygui")
 (depends
  (raylib
   (= :version))))

(package
 (name raylib-callbacks)
 (version 1.5.0)
 (description "OCaml bindings for raygui")
 (synopsis "OCaml bindings for raygui")
 (depends
  (ctypes-foreign
   (>= 0.14))
  (raylib
   (= :version))))

(package
 (name raylib-gen)
 (version 0.1.0)
 (description "Binding generation for raylib")
 (synopsis "Binding generation for raylib")
 (depends
  (ocaml
   (>= 4.08.0))
  yojson
  re
  containers))
