defmodule Duplicar do
  def main(list) do
    duplicar(list)
  end

  def duplicar(list, new_list \\ [])

  def duplicar([], new_list), do: new_list

  def duplicar([h | t], new_list) do
    duplicar(t, new_list ++ List.duplicate(h, 2))
  end
end


Duplicar.main([1, 2, 3]) |> IO.inspect()
