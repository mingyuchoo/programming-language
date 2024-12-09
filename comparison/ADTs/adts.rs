#!/usr/bin/env rust-script


// /////////////////////////////////////////
// Sum Type (Union Type) vs. Product Type
// - Sum Type: enums
// - Product Type: tuples, structs
// /////////////////////////////////////////

// Sum Type
enum Result {
    Success(String),
    Failure(String),
}

fn process(n: i32) -> Result {
    match n {
        | n if n > 0 => Result::Success(String::from("Positive number")),
        | _ => Result::Failure(String::from("Non-positive number")),
    }
}

// Product Type
type Point = (i32, i32);

fn move_point(p: Point) -> Point {
    (p.0 + 1, p.1 + 1)
}

// main
fn main() {
    match process(10) {
        | Result::Success(msg) => println!("{}", msg),
        | Result::Failure(msg) => println!("{}", msg),
    }

    let p = (2, 3);
    let new_p = move_point(p);
    println!("New position: ({}, {})", new_p.0, new_p.1);
}
