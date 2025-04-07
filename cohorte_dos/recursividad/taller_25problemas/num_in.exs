defmodule In do
  def main(list, n) do
    in?(list, n)
  end

  def in?([], _n),do: false

  def in?([h | t], n) do
    unless h == n do
      in?(t, n)
    else
      true
    end
  end
end

In.main([1, 2, 3], 4) |> IO.puts()
