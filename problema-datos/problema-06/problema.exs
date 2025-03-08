defmodule Problema do
  def main() do
    antiguedad = "Ingrese la antiguedad del cliente: "
    |>IO.gets()
    |> String.trim()
    |> String.to_integer()

    porcentage = cond  do
      antiguedad>0 and antiguedad<=2 -> "El descuento es del 10%"
      antiguedad>=3 and antiguedad<=6 -> "EL descuento es del 14%"
      antiguedad>6 -> "El descuento es del 17%"
      true -> "No tiene porcentaje de descuento"
    end

    IO.puts(porcentage)
  end


end
Problema.main()
