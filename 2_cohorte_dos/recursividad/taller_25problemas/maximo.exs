defmodule Maximo do
  def main(list) do
    findMax(list)
  end

  def findMax(list), do: findMaxHelper(list, list |> Enum.at(0))

  def findMaxHelper([], comp), do: comp

  def findMaxHelper([h | t], comp) do
    findMaxHelper(t, max(h, comp))
  end
end

Maximo.main([1, 3, 2, 55, 2]) |> IO.puts()
