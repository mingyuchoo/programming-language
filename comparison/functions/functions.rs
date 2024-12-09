#!/usr/bin/env rust-script

fn main() {
    println!("{}", f1(Some(100))); // Explicit function definition

    // Lambda expression (using closures)
    // : Lambda can NOT define global scope
    let f2 = |x: Option<i32>| match x {
        | Some(value) => value,
        | None => 0,
    };
    println!("{}", f2(Some(100))); // Lambda expression

    // Point-free style equivalent (using closures directly)
    // : Lambda can NOT define global scope
    let f3: fn(Option<i32>) -> i32 = |x| match x {
        | Some(value) => value,
        | None => 0,
    };
    println!("{}", f3(Some(100))); // Point-free style equivalent
}

// Explicit function definition
fn f1(x: Option<i32>) -> i32 {
    match x {
        | Some(value) => value,
        | None => 0,
    }
}
