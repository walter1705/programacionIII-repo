defmodule Ejercicio do
  def main(matrix) do
    # Proceso t1: Ejecuta S1
    t1 = Task.async(fn -> sum_below_diagonal(matrix) end)

    # Proceso t2: Ejecuta S2
    t2 = Task.async(fn -> average_above_diagonal(matrix) end)

    # Esperar a que terminen ambos procesos
    result_t1 = Task.await(t1)
    result_t2 = Task.await(t2)

    # Ejecutar S3
    s3 = result_t1 * result_t2

    #S4
    mensaje = "Resultado de S3: #{s3}"
    imprimir_ramadan(mensaje)

    # Retorna valores para pruebas
    {result_t1, result_t2, s3}
  end

  #S1 a => matriz

   # Función principal que inicia el cálculo
  def sum_below_diagonal(matrix) do
    sum_below_diagonal(matrix, 0, 0)
  end

  # Función recursiva para calcular la suma
  defp sum_below_diagonal([], _row, _col), do: 0

  defp sum_below_diagonal([head | tail], row, col) do
    # Filtra los elementos debajo de la diagonal principal
    below_diagonal_sum =
      Enum.slice(head, 0, row)
      |> Enum.sum()

    # Avanza al siguiente nivel de la matriz
    below_diagonal_sum + sum_below_diagonal(tail, row + 1, col)
  end
  #S2 b => promedio
  # Función principal que calcula el promedio
  def average_above_diagonal(matrix) do
    {sum, count} = sum_and_count_above_diagonal(matrix, 0, 0, {0, 0})
    if count == 0 do
      0
    else
      sum / count
    end
  end

  # Función recursiva para sumar los elementos y contar
  defp sum_and_count_above_diagonal([], _row, _col, acc), do: acc

  defp sum_and_count_above_diagonal([head | tail], row, _col, {sum, count}) do
    # Toma los elementos por encima de la diagonal principal
    above_diagonal = Enum.slice(head, row + 1, length(head) - (row + 1))

    # Suma y cuenta los elementos seleccionados
    sum_new = Enum.sum(above_diagonal)
    count_new = length(above_diagonal)

    # Actualiza acumuladores
    sum_and_count_above_diagonal(tail, row + 1, 0, {sum + sum_new, count + count_new})
  end
  #S3 c => a*b
  def product_of_a_and_b(matrix) do
    a = sum_below_diagonal(matrix)
    b = average_above_diagonal(matrix)
    a * b
  end
  #S4 imprimir
  def imprimir_ramadan(ramadan) do
    IO.puts(ramadan)
  end
end

# Ejemplo de uso
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

Ejercicio.main(matrix)

System.cmd()
