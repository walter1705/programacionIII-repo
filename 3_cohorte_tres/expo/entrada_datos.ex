defmodule EntradaDatos do

    defp ingresar(mensaje, parser, tipo_dato) do
        try do
          mensaje
          |> IO.gets()
          |> String.trim()
          |> parser.()
        rescue
        ArgumentError ->
          "Error, se espera que ingrese un número #{tipo_dato}\n"
          |> mostrar_error()
          mensaje
          |> ingresar(parser, tipo_dato)
        end
    end

    def mostrar_mensaje(mess) do
      mess |> IO.puts()
    end

    def ingresar(mensaje, :texto) do
       mensaje |>  IO.gets()
    end

    def ingresar(mensaje, :entero) do
      ingresar(mensaje, &String.to_integer/1, :entero)
    end

    def ingresar(mensaje, :real) do
        ingresar(mensaje, &String.to_float/1, :real)
    end

end
