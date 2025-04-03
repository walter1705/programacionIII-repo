Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule RegistroVehiculos do
  def main() do
    placa = "Ingrese la placa del vehiculo: "
    |>EntradaDatos.ingresar(:texto)

    tipo_vehiculo = "Ingresar el tipo vehiculo (Carro, Moto, Camion): "
    |>EntradaDatos.ingresar(:vehiculo)


    peso_vehiculo = "Ingrese del peso de vehiculo: "
    |> EntradaDatos.ingresar(:real)

    tarifa = case String.downcase(tipo_vehiculo) do
      "carro" -> 10000
      "moto" -> 5000
      "camion" -> (20000 + (peso_vehiculo*2000)) |> round()
    end

    generar_mensaje(placa, tipo_vehiculo, tarifa) |> EntradaDatos.mostrar_mensaje()


    {placa, tipo_vehiculo, tarifa}
  end

  def generar_mensaje(placa, tipo, tarifa) do
    "Vehiculo #{placa} (#{tipo}) debe pagar $#{tarifa}."
  end
end

RegistroVehiculos.main()
