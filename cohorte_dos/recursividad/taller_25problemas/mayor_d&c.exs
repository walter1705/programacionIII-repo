defmodule Greater_DandC do
  def main(list) do
    greater(list) |> IO.puts()
  end

  def greater([x]),
    do: x

  def greater(list) do
    mid =  div(length(list), 2)
    {left, right} = list |> Enum.split(mid)
    max(greater(left), greater(right))

  end
end

list = [15, 3, 28, 42, 7, 19, 33, 8, 51, 24, 12, 37, 5, 46, 21, 9, 60, 14, 27, 11, 5]
Enum.max(list) |> IO.puts()
Greater_DandC.main(list)
