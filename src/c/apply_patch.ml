(* There is no error handling at all in this file. This is fine. If anything
   goes wrong with opening the file or patching, we want the execution to fail.
   There is no straying from the happy path. *)

let patch file =
  let patch_ic = open_in_bin file in
  let s = really_input_string patch_ic (in_channel_length patch_ic) in
  close_in patch_ic;

  let patch = Patch.parse s |> List.hd in
  let target =
    match patch.operation with
    | Edit (a, _) -> String.trim a
    | _ -> failwith "We only do edits"
  in
  print_endline target;
  let input_ic = open_in_bin target in
  let input = really_input_string input_ic (in_channel_length input_ic) in
  close_in input_ic;

  print_endline ("patching " ^ target);

  let output =
    match Patch.patch (Some input) patch with
    | Some output -> output
    | None -> failwith "Patch does not apply"
  in
  let oc = open_out_bin target in
  output_string oc output;
  flush oc;
  close_out oc

let () = patch (Array.get Sys.argv 1)
