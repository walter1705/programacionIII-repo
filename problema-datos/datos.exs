defmodule Datos do
  @anio_empresa 1991
  def main() do

    cedula = "Ingresa tu cedula: "
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()

    mensaje =case multiplo(@anio_empresa, cedula) do
      true -> "Aplica para el descuento de 50%"
      false -> "No aplica para el descuento de 50%"
    end
    IO.puts(mensaje)
  end

  def multiplo(num, cedula), do:  rem(cedula, num) == 0
end

Datos.main()
