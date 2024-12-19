module C = Configurator.V1

let rec link ?(flag = "-l") = function
  | [] -> []
  | lib :: libs -> "-cclib" :: (flag ^ " " ^ lib) :: link ~flag libs

let () =
  C.main ~name:"raylib" (fun c ->
      let library_flags =
        match C.ocaml_config_var c "system" with
        | Some ("linux" | "linux_elf" | "elf") ->
            link [ "GL"; "m"; "pthread"; "dl"; "rt"; "X11" ]
        | Some "macosx" ->
            link ~flag:"-framework"
              [ "OpenGL"; "Cocoa"; "IOKit"; "CoreAudio"; "CoreVideo" ]
        | Some "mingw64" -> link [ "opengl32"; "gdi32"; "winmm"; "pthread" ]
        | Some ("netbsd" | "freebsd" | "openbsd" | "bsd" | "bsd_elf") ->
            "-cclib" :: "-L /usr/local/lib"
            :: link
                 [
                   "GL";
                   "pthread";
                   "m";
                   "X11";
                   "Xrandr";
                   "Xinerama";
                   "Xi";
                   "Xxf86vm";
                   "Xcursor";
                 ]
        | Some system -> C.die "unsupported system: %s" system
        | None -> C.die "unsupported system"
      in

      C.Flags.write_sexp "library_flags.sexp" library_flags)
