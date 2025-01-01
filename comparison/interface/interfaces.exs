#!/usr/bin/env elixir

# #####################################
# 영어 순서: a Subject -> Verbs -> Objects
# Elixir 설계 순서: a Subject -> Verbs -> Objects
# Elixir 구현 순서: Objects -> Verbs -> a Subject
# #####################################

# ###################################
# Objects
# ###################################
defmodule Pet do
  @callback eat() :: :ok
  @callback make_sound() :: :ok
end

defmodule Dog do
  @behaviour Pet

  def eat do
    IO.puts("The dog is eating.")
  end

  def make_sound do
    IO.puts("Woof! Woof!")
  end
end

defmodule Cat do
  @behaviour Pet

  def eat do
    IO.puts("The cat is eating.")
  end

  def make_sound do
    IO.puts("Meow! Meow!")
  end
end

defmodule Main do
  # ###################################
  # Verbs
  # ###################################
  def feed_pet(pet) when is_atom(pet) and pet in [Dog, Cat] do
    pet.eat()
  end

  def walk_the_pet(pet) when is_atom(pet) and pet in [Dog, Cat] do
    pet.make_sound()
  end

  # ###################################
  # a Subject
  # ###################################
  def main do
    dog = Dog
    cat = Cat

    feed_pet(dog)
    feed_pet(cat)
    walk_the_pet(dog)
    walk_the_pet(cat)
  end
end

# Apply
Main.main()
