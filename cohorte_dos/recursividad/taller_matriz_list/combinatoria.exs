#5. Resolver una suma objetivo con combinaciones de una lista
#Dado un conjunto de números,
#encontrar si existe una combinación
#cuya suma sea igual a un número objetivo.

defmodule Combinatoria do
  def encontrar_combinaciones(lista, objetivo) do
    backtrack(lista, objetivo, [], [])
  end

  defp backtrack([], 0, camino_actual, soluciones) do
    [Enum.reverse(camino_actual) | soluciones]
  end

  defp backtrack([], _objetivo, _camino_actual, soluciones), do: soluciones

  defp backtrack([head | tail], objetivo, camino_actual, soluciones) do
    soluciones =
      if head <= objetivo do
        backtrack(tail, objetivo - head, [head | camino_actual], soluciones)
      else
        soluciones
      end

    backtrack(tail, objetivo, camino_actual, soluciones)
  end
end

IO.inspect(Combinatoria.encontrar_combinaciones([2, 4, 6, 10], 12))
