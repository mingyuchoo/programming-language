#!/usr/bin/env ocaml

(* The bind in ROP is represented by a function chaining utility in OCaml *)
let bind f result =
  match result with
  | Error e -> Error e
  | Ok v -> f v

(* The >>= operator in ROP is represented by a function chaining utility in
   OCaml *)
let ( >>= ) result f =
  match result with
  | Error e -> Error e
  | Ok v -> f v

(**)
let divide x y =
  match y with
  | 0 -> Error "Division by zero"
  | _ -> Ok (x / y)

(**)
let add_one (x : int) = Ok (x + 1)

(**)
let multiply_by_two x = Ok (x * 2)

(* print function for result type *)
let print_result result =
  match result with
  | Error e -> Printf.printf "Error: %s\n" e
  | Ok v -> Printf.printf "Result: %d\n" v

(* main *)
let () = divide 100 2 >>= add_one >>= multiply_by_two |> print_result

let () = divide 100 0 >>= add_one >>= multiply_by_two |> print_result
