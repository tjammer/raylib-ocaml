(* There is no error handling at all in this file. This is fine. If anything
   goes wrong with opening the file or patching, we want the execution to fail.
   There is no straying from the happy path. *)

open In_channel

let patch file =
  with_open_bin file (fun ic ->
      let s = really_input_string ic (in_channel_length ic) |> Option.get in

      let patch = Patch.parse s |> List.hd in
      let target =
        match patch.operation with
        | Edit (a, _) -> String.trim a
        | _ -> failwith "We only do edits"
      in
      print_endline target;
      with_open_bin target
        Out_channel.(
          fun ic ->
            really_input_string ic (in_channel_length ic) |> fun input ->
            print_endline ("patching " ^ target);

            Patch.patch input patch |> Option.get |> fun output ->
            with_open_bin target (fun oc ->
                output_string oc output;
                flush oc)))

let () = patch (Array.get Sys.argv 1)
