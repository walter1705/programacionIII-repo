defmodule NodoServidor do
  @nombre_servicio_local :servicio_trabajos

  def main() do
    IO.puts("Servidor iniciado...")
    registrar_servicio(@nombre_servicio_local)
    procesar_mensajes(cargar_datos())
  end

  defp registrar_servicio(nombre_servicio_local) do
    Process.register(self(), nombre_servicio_local)
  end

  defp cargar_datos do
    autores = [
      %{cedula: "123", nombre: "Ana", apellidos: "García", programa: "Ingeniería", titulo: "Ingeniera"},
      %{cedula: "124", nombre: "Juan", apellidos: "Pérez", programa: "Biología", titulo: "Biólogo"},
      %{cedula: "125", nombre: "María", apellidos: "López", programa: "Química", titulo: "Química"},
      %{cedula: "126", nombre: "Carlos", apellidos: "Hernández", programa: "Física", titulo: "Físico"},
      %{cedula: "127", nombre: "Luisa", apellidos: "Martínez", programa: "Matemáticas", titulo: "Matemática"}
    ]

    trabajos = [
      %{
        titulo: "Estudio sobre energías renovables",
        fecha: ~D[2023-01-10],
        descripcion: "Investigación sobre el uso de energías limpias.",
        autores: ["123", "124"]
      },
      %{
        titulo: "Avances en química orgánica",
        fecha: ~D[2023-05-22],
        descripcion: "Estudio de compuestos orgánicos avanzados.",
        autores: ["125", "126"]
      },
      %{
        titulo: "Aplicaciones de inteligencia artificial",
        fecha: ~D[2024-03-15],
        descripcion: "Uso de IA en problemas cotidianos.",
        autores: ["123", "127"]
      }
    ]

    %{autores: autores, trabajos: trabajos}
  end

  defp procesar_mensajes(state) do
    receive do
      {:listar_trabajos, cliente} ->
        send(cliente, {:respuesta_trabajos, state.trabajos})
        procesar_mensajes(state)

      {:consultar_autores, titulo, cliente} ->
        trabajo = Enum.find(state.trabajos, fn t -> t.titulo == titulo end)

        autores =
          if trabajo do
            Enum.filter(state.autores, fn autor -> autor.cedula in trabajo.autores end)
          else
            []
          end

        send(cliente, {:respuesta_autores, autores})
        procesar_mensajes(state)

      {:fin, cliente} ->
        send(cliente, :fin)

      _ ->
        IO.puts("Mensaje desconocido.")
        procesar_mensajes(state)
    end
  end
end

NodoServidor.main()
defmodule NodoServidor do
  @nombre_servicio_local :servicio_trabajos

  def main() do
    IO.puts("Servidor iniciado...")
    registrar_servicio(@nombre_servicio_local)
    procesar_mensajes(cargar_datos())
  end

  defp registrar_servicio(nombre_servicio_local) do
    Process.register(self(), nombre_servicio_local)
  end

  defp cargar_datos do
    autores = [
      %{cedula: "123", nombre: "Ana", apellidos: "García", programa: "Ingeniería", titulo: "Ingeniera"},
      %{cedula: "124", nombre: "Juan", apellidos: "Pérez", programa: "Biología", titulo: "Biólogo"},
      %{cedula: "125", nombre: "María", apellidos: "López", programa: "Química", titulo: "Química"},
      %{cedula: "126", nombre: "Carlos", apellidos: "Hernández", programa: "Física", titulo: "Físico"},
      %{cedula: "127", nombre: "Luisa", apellidos: "Martínez", programa: "Matemáticas", titulo: "Matemática"}
    ]

    trabajos = [
      %{
        titulo: "Estudio sobre energías renovables",
        fecha: ~D[2023-01-10],
        descripcion: "Investigación sobre el uso de energías limpias.",
        autores: ["123", "124"]
      },
      %{
        titulo: "Avances en química orgánica",
        fecha: ~D[2023-05-22],
        descripcion: "Estudio de compuestos orgánicos avanzados.",
        autores: ["125", "126"]
      },
      %{
        titulo: "Aplicaciones de inteligencia artificial",
        fecha: ~D[2024-03-15],
        descripcion: "Uso de IA en problemas cotidianos.",
        autores: ["123", "127"]
      }
    ]

    %{autores: autores, trabajos: trabajos}
  end

  defp procesar_mensajes(state) do
    receive do
      {:listar_trabajos, cliente} ->
        send(cliente, {:respuesta_trabajos, state.trabajos})
        procesar_mensajes(state)

      {:consultar_autores, titulo, cliente} ->
        trabajo = Enum.find(state.trabajos, fn t -> t.titulo == titulo end)

        autores =
          if trabajo do
            Enum.filter(state.autores, fn autor -> autor.cedula in trabajo.autores end)
          else
            []
          end

        send(cliente, {:respuesta_autores, autores})
        procesar_mensajes(state)

      {:fin, cliente} ->
        send(cliente, :fin)

      _ ->
        IO.puts("Mensaje desconocido.")
        procesar_mensajes(state)
    end
  end
end

NodoServidor.main()
