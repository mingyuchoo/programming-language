#!/usr/bin/env elixir

defmodule HOF do
  def apply_twice(f, x) do
    f.(f.(x))
  end
end

fn x -> x + 3 end
|> HOF.apply_twice(10)
|> IO.puts()
