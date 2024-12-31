#!/usr/bin/env rust-script

struct MyBox<T> {
    item: T,
}

impl<T> MyBox<T> {
    fn new(item: T) -> Self {
        Self { item }
    }
}

trait Management<T> {
    fn get(&self) -> Result<T, String>;
    fn set(
        &mut self,
        value: T,
    ) -> Result<(), String>;
}

impl<T> Management<T> for MyBox<T>
where
    T: Clone,
{
    fn get(&self) -> Result<T, String> {
        Ok(self
            .item
            .clone())
    }

    fn set(
        &mut self,
        value: T,
    ) -> Result<(), String> {
        self.item = value;
        Ok(())
    }
}

fn main() -> Result<(), String> {
    let mut my_box = MyBox::new(100);

    match my_box.get() {
        | Ok(item) => println!("Item: {}", item),
        | Err(e) => println!("Failed to get item: {}", e),
    }

    match my_box.set(1000) {
        | Ok(_) => println!("Item updated successfully"),
        | Err(e) => println!("Failed to set item: {}", e),
    }

    match my_box.get() {
        | Ok(item) => println!("Item: {}", item),
        | Err(e) => println!("Failed to get item: {}", e),
    }

    Ok(())
}
