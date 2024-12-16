#!/usr/bin/env rust-script

// Divide function (returns Result)
fn divide(
    x: i32,
    y: i32,
) -> Result<i32, String> {
    match y {
        | 0 => Err("Division by zero".to_string()),
        | _ => Ok(x / y),
    }
}

// Add one function (returns Result)
fn add_one(x: i32) -> Result<i32, String> {
    Ok(x + 1)
}

// Multiply by two function (returns normal i32)
fn multiply_by_two(x: i32) -> Result<i32, String> {
    Ok(x * 2)
}

// Print function for Result
fn print_result(result: Result<i32, String>) -> () {
    match result {
        | Err(e) => println!("Error: {}", e),
        | Ok(v) => println!("Result: {}", v),
    }
}

// Main function
fn main() -> () {
    // First operation chain
    let result = divide(100, 2)
        .and_then(|v| add_one(v))          // bind operation
        .and_then(|v| multiply_by_two(v)); // bind operation

    print_result(result);

    // Second operation chain (error case)
    let result = divide(100, 0)
        .and_then(|v| add_one(v))          // bind operation
        .and_then(|v| multiply_by_two(v)); // bind operation

    print_result(result);
}
