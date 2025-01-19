#!/usr/bin/env rust-script

fn main() {
    lazy_evaluation_example();
}

fn lazy_evaluation_example() {
    // 지연 평가를 위한 클로저 정의
    let expensive_computation = || {
        println!("Performing expensive computation...");
        2 + 3 // 실제 연산
    };

    // 클로저 호출 시점까지 평가를 지연함
    println!("Before calling the closure");
    let result = expensive_computation(); // 여기서야 비로소 평가됨
    println!("After calling the closure, result: {}", result);
}
