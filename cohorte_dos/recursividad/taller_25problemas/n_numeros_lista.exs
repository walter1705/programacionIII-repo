defmodule ContarNum do
  def main(list) do
    contar(list, 6)
  end

  def contar(list, target, n \\ 0)

  def contar([], _target, n), do: n

  def contar([h | t], target, n) when target != h, do: contar(t, target, n)

  def contar([h | t], target, n) when target == h, do: contar(t, target, n+1)

end

ContarNum.main([1, 1, 1, 4, 5, 5]) |> IO.puts()
