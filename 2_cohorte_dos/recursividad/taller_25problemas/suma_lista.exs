defmodule SumaLista do
  def main(lista) do
    sumaLista(lista)
  end

  def sumaLista(list, acc \\ 0)

  def sumaLista([], acc), do: acc

  def sumaLista([h | t], acc),do: sumaLista(t, acc + h)
end

SumaLista.main([1, 2, 3]) |> IO.inspect()
