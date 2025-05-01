#Crear un proceso en elixir que imprima infinitamente

defmodule ProcesoInfinito do
  def procesoInfinito(mensaje, segundos) do

    Process.sleep(segundos*1000)
    spawn(fn  -> IO.puts(mensaje)  end)
    procesoInfinito(mensaje, segundos)
  end
end

ProcesoInfinito.procesoInfinito("Toma awita", 2)
