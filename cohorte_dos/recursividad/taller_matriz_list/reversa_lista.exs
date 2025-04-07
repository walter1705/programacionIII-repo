#2. Invertir una lista sin usar Enum.reverse

defmodule Invertir do
  def invertir(lista, new \\ [])

  def invertir([], new), do: new

  def invertir([ h | t ], new), do: invertir(t, [h | new])
end

Invertir.invertir([1, 2, 3]) |> IO.inspect()
