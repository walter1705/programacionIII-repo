defmodule EntradaDatos do

  defp ingresar_dato(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> IO.gets()
      |> String.trim()
      |> parser.()
    rescue
      ArgumentError ->
        mostrar_error("Error: se espera que ingrese un dato de tipo #{tipo_dato}")
        ingresar_dato(mensaje, parser, tipo_dato)
    end
  end

  defp mostrar_error(mensaje) do
    IO.puts(mensaje)
  end


  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end


  def ingresar(mensaje, :entero) do
    ingresar_dato(mensaje, &String.to_integer/1, "entero")
  end


  def ingresar(mensaje, :real) do
    ingresar_dato(mensaje, &convertir_a_float/1, "real")
  end

  def ingresar(mensaje, :vehiculo) do
    vehiculos = ["carro","camion","moto"]
      input = mensaje |> IO.gets()
      |> String.trim() |> String.downcase()
      cond do
        input in vehiculos -> input
        true -> ingresar(mensaje, :vehiculo)
      end
  end

  defp convertir_a_float(entrada) do
    case Integer.parse(entrada) do
      {int, ""} -> int * 1.0
      _ -> String.to_float(entrada)
    end
  end


  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
