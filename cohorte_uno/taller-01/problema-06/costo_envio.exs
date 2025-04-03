Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule CostoEnvio do
  def main() do
    nombre_cliente = "Ingrese el nombre del cliente: "
    |>EntradaDatos.ingresar(:texto)

    peso_paquete = "Ingrese el peso del paquete en kg: "
    |> EntradaDatos.ingresar(:real)

    tipo_envio = "Ingrese el tipo de envio (economico, express, internacional): "
    |> EntradaDatos.ingresar(:texto)

    tarifa = case tipo_envio do
      "economico" -> 5000 * peso_paquete
      "express" -> 8000 * peso_paquete
      "internacional" -> cond do
        peso_paquete<=5.0 -> 15000*peso_paquete
        true -> 12000*peso_paquete
      end
    end

    dupla = {nombre_cliente, peso_paquete, tipo_envio, tarifa}

    IO.inspect(dupla)
    dupla
  end
end

CostoEnvio.main()
