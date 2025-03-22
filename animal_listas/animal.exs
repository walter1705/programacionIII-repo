defmodule Animal do
  defstruct nombre: "",peso: 0,edad: 0

  def get_animales() do
    [%Animal{nombre: "Rocky",peso: 60, edad: 15},
    %Animal{nombre: "Rocky2",peso: 65, edad: 5},
    %Animal{nombre: "Rocky3",peso: 10, edad: 1},
    %Animal{nombre: "Rocky4",peso: 20, edad: 7}
  ]
  end

  def agregar_animal(lista, nombre, peso, edad) do
    struct = %Animal{nombre: nombre, peso: peso, edad: edad}
    [struct | lista]
  end

  def get_mayores_que(lista, peso), do: lista |> Enum.filter(& &1.peso > peso)
end



Animal.get_animales() |> Animal.get_mayores_que(30) |> IO.inspect()
