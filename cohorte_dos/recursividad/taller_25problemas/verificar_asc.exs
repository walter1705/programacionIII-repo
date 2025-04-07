defmodule Verificar do
  def main(list) do
    verificar(list)
  end

  def verificar(list) do
    verificar(list, Enum.at(list, 0))
  end

  def verificar([], _n), do: true

  def verificar([h | t], n)when n <= h, do: verificar(t, h)


  def verificar(_, _),do: false
end

Verificar.main([3, 2, 1]) |> IO.puts()
Verificar.main([1, 2, 3, 4, 10, 20 ,50]) |> IO.puts()
