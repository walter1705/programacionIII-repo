#Crear un proceso en elixir que imprima infinitamente

defmodule ProcesoInfinito do
  def procesoInfinito(mensaje, segundos) do
    IO.puts(mensaje)
    Process.sleep(segundos*1000)
    procesoInfinito(mensaje, segundos)
  end
end

ProcesoInfinito.procesoInfinito("Toma awita", 2)
