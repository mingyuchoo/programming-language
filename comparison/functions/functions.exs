#!/usr/bin/env elixir

# Explicit function definition
defmodule Functions do
  def f1(x) do
    case x do
      {:ok, val} -> val
      :error -> 0
    end
  end
end

# Lambda expression
f2 = fn x ->
  case x do
    {:ok, val} -> val
    :error -> 0
  end
end

# Point-free style
f3 = fn
  {:ok, val} -> val
  :error -> 0
end

{:ok, 10}
|> Functions.f1()
|> Integer.to_string()
|> IO.puts()

{:ok, 10}
|> f2.()
|> Integer.to_string()
|> IO.puts()

{:ok, 10}
|> f3.()
|> Integer.to_string()
|> IO.puts()
