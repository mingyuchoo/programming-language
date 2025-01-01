#!/usr/bin/env ocaml

(*
 * 영어 순서: a Subject -> Verbs -> Objects
 * OCaml 설계 순서: a Subject -> Verbs -> Objects
 * OCaml 구현 순서: Objects -> Verbs -> a Subject
 *)

(*
 * Objects
 *)
type dog = Dog

type cat = Cat

class type pet = object
  method eat : unit

  method make_sound : unit
end

class dog_pet : pet =
  object
    method eat = print_endline "The dog is eating."

    method make_sound = print_endline "Woof! Woof!"
  end

class cat_pet : pet =
  object
    method eat = print_endline "The cat is eating."

    method make_sound = print_endline "Meow! Meow!"
  end

(*
 * Verbs
 *)
let feed_pet (pet : #pet) = pet#eat

let walk_the_pet (pet : pet) = pet#make_sound

(*
 * a Subject
 *)
let () =
  let dog = new dog_pet in
  let cat = new cat_pet in
  feed_pet dog;
  feed_pet cat;
  walk_the_pet (dog :> pet);
  walk_the_pet (cat :> pet)
