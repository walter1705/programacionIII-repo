defmodule Tarea do
  def main() do

  end

  def proceso() do
    receive do
      {:message, value} -> value |> IO.puts()
    end

    proceso()
  end
end

task = Task.async(fn -> Tarea.proceso() end)


send(task.pid, {:message, "hola piuta"})

Task.await(task)
