# realizar un metodo que invierta una cadena
#quiz realizado en clase, el metodo de divide y venceras esta incompleto ()<completar
defmodule Reversa do
  def main(palabra) do
    reversa(palabra) |> IO.puts()
end

  def reversa(palabra) do
    if  String.length(palabra)==1 do
      String.at(palabra, 0)
    else
      letra = String.at(palabra, 0)
      cortada = String.slice(palabra, 1..(String.length(palabra) - 1))
      reversa(cortada) <> letra
    end
  end

  def reversa_profesor(word, new_word \\ [])

  def reversa_profesor([], new_word), do: (
    List.flatten(new_word)
    )

  def reversa_profesor([h | t], new_word) do
    reversa_profesor(t, [h | new_word])
  end

  def reversa_d([]) ,do: :ok

  def reversa_d([x]), do: x

  def reversa_d(list) do
    mid = div(length(list), 2)
    {left, right} = Enum.split(list, mid)
    reversa_d(right) ++ reversa_d(left)
  end
end

Reversa.main("WALTER")
Reversa.reversa_profesor("WALTER" |> String.to_charlist) |> IO.puts()
Reversa.reversa_d("WALTER" |> String.to_charlist) |> List.flatten()|> IO.puts()
