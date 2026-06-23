(* There is no error handling at all in this file. This is fine. If anything
   goes wrong with opening the file or patching, we want the execution to fail.
   There is no straying from the happy path. *)

let invert_hunk (hunk : Patch.hunk) : Patch.hunk =
  { mine_start = hunk.their_start;
    mine_len = hunk.their_len;
    mine = hunk.their;
    their_start = hunk.mine_start;
    their_len = hunk.mine_len;
    their = hunk.mine }

let invert (patch : Patch.t) : Patch.t =
  { patch with
    hunks = List.map invert_hunk patch.hunks;
    mine_no_nl = patch.their_no_nl;
    their_no_nl = patch.mine_no_nl }

let patch file reverse =
  let patch_ic = open_in_bin file in
  let s = really_input_string patch_ic (in_channel_length patch_ic) in
  close_in patch_ic;

  let patches = Patch.parse ~p:1 s in
  let patches' = if reverse then List.map invert patches else patches in
  List.iter (fun (patch : Patch.t) ->
    let target =
      match patch.operation with
      | Edit (a, _) -> String.trim a
      | _ -> failwith "We only do edits"
    in

    print_endline ((if reverse then "reverse " else "") ^ "patching " ^ target);

    let input_ic = open_in_bin target in
    let input = really_input_string input_ic (in_channel_length input_ic) in
    close_in input_ic;

    let output =
      match Patch.patch ~cleanly:true (Some input) patch with
      | Some output -> output
      | None -> failwith "Patch does not apply"
    in
    let oc = open_out_bin target in
    output_string oc output;
    flush oc;
    close_out oc
  ) patches'

let () = patch Sys.argv.(1) (Array.length Sys.argv > 2 && Sys.argv.(2) = "-r")
