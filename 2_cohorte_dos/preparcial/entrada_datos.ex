defmodule EntradaDatos do
  # Función para obtener un entero
  def obtener_entero do
    IO.puts("Por favor, introduce un número entero:")
    entrada = IO.gets("") |> String.trim()
    case Integer.parse(entrada) do
      {numero, _} -> numero
      :error ->
        IO.puts("No es un número entero válido. Inténtalo de nuevo.")
        obtener_entero()
    end
  end

  # Función para obtener un flotante
  def obtener_flotante do
    IO.puts("Por favor, introduce un número flotante:")
    entrada = IO.gets("") |> String.trim()
    case Float.parse(entrada) do
      {numero, _} -> numero
      :error ->
        IO.puts("No es un número flotante válido. Inténtalo de nuevo.")
        obtener_flotante()
    end
  end

  # Función para obtener un string
  def obtener_cadena do
    IO.puts("Por favor, introduce una cadena de texto:")
    IO.gets("") |> String.trim()
  end

  # Función para mostrar un mensaje
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end


end
