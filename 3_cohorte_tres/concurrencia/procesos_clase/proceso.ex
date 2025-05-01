defmodule Proceso do
  @cantidad_procesos 5
  def main do
    Benchmark.determinar_tiempo_ejecucion(
      {Proceso, :simulacion, [@cantidad_procesos]})
      |> generar_mensaje()
      |> EntradaDatos.mostrar_error()
  end

  def simulacion(cantidad_procesos) do
    datos_prueba =
      [{"A", 2500}, {"\tB", 1500}, {"\t\tC", 500}, {"\t\t\tD", 3500}]


    tarea =
      Enum.map(datos_prueba, fn v ->
        Task.async(fn -> simulando_proceso(v, cantidad_procesos) end)
      end)

    Enum.each(tarea, &Task.await(&1, 100_000))
  end

  def simulando_proceso({mensaje, demora}, cantidad_proceso) do
    IO.puts("#{mensaje} -> (Inicia)")

    Enum.each(1..cantidad_proceso, fn i ->
      :timer.sleep(demora)
      IO.puts("\t#{mensaje}-#{i}")
    end)

    IO.puts("#{mensaje} -> (Finalizada)")
  end

  def generar_mensaje(arg) do
    "\n El tiempo de ejecucion es de #{arg}, microsegundos."
  end

end

Proceso.main()
