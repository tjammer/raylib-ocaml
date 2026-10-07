module C = Configurator.V1

let rec link ?(flag = "-l") = function
  | [] -> []
  | lib :: libs -> "-cclib" :: (flag ^ " " ^ lib) :: link ~flag libs

let rec cclib = function
  | [] -> []
  | flag :: flags -> "-cclib" :: flag :: cclib flags

let () =
  C.main ~name:"raylib" (fun c ->
      let platform =
        match Sys.getenv_opt "PLATFORM" with
        | Some platform -> platform
        | None -> "PLATFORM_DESKTOP"
      in
      let system_library_flags =
        match C.ocaml_config_var c "system" with
        | Some ("linux" | "linux_elf" | "elf") ->
            link [ "GL"; "m"; "pthread"; "dl"; "rt"; "X11" ]
        | Some "macosx" ->
            link ~flag:"-framework"
              [ "OpenGL"; "Cocoa"; "IOKit"; "CoreAudio"; "CoreVideo" ]
        | Some "mingw64" -> link [ "opengl32"; "gdi32"; "winmm"; "pthread" ]
        | Some ("netbsd" | "freebsd" | "openbsd" | "dragonfly" | "bsd" | "bsd_elf") ->
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
      let backend_library_flags, raylib_flags =
        match platform with
        | "PLATFORM_DESKTOP_SDL" -> (
            match C.Pkg_config.get c with
            | None -> C.die "pkg-config is required for the SDL backend"
            | Some pkg_config -> (
                match C.Pkg_config.query pkg_config ~package:"sdl2" with
                | None ->
                    C.die
                      "PLATFORM_DESKTOP_SDL was requested, but pkg-config could \
                       not find sdl2"
                | Some { libs; cflags } ->
                    ( cclib libs,
                      [
                        "CUSTOM_CFLAGS=" ^ String.concat " " cflags;
                        "SDL_LIBRARIES=" ^ String.concat " " libs;
                      ] )))
        | _ -> ([], [])
      in
      C.Flags.write_sexp "library_flags.sexp"
        (system_library_flags @ backend_library_flags);
      C.Flags.write_lines "raylib_flags" raylib_flags)
