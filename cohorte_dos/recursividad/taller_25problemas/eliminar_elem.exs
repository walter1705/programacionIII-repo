#eliminar elemento por indice

defmodule Eliminar_indice do
  def main(list, index) do
    eliminar(list, index)
  end

  def eliminar(list, index, n \\ 0, new_list \\ [])

  def eliminar([], _index, _n, new_list), do: new_list

  def eliminar([h | t], index, n, new_list) when index != n do
    eliminar( t, index, n+1, List.insert_at(new_list, -1, h) )
  end

  def eliminar([_h | t], index, n, new_list) when index == n do
    eliminar( t, index, n+1, new_list )
  end


end

Eliminar_indice.main([1, 2, 3], 1) |> IO.inspect()
