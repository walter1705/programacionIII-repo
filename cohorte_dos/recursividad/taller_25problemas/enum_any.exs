defmodule EnumAny do

  def enumAny([], _fun), do: false

  def enumAny([h | t], fun) do
    if fun.(h) do
      true
    else
      enumAny(t , fun)
    end

  end
end

list = [1, 2, 3]

Enum.any?(list, & &1 == 2) |> IO.puts()
Enum.any?(list, & &1 == 4) |> IO.puts()

EnumAny.enumAny(list, & &1 == 2) |> IO.puts()
EnumAny.enumAny(list, & &1 == 4) |> IO.puts()

#Recursivamente invertir los pares de una lista.

#Calcular la suma de los dígitos de un número.
