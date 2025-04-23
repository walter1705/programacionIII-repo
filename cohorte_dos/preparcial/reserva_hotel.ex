defmodule ReservaHotel do
  @header "reservas.csv", "Codigo,Fecha Reserva,Fecha Entrada,Total,Cliente,Lista Habitaciones\n"
  def consultar_reservas() do
    {_, content} = File.read("reservas.csv")
    chopped = String.split(content, ",", trim: true)
      |> List.delete(@header)
      |> Enum.chunk_every(9)
  end

  def guardar_reservas_en_csv(reservas) do
    File.write!(@header)

    for reserva <- reservas do
      cliente_info = "#{reserva.cliente.nombre}-#{reserva.cliente.edad}-#{reserva.cliente.altura}"
      habitaciones_info = Enum.map(reserva.habitaciones, fn h -> "#{h.numero}-#{h.tipo}" end) |> Enum.join("|")

      linea = "#{reserva.id},#{reserva.fecha_reserva},#{reserva.fecha_entrada},#{reserva.total},#{cliente_info},#{habitaciones_info}\n"
      File.write!("reservas.csv", linea, [:append])
    end
  end

  # Función para consultar reservas por cliente
  def consultar_reservas_por_cliente(reservas, nombre_cliente) do
    Enum.filter(reservas, fn r -> r.cliente.nombre == nombre_cliente end)
  end

  # Función para contar reservas con total superior a un valor dado usando divide y vencerás
  def contar_reservas_superior(reservas, valor) do
    dividir_y_contar(reservas, valor)
  end

  defp dividir_y_contar(lista, valor, cont \\ 0)

  defp dividir_y_contar([], _valor, contador), do: contador

  defp dividir_y_contar([%{total: total} = _r | resto], valor, contador) do
    if total > valor do
      dividir_y_contar(resto, valor, contador + 1)
    else
      dividir_y_contar(resto, valor, contador)
    end
  end

  # Calcular promedio de edad de los clientes de forma recursiva
  def promedio_edad_clientes(reservas) do
    {total_edad, cantidad} = sumar_edades_y_contar(reservas, 0, 0)
    total_edad / cantidad
  end

  defp sumar_edades_y_contar([], suma, contador), do: {suma, contador}

  defp sumar_edades_y_contar([%{cliente: %{edad: edad}} | resto], suma, contador) do
    sumar_edades_y_contar(resto, suma + edad, contador + 1)
  end

end

# Ejemplo de uso
# Crear reservas de prueba
reservas = [
  %Reserva{
    id: "R001",
    fecha_reserva: "2025-04-01",
    fecha_entrada: "2025-04-10",
    total: 250.50,
    cliente: %Cliente{nombre: "Juan Perez", edad: 30, altura: 1.75},
    habitaciones: [
      %Habitacion{numero: 101, tipo: "sencilla"}
    ]
  }
]

# Guardar reservas en un archivo CSV
ReservaHotel.guardar_reservas_en_csv(reservas)

# Consultar reservas por cliente
IO.inspect(ReservaHotel.consultar_reservas_por_cliente(reservas, "Juan Perez"))

# Contar reservas con total superior a un valor
IO.puts("Reservas con total superior a 200: #{ReservaHotel.contar_reservas_superior(reservas, 200)}")

# Calcular promedio de edad
IO.puts("Promedio de edad de los clientes: #{ReservaHotel.promedio_edad_clientes(reservas)}")
