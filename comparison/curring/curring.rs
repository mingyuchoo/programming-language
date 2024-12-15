#!/usr/bin/env rust-script

// Rust does not natively support currying,
// but you can share currying and functionality using *closure*.

fn main() {
    // multiply function definition
    let multiply = |x: i32| move |y: i32| move |z: i32| x * y * z;

    // step 1
    let step1 = multiply(2);
    println!("{}", step1(3)(4));

    // step 2
    let step2 = step1(3);
    println!("{}", step2(4));

    // step 3
    let step3 = step2(4);
    println!("{}", step3);
}
