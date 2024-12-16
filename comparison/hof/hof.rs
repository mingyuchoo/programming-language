#!/usr/bin/env rust-script

fn apply_twice<T>(
    f: T,
    x: i32,
) -> i32
where
    F: Fn(i32) -> i32,
{
    f(f(x))
}

fn main() -> () {
    let result = apply_twice(|x| x + 3, 10);
    println!("{}", result);
}
