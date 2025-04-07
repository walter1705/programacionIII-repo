defmodule EnumMap do
  def map(list, fun, new \\ [])

  def map([], _fun, new), do: new

  def map([h | t],fun, new) do
    map(t, fun, List.insert_at(new, -1, fun.(h)))
  end

end
list = [1, 2, 3, 4]
Enum.map(list, & [&1]) |> IO.inspect()
EnumMap.map(list, & [&1]) |> IO.inspect()
