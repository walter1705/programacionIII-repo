defmodule Minimo do
  def main(list) do
    minimo(list)
  end

  def minimo([x]), do: x

  def minimo(list) do
    mid = div(length(list), 2)
    {left , right} = Enum.split(list, mid)
    min(minimo(left), minimo(right))
  end
end


Minimo.main([2, 1, 3, 5, 3, 2]) |> IO.inspect()
