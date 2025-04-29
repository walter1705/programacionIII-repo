#ELiminar primera aparicion de un valor

defmodule Eliminar do
  def main(list, elem) do
    eliminar_elem(list, elem)
  end

  def eliminar_elem(list, elem, new \\ [], flag \\ false)

  def eliminar_elem([], _elem, _new, flag) when flag == false, do: {:error, "Element not found"}

  def eliminar_elem([], _elem, new, flag) when flag == true, do: {:ok, new}

  def eliminar_elem([h | t], elem, new, flag) when flag == false do
    unless elem == h do
      eliminar_elem(t, elem, List.insert_at(new,-1, h), flag)
    else
      eliminar_elem(t, elem, new, true)
    end
  end

  def eliminar_elem([h | t], elem, new, flag) when flag == true do
    eliminar_elem(t, elem, List.insert_at(new,-1, h), flag)
  end
end

Eliminar.main(["a", 2, "perro", false], 2) |> IO.inspect()
