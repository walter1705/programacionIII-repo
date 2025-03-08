Code.require_file(Path.expand("../entrada_datos.ex"))

defmodule CalculoSalario do
  def main() do
    nombre_empleado = "Ingrese el nombre del empleado: "
    |> EntradaDatos.ingresar(:texto)

    salario_base_horas = "Ingrese el salario base del empleado en horas: "
    |> EntradaDatos.ingresar(:real)

    horas_ordinarias = "Ingrese el numero de horas ordinarias del empleado: "
    |> EntradaDatos.ingresar(:entero)

    horas_extras = "Ingrese el numero de extras de trabajo del empleado: "
    |> EntradaDatos.ingresar(:entero)

    salario_total = calcular_salario_total(salario_base_horas, horas_extras, horas_ordinarias)

    generar_mensaje(nombre_empleado, salario_total) |> EntradaDatos.mostrar_mensaje()
  end

  def calcular_salario_total(salario, horas_extras, horas_ordinarias) do
    ((salario*1.5) * horas_extras) + (salario * horas_ordinarias) |> round()
  end

  def generar_mensaje(nombre, salario) do
    "El salario total de #{nombre} es de $#{salario}."
  end

end

CalculoSalario.main()
