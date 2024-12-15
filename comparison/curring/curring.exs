#!/usr/bin/env elixir

# Elixir does not natively support currying,
# but you can share currying and functionality using functions.

defmodule Multiply do
  # multiply function definition
  def multiply(x) do
    fn y ->
      fn z ->
        x * y * z
      end
    end
  end

  # main function
  def main do
    step1 = multiply(2)
    IO.puts(step1.(3).(4))

    step2 = step1.(3)
    IO.puts(step2.(4))

    step3 = step2.(4)
    IO.puts(step3)
  end
end

Multiply.main()
