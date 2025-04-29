#Concatenar dos listas recursivamente

defmodule Concat do
  def main(list1, list2) do
    concat(list1, list2)
  end

  def concat([], l2), do: l2

  def concat([h | t], l2) do
    [h | concat(t, l2)]
  end
end

Concat.main([1,2,3], [4,5,6]) |> IO.inspect()
