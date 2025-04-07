defmodule  Reverse do
  def main(list) do
    reverse(list)
  end

  def reverse(list, new \\ [])

  def reverse([], new), do: new

  def reverse([h | t], new) do
    reverse(t, [h | new])
  end
end


Reverse.main([1, 2, "chihuahua"]) |> IO.inspect()
