defmodule ProductoLista do
  def main(lista) do
    productoLista(lista)
  end

  def productoLista(list, acc \\ 1)

  def productoLista([], acc), do: acc

  def productoLista([h | t], acc),do: productoLista(t, acc * h)
end

ProductoLista.main([1, 2, 3, 2]) |> IO.inspect()
