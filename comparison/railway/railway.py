#!/usr/bin/env python
from typing import Union, Callable

# Define the Result type, which can either be an error message or a valid result
Result = Union[str, int]


# Divide function: returns a Result type
def divide(x: int, y: int) -> Result:
    match y:
        case 0:
            return "Division by zero"
        case _:
            return x // y


# Add one function: returns a Result type
def add_one(x: int) -> Result:
    return x + 1


# Multiply by two function: returns a Result type
def multiply_by_two(x: int) -> Result:
    return x * 2


# The >>= operator in ROP is represented by a function chaining utility in Python
def bind(result: Result, func: Callable[[int], Result]) -> Result:
    match result:
        case str():  # Error case
            return result
        case _:
            return func(result)


# Print result function
def print_result(result: Result) -> None:
    match result:
        case str():  # Error case
            print(f"Error: {result}")
        case _:
            print(f"Result: {result}")


# Main function demonstrating ROP
def main():
    result = bind(divide(100, 2), add_one)
    result = bind(result, multiply_by_two)
    print_result(result)

    result = bind(divide(100, 0), add_one)
    result = bind(result, multiply_by_two)
    print_result(result)


if __name__ == "__main__":
    main()
