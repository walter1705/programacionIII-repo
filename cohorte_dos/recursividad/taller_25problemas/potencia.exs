#Calcular la potencia de un número Ejemplo: potencia(2, 3) => 2^3 = 8

defmodule Potencia do
  def main(n1, n2) do
    potencia(n1, n2)
  end

  def potencia(0, 0), do: :undefined

  def potencia(n, 1), do: n

  def potencia(n1,n2,n\\1)

  def potencia(_n1,0,acc), do: acc

  def potencia(n1,n2,acc) do
    potencia(n1, n2-1, acc*n1)
  end
end


Potencia.main(2, 3)|> IO.puts()
