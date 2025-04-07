defmodule Pares do
  def contarELementosPares(list, contador \\ 0, fun \\ fn x -> rem(x, 2) == 0 end)

  def contarELementosPares([], contador, _fun), do: contador

  def contarELementosPares([h | t], contador, fun) do
    if fun.(h),
      do: contarELementosPares(t, contador + 1, fun),
      else: contarELementosPares(t, contador, fun)
  end
end

Pares.contarELementosPares([1 , 2, 2, 4, 5]) |> IO.puts()

#1. Contar elementos pares en una lista
