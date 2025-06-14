defmodule NodoCliente do
  @nombre_servicio_local :servicio_respuesta
  @servicio_local {@nombre_servicio_local, :nodocliente@cliente}
  @nodo_remoto :nodoservidor@localhost
  @servicio_remoto {:servicio_cadenas, @nodo_remoto}

  #Mensajes a procesar
  @mensajes [
    {:mayusculas, "Juan"},
    {:mayusculas, "Ana"},
    {:mayusculas, "Diana"},
    {&String.reverse, "Walter"},
    "Uniquindio"
  ]


  def main() do
    EntradaDatos.mostrar_error("PROCESO PRINCIPAL")

    @nombre_servicio_local
      |> registrar_servicio()

    establecer_conexion(@nodo_remoto)
      |> iniciar_produccion()
    end

  defp registrar_servicio(nombre_servicio)  do
    Process.register(self(), nombre_servicio)
  end

  defp  establecer_conexion(nodo_remoto) do
    Node.connect(nodo_remoto)
  end

  defp  iniciar_produccion(false) do
    EntradaDatos.mostrar_error("No se pudo conectar con el nodo del servidor.")
  end

  defp iniciar_produccion(true) do
    enviar_mensajes()
    recibir_rspuestar()
  end

  defp enviar_mensajes() do
    Enum.each(@mensajes, &enviar_mensajes/1)
  end

  defp enviar_mensaje(mensaje) do
    send(@servicio_remoto, {@servicio_local, mensaje})
  end

  defp recibir_respuestas() do
    receive do
      :fin -> :ok
      respuesta -> EntradaDatos.mostrar_error("\t -> \"#{respuesta}\"")
      recibir_respuestas()
    end

  end
end
