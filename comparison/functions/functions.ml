#!/usr/bin/env ocaml

(* Explit function definition *)
let f1 x =
  match x with
  | Some x -> x
  | None -> 0
;;

(* Lambda expression *)
let f2 = fun x ->
  match x with
  | Some x -> x
  | None -> 0
;;

(* Opint-free style using`function` keyword *)
let f3 = function
  | Some x -> x
  | None -> 0
;;

(* Apply *)
let () =
  Some 10
  |> f1
  |> string_of_int
  |> print_endline
  ;
  Some 10
  |> f2
  |> string_of_int
  |> print_endline
  ;
  Some 10
  |> f3
  |> string_of_int
  |> print_endline
;;
