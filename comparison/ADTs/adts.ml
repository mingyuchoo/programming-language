#!/usr/bin/env ocaml

(*
 * Sum Type (Union Type) vs. Product Type
 * - Sum Type: unions, variants, ...
 * - Product Type: tuples, records, ...
 *)

(* Sume Type
 * - union
 *)
type result = Success of string | Failure of string

let process n =
  match n with
  | 0 -> Success "Positive number"
  | _ -> Failure "Non-positive number"

let () =
  match process 10 with
  | Success msg -> print_endline msg
  | Failure msg -> print_endline msg

(* Product Type
 * - tuple
 *)
type point = int * int

let move (x, y) = (x + 1, y + 1)

let () =
  (2, 3)
  |> move
  |> fun (x, y) -> Printf.printf "New position: (%d, %d)\n" x y

(* Product Type
 * - record
 *)
type coordinate = { x: float; y: float }

let distance p1 p2 =
  let dx = p2.x -. p1.x in
  let dy = p2.y -. p1.x in
  sqrt ((dx *. dx) +. (dy *. dy))

let point1 = { x= 3.0; y= 4.0 }

let point2 = { x= 0.0; y= 0.0 }

let () =
  let dist = distance point1 point2 in
  match dist with
  | d when d >= 0.0 ->
      Printf.printf "The distance between (%f, %f) and (%f, %f) is %f\n"
        point1.x point1.y point2.x point2.y d
  | _ -> Printf.printf "Distance cannot be negative.\n"
