module C = Configurator.V1

type target = Linux | Macos | Mingw64 | Msys2 | Bsd | Web

let rec link ?(flag = "-l") = function
  | [] -> []
  | lib :: libs -> "-cclib" :: (flag ^ " " ^ lib) :: link ~flag libs

let rec cclib = function
  | [] -> []
  | flag :: flags -> "-cclib" :: flag :: cclib flags

let target c os_distribution =
  (* We either compile for wasm or native *)
  match C.ocaml_config_var c "target" with
  | Some triple when Str.string_match (Str.regexp "^wasm") triple 0 -> Web
  | _ -> (
      match C.ocaml_config_var c "system" with
      | Some ("linux" | "linux_elf" | "elf") -> Linux
      | Some "macosx" -> Macos
      | Some "mingw64" -> if os_distribution = "msys2" then Msys2 else Mingw64
      | Some ("netbsd" | "freebsd" | "openbsd" | "dragonfly" | "bsd" | "bsd_elf")
        ->
          Bsd
      | Some system -> C.die "unsupported system: %s" system
      | None -> C.die "unsupported system")

let target_name = function
  | Linux -> "linux"
  | Macos -> "macos"
  | Mingw64 -> "mingw64"
  | Msys2 -> "msys2"
  | Bsd -> "bsd"
  | Web -> "web"

let env_default name default = Option.value (Sys.getenv_opt name) ~default

let system_library_flags = function
  | Web -> []
  | Linux -> link [ "GL"; "m"; "pthread"; "dl"; "rt"; "X11" ]
  | Macos ->
      link ~flag:"-framework"
        [ "OpenGL"; "Cocoa"; "IOKit"; "CoreAudio"; "CoreVideo"; "QuartzCore" ]
  | Mingw64 | Msys2 -> link [ "opengl32"; "gdi32"; "winmm"; "pthread" ]
  | Bsd ->
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

let backend_flags c = function
  | "PLATFORM_DESKTOP_SDL" -> (
      match C.Pkg_config.get c with
      | None -> C.die "pkg-config is required for the SDL backend"
      | Some pkg_config -> (
          match C.Pkg_config.query pkg_config ~package:"sdl2" with
          | None ->
              C.die
                "PLATFORM_DESKTOP_SDL was requested, but pkg-config could not \
                 find sdl2"
          | Some { libs; cflags } ->
              ( cclib libs,
                [
                  "EXTRA_INCLUDE_PATHS=" ^ String.concat " " cflags;
                  "SDL_LIBRARIES=" ^ String.concat " " libs;
                ] )))
  | _ -> ([], [])

let () =
  let os_distribution = ref "" in
  C.main ~name:"raylib"
    ~args:
      [
        ("-os-distribution", Arg.Set_string os_distribution, "Host distribution");
      ]
    (fun c ->
      let target = target c !os_distribution in
      let platform =
        env_default "PLATFORM"
          (if target = Web then "PLATFORM_WEB" else "PLATFORM_DESKTOP")
      in
      let backend_library_flags, backend_make_flags =
        backend_flags c platform
      in
      let raylib_flags =
        [
          "PLATFORM=" ^ platform;
          "CC=" ^ env_default "CC" (C.ocaml_config_var_exn c "c_compiler");
        ]
        @ backend_make_flags
      in
      C.Flags.write_sexp "library_flags.sexp"
        (system_library_flags target @ backend_library_flags);
      C.Flags.write_lines "raylib_flags" raylib_flags;
      C.Flags.write_lines "raylib_target" [ target_name target ])
