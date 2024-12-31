#!/usr/bin/env elixir

defmodule MyBox do
  defstruct item: nil

  def new(item) do
    %MyBox{item: item}
  end
end

defmodule Management do
  def get(%MyBox{item: item}) do
    {:ok, item}
  end

  def set(%MyBox{} = box, value) do
    {:ok, %{box | item: value}}
  end
end

defmodule Main do
  def run do
    my_box = MyBox.new(100)

    case Management.get(my_box) do
      {:ok, item} -> IO.puts("Item: #{item}")
      {:error, reason} -> IO.puts("Failed to get item: #{reason}")
    end

    case Management.set(my_box, 1000) do
      {:ok, _updated_box} -> IO.puts("Item updated successfully")
      {:error, reason} -> IO.puts("Failed to set item: #{reason}")
    end

    case Management.get(my_box) do
      {:ok, item} -> IO.puts("Item: #{item}")
      {:error, reason} -> IO.puts("Failed to get item: #{reason}")
    end
  end
end

Main.run()
