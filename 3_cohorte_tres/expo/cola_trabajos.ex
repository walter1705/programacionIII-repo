defmodule ColaTrabajos do
  use GenServer

  @modulo_actual ColaTrabajos #Constante

  # API pública
  def start_link(_) do
    GenServer.start_link(@modulo_actual, [], name: @modulo_actual)
  end

  def agregar_trabajo(funcion) when is_function(funcion, 0) do
    GenServer.cast(@modulo_actual, {:nuevo_trabajo, funcion})
  end

  # Callbacks

  def init(_) do
    {:ok, %{contador: 0}}
  end

  def handle_cast({:nuevo_trabajo, funcion}, estado) do

    Task.start(fn ->
      IO.puts("Iniciando trabajo...")
      resultado = funcion.()
      IO.puts("Trabajo terminado con resultado: #{inspect(resultado)}")
    end)

    nuevo_estado = %{estado | contador: estado.contador + 1}
    {:noreply, nuevo_estado}
  end
end

ColaTrabajos.start_link([])

ColaTrabajos.agregar_trabajo(fn -> :timer.sleep(1000); "Trabajo A" end)
ColaTrabajos.agregar_trabajo(fn -> :timer.sleep(500); "Trabajo B" end)
Process.sleep(5000)
