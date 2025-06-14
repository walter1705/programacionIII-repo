defmodule NodoCliente do
  def main(server_node) do
    if Node.connect(server_node) do
      IO.puts("Conectado al servidor: #{server_node}")
      menu({:servicio_trabajos, server_node})
    else
      IO.puts("Error: No se pudo conectar al servidor #{server_node}")
    end
  end

  defp menu(servicio) do
    IO.puts("\nOpciones:")
    IO.puts("1. Listar trabajos de grado")
    IO.puts("2. Consultar autores de un trabajo")
    IO.puts("3. Salir")
    IO.write("> ")

    case IO.gets("") |> String.trim() |> String.to_integer() do
      1 -> listar_trabajos(servicio)
      2 -> consultar_autores(servicio)
      3 -> enviar_fin(servicio)
      _ -> IO.puts("Opción no válida.")
    end

    menu(servicio)
  end

  defp listar_trabajos(servicio) do
    send(servicio, {:listar_trabajos, self()})

    receive do
      {:respuesta_trabajos, trabajos} ->
        IO.puts("Trabajos de grado:")

        Enum.each(trabajos, fn trabajo ->
          IO.puts("- #{trabajo.titulo}")
        end)
    after
      5000 -> IO.puts("Error: No se recibió respuesta del servidor.")
    end
  end

  defp consultar_autores(servicio) do
    IO.puts("\nIngrese el título del trabajo:")
    titulo = IO.gets("> ") |> String.trim()

    send(servicio, {:consultar_autores, titulo, self()})

    receive do
      {:respuesta_autores, []} ->
        IO.puts("No se encontraron autores para este trabajo.")

      {:respuesta_autores, autores} ->
        IO.puts("Autores:")

        Enum.each(autores, fn autor ->
          IO.puts("#{autor.nombre} #{autor.apellidos} - #{autor.programa}")
        end)
    after
      5000 -> IO.puts("Error: No se recibió respuesta del servidor.")
    end
  end

  defp enviar_fin(servicio) do
    send(servicio, {:fin, self()})

    receive do
      :fin -> IO.puts("Desconectado del servidor.")
    after
      5000 -> IO.puts("Error: No se recibió respuesta del servidor.")
    end

    System.halt(0)
  end
end

NodoCliente.main(:"servidor@192.168.77.72")
