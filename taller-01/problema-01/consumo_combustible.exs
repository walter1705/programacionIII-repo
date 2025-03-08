
Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule ConsumoCombustible do
  def main do
    nombre = "Ingrese el nombre del conductor: "
    |> EntradaDatos.ingresar(:texto)

    distancia_recorrida_km = "Ingrese la distancia recorrida: "
    |> EntradaDatos.ingresar(:real)

    cantidad_combustible_consumido_litros = "Ingrese el combustible consumido en litros: "
    |> EntradaDatos.ingresar(:real)

    calcular_rendimiento(distancia_recorrida_km, cantidad_combustible_consumido_litros)
      |>generar_mensaje(nombre)
      |>EntradaDatos.mostrar_mensaje()
  end

  def calcular_rendimiento(distancia, litros), do: distancia/litros;

  def generar_mensaje(rendimiento, nombre), do: "#{nombre} el rendimiento de su vehiculo es: #{rendimiento} km/l"
end

ConsumoCombustible.main()
