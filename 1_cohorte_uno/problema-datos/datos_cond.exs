defmodule DatosCond do
  @anio_empresa 1991
  def main() do

    cedula = "Ingresa tu cedula: "
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()

    mensaje = cond do
      multiplo(@anio_empresa, cedula) -> "Aplica para el descuento de 50%"
      true -> "No aplica para el descuento de 50%"
    end
    IO.puts(mensaje)
  end

  def multiplo(num, cedula), do:  rem(cedula, num) == 0
end

DatosCond.main()
