defmodule NodoServidor do
  @nombre_servicio_local :servicio_cadenas
  def main() do
    Util.mostrar_mensaje("PROCESO SECUNDARIO")
    registrar_servicio(@nombre_servicio_local)
    procesar_mensaje()
  end
  defp registrar_servicio(nombre_servicio_local), do: Process.register(self(),nombre_servicio_local)
  defp procesar_mensaje() do
    receive do
      {productor, mensaje } ->
        respuesta=procesar_mensaje(mensaje)
        send(productor,respuesta)
        #llama recursivamente para seguir recibiendo mensajes
        if respuesta != :fin, do: procesar_mensaje()
    end
  end
  defp procesar_mensaje(:fin), do: :fin
  defp procesar_mensaje({:mayusculas, msg}), do: String.upcase(msg)
  defp procesar_mensaje({:minusculas, msg}), do: String.downcase(msg)
  defp procesar_mensaje({funcion, msg}) when is_function(funcion,1), do: funcion.(msg)
  defp procesar_mensaje(mensaje), do: "EL MENSAJE \ #{mensaje}  es desconocido "

end
NodoServidor.main()
