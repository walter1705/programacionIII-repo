Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule Libreria do

  def main() do
    libro = "Ingrese el nombre del libro que desea ingresar a inventario: "
      |>EntradaDatos.ingresar(:texto)

    cantidad_libros = "Ingrese la cantidad de stock disponible del libro '#{libro}': "
      |> EntradaDatos.ingresar(:entero)

    precio_libro = "Ingrese el precio del libro '#{libro}': "
      |> EntradaDatos.ingresar(:real)

    valor_total = calcular_valor_total(precio_libro, cantidad_libros)

    generar_mensaje(libro, cantidad_libros, valor_total)
      |> EntradaDatos.mostrar_mensaje()

  end

  def calcular_valor_total(precio, stock) do
    precio*stock |> round()
  end

  def generar_mensaje(libro, cantidad, valor_total) do
    "El libro '#{libro}' tiene #{cantidad} unidades, con un valor total de $#{valor_total}"
  end
end

Libreria.main
