#!/usr/bin/env rust-script

fn main() {
    strict_evaluation_example();
}

fn strict_evaluation_example() {
    let x = 2;
    let y = 3;
    let result = x + y; // 즉시 평가됨
    println!("Result: {}", result);
}
