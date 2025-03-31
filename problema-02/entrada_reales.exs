defmodule EntradaReales do


  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> EntradaDatos.ingresar(:entero)
    porcentaje_descuento = "Ingrese el porcentaje de descuento: "
      |> EntradaDatos.ingresar(:real)
      valor_descuento = calcular_valor_descuento(valor_producto, porcentaje_descuento)
      valor_final = calcular_valor_final(valor_producto, valor_descuento)
      generar_mensaje(valor_descuento, valor_final)
      |> EntradaDatos.mostrar_mensaje()
  end

  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
      valor_producto * porcentaje_descuento
  end

  defp calcular_valor_final(valor_producto, valor_descuento) do
      valor_producto - valor_descuento
  end
  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = valor_descuento |> round()
    valor_final = valor_final |> round()
    "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}"
  end


end

EntradaReales.main()
