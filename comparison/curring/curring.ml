#!/usr/bin/env ocaml

(* multiply function definition *)
let multiply x y z = x * y * z

(* main function *)
let () =
  (* case 1 *)
  let step1 = multiply 2 in
  let step2 = step1 3 in
  let step3 = step2 4 in
  Printf.printf "%d\n" step3;
  (* case 2 *)
  let result = ((multiply 2) 3) 4 in
  Printf.printf "%d\n" result;
  (* case 3 *)
  2
  |> multiply
  |> fun f -> f 3 |> fun f -> f 4 |> string_of_int |> print_endline
