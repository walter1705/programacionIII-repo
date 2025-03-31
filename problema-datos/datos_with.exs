defmodule DatosIf do
  @anio_empresa 1991
  def main() do

    cedula = "Ingresa tu cedula: "
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()

    mensaje = with true <- multiplo(@anio_empresa, cedula) do
      "Aplica para el descuento de 50%"
    else
      _ -> "No aplica para el descuento de 50%"
    end
    IO.puts(mensaje)
  end

  def multiplo(num, cedula), do:  rem(cedula, num) == 0
end

DatosIf.main()
