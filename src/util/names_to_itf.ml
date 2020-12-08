module Smap = Map.Make (String)

let build_map st =
  let map = Smap.empty in
  let all =
    Re.(
      all
        (compile
           (seq
              [
                group (seq [ str "(*"; rep notnl; str "*)" ]);
                eol;
                rep space;
                str "let ";
                group (rep wordc);
              ]))
        st)
  in
  List.fold_left
    (fun m g -> Smap.add (Re.Group.get g 2) (Re.Group.get g 1) m)
    map all

let add_comments map s =
  Re.replace
    Re.(compile (seq [ bol; rep space; str "val "; group (rep wordc) ]))
    ~f:(fun g ->
      let fname = Re.Group.get g 1 in
      match Smap.find_opt fname map with
      | Some comment -> "\n" ^ comment ^ Re.Group.get g 0
      | None -> Re.Group.get g 0)
    s

let () =
  let ch = open_in Sys.argv.(1) in
  let itf = open_in "src/raylib.mli" in
  let map = really_input_string ch (in_channel_length ch) |> build_map in
  really_input_string itf (in_channel_length itf)
  |> add_comments map |> print_endline
