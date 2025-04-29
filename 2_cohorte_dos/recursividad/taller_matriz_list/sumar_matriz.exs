defmodule SumarMatriz do
  def sumarMatriz(matriz, acc \\ 0)

  def sumarMatriz([], acc), do: acc

  def sumarMatriz([h | t], acc), do:  sumarMatriz(t, acc + sumarFilas(h))


  def sumarFilas(fila, acc \\ 0)

  def sumarFilas([], acc), do: acc

  def sumarFilas([h | t], acc), do: sumarFilas(t, acc + h)
end

matriz = [
  [3, 3, 3],
  [3, 3, 3],
  [3, 3, 3]
]

SumarMatriz.sumarMatriz(matriz) |> IO.puts()

#3. Sumar todos los elementos de una matriz (lista de listas)
