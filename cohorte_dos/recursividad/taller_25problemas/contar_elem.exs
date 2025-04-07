defmodule Contar do
  def main(list) do
    count(list)
  end

  def count(list, acc \\ 0)

  def count([], acc), do: acc

  def count([_h | t], acc), do: count(t, acc + 1 )
end

Contar.main([1, 2,3 ,4, 5, 6, 7, 8, 9]) |> IO.puts()
