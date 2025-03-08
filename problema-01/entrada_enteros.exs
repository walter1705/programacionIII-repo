defmodule EntradaEnteros do
  def main do
    
    end

    defp ingresar(mensaje, :entero) do
      mensaje
      |> UtilJava.ingresar(:entero)
      |> String.to_integer()
      end

    defp calcular_devuelta(valor_pago, valor_total) do
        valor_pago - valor_total
      end

    defp generar_mensaje(devuelta) do
        "El valor de devuelta es $ #{devuelta}"
        end
end
