#!/usr/bin/env ocaml

let apply_twice f x = f (f x)

let () = apply_twice (fun x -> x + 3) 10 |> print_int |> print_newline
