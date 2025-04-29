defmodule Cliente do
  defstruct [:nombre, :edad, :altura]

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def escribir_csv(cliente, nombre_archivo \\ "clientes.csv")

  def escribir_csv(cliente, nombre_archivo) do
    cliente
    |> generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
    |> (&("nombre,edad,altura\n" <> &1)).()
    |> (&File.write(nombre_archivo, &1)).()
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}"
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  def ingresar(:clientes) do
    IO.puts("Ingrese los datos de los clientes.")
    recibir_datos_clientes([])
  end

  defp recibir_datos_clientes(clientes) do
    IO.puts("Nombre del cliente (o 'fin' para terminar):")
    nombre = String.trim(IO.gets(""))

    IO.puts("Edad del cliente:")
    edad = String.trim(IO.gets("")) |> String.to_integer()

    IO.puts("Altura del cliente:")
    altura = String.trim(IO.gets("")) |> String.to_float()

    cliente = crear(nombre, edad, altura)
    recibir_datos_clientes([cliente | clientes])
  end
end
