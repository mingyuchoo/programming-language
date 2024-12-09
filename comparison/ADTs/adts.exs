#!/usr/bin/env elixir

# ##########################################
# Sum Type (Union type) vs. Product Type
# - Sum Type: :ok | :error
# - Product Type:  tuples
# ##########################################

defmodule ADTs do
  # Sum Type
  def process(n) when n > 0, do: {:ok, "Positive number"}
  def process(_), do: {:error, "Non-positive number"}

  # Product Type
  def move({x, y}), do: {x + 1, y + 1}
end

IO.inspect(ADTs.process(10))
IO.inspect(ADTs.move({2, 3}))
