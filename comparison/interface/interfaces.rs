#!/usr/bin/env rust-script

//! 영어 순서: a Subject -> Verbs -> Objects
//! Rust 설계 순서: a Subject -> Verbs -> Objects
//! Rust 구현 순서: Objects -> Verbs -> a Subject

// ////////////////////////////////////
// a Subject
// ////////////////////////////////////
fn main() {
    let dog = Dog;
    let cat = Cat;

    feed_pet1(&dog);
    feed_pet1(&cat);

    feed_pet2(&dog);
    feed_pet2(&cat);

    walk_the_pet1(&dog);
    walk_the_pet1(&cat);

    walk_the_pet2(&dog);
    walk_the_pet2(&cat);
}

// ////////////////////////////////////
// Verbs
// ////////////////////////////////////

// 라이브러리 개발 -> 제네릭 사용
fn feed_pet1<T: Pet>(pet: &T) {
    pet.eat();
}

// 응용 프로그램 코드 -> impl Trait 문법 사용
fn feed_pet2(pet: &impl Pet) {
    pet.eat();
}

// 라이브러리 개발 -> 제네릭 사용
fn walk_the_pet1<T: Pet>(pet: &T) {
    pet.make_sound();
}

// 응용 프로그램 코드 -> impl Trait 문법 사용
fn walk_the_pet2(pet: &impl Pet) {
    pet.make_sound();
}

// ////////////////////////////////////
// Objects
// ////////////////////////////////////
struct Dog;
struct Cat;

trait Pet {
    fn eat(&self);
    fn make_sound(&self);
}

impl Pet for Dog {
    fn eat(&self) {
        println!("The dog is eating.");
    }

    fn make_sound(&self) {
        println!("Woof! Woof!");
    }
}

impl Pet for Cat {
    fn eat(&self) {
        println!("The cat is eating.");
    }

    fn make_sound(&self) {
        println!("Meow! Meow!");
    }
}
