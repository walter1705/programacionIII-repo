defmodule Factorial do
  def factorial(n, acc \\ 1)

  def factorial(1, acc), do: acc

  def factorial(n, acc), do: factorial(n-1, acc*n)


end

Factorial.factorial(5) |> IO.puts()
