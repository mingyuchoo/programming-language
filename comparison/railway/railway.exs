#!/usr/bin/env elixir

defmodule Railway do
  # The >>= operator in ROP is represented by a function chaining utility in Elixir
  def bind({:error, reason}, _func), do: {:error, reason}
  def bind({:ok, value}, func), do: func.(value)

  # divide function
  def divide(x, y) do
    case y do
      0 -> {:error, "Division by zero"}
      _ -> {:ok, div(x, y)}
    end
  end

  # add_one function
  def add_one(x), do: {:ok, x + 1}

  # multiply_by_two function
  def multiply_by_two(x), do: {:ok, x * 2}

  # print_result function
  def print_result({:error, reason}), do: IO.puts("Error: #{reason}")
  def print_result({:ok, value}), do: IO.puts("Result: #{value}")
end

# main
100
|> Railway.divide(2)
|> Railway.bind(&Railway.add_one/1)
|> Railway.bind(&Railway.multiply_by_two/1)
|> Railway.print_result()

100
|> Railway.divide(0)
|> Railway.bind(&Railway.add_one/1)
|> Railway.bind(&Railway.multiply_by_two/1)
|> Railway.print_result()
