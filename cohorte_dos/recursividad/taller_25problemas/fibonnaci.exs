defmodule Fibonacci do
  def fibonacci(n) when n <= 1, do: 1

  def fibonacci(n) when n > 1, do: fibonacci(n-1) + fibonacci(n-2)
end

Fibonacci.fibonacci(6) |> IO.puts()
