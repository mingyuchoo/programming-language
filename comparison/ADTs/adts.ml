#!/usr/bin/env ocaml

(*
 * Sum Type (Union Type) vs. Product Type
 * - Sum Type: unions, variants, ...
 * - Product Type: tuples, records, ...
 *)

(* Sume Type *)
type result = Success of string | Failure of string

let process n =
  match n with
  | 0 -> Success "Positive number"
  | _ -> Failure "Non-positive number"

(* Product Type *)
type point = int * int

let move (x, y) = (x + 1, y + 1)

(* main *)
let () =
  match process 10 with
  | Success msg -> print_endline msg
  | Failure msg -> print_endline msg

let () =
  (2, 3)
  |> move
  |> fun (x, y) -> Printf.printf "New position: (%d, %d)\n" x y
