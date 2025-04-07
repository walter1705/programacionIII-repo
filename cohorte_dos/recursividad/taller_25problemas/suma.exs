#Suma de números del 1 al n

defmodule Suma do
    def suma(n, acc \\ 0)

    def suma(0, acc), do: acc

    def suma(n, acc) do
        suma(n-1, n + acc)
    end
end

Suma.suma(5) |> IO.puts()
