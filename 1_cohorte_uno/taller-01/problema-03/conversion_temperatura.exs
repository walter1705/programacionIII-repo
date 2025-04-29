Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule ConversionTemperatura do
  def main do
    nombre = "Ingrese su nombre: "
    |> EntradaDatos.ingresar(:texto)

    temperatura_celsius = "Ingrese la temperatura en grados celsius (C): "
    |> EntradaDatos.ingresar(:real)

    farenheit_temp = convertir_farenheit(temperatura_celsius)
    kelvin_temp = convertir_kelvin(temperatura_celsius)

    generar_mensaje(nombre, farenheit_temp, kelvin_temp)
    |> EntradaDatos.mostrar_mensaje()

  end

  def convertir_farenheit(celsius) do
    (celsius*(9/5))+32
  end

  def convertir_kelvin(celsius) do
    celsius + 273.15
  end

  def generar_mensaje(nombre, f, k) do
    "#{nombre}, la temperatura es: \n ~#{f}F \n ~#{k}K"
  end

end

ConversionTemperatura.main()
