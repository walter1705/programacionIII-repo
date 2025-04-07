defmodule Transposeeeeeee do
  def transponer(matriz, new \\ [], i \\ 0, j \\ 0)

  def transponer(matr, new, _i, _j) when length(matr) == length(new), do: new

  def transponer(mat, new, i, j) do
    transponer(mat, List.insert_at(new, -1, fila(mat, i, j)), i, j+1)
  end

  def fila(matr, i, j,fila,  new \\ [])

  def fila(matr, i, j,fila,  new) do
    if i <  fila do
      eleme =
        Enum.at(matr, i)
        |> Enum.at(j)
      fila(matr, i+1, j, List.insert_at(new, -1, eleme))
    else
      new
    end
  end
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

Transposeeeeeee.transponer(matriz) |> IO.inspect()
# 4. Transposición de una matriz.
