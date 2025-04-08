defmodule Transposeeeeeee do
  def transponer([]), do: []
  def transponer([[] | _]), do: []

  def transponer(matriz) do
    [Enum.map(matriz, fn [fila | _] -> fila end) |
     transponer(Enum.map(matriz, fn [_ | resto] -> resto end))]
  end
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

Transposeeeeeee.transponer(matriz) |> IO.inspect()
# 4. Transposición de una matriz.
