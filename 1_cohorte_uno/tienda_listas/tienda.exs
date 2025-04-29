Code.require_file("../entrada_datos.ex")

defmodule Tienda do
  alias EntradaDatos

  def main() do
    lista_productos = [{"shampoo", 12347}, {"gel", 12345}, {"jabon", 12341}, {"desodorante", 12342}]
    init(lista_productos)
  end

  def buscar_producto_id(lista, id) do
    if producto_existe?(lista, id) do
      {producto, _id_producto} =
        lista |> Enum.find(fn {_producto, id_producto} -> id == id_producto end)

      {producto, true}
    else
      {:not_found, false}
    end
  end

   

  defp ingresar_num_valido(mensaje) do
    entrada = mensaje |> EntradaDatos.ingresar(:entero)
    validos = [1, 2, 3, 4, 10]

    unless entrada in validos do
      IO.puts"Ingrese una entrada valida."
      ingresar_num_valido(mensaje)
    else
      entrada
    end
  end

  def init(lista) do
    case System.cmd("python", ["texto.py", "Inventario"]) do
      {text, 0} -> IO.puts(text)
    end

    opcion = "Que acciones desea realizar:
              (1) Mostrar todos los productos con stock.
              (2) Agregar productos al inventario.
              (3) Buscar producto por id.
              (4) Eliminar producto por id.
              (10) Terminar.

              Entrada: " |> ingresar_num_valido()

    case opcion do
      1 -> mostrar_productos(lista)
      2 -> pedir_agregar_producto(lista)
      3 -> pedir_buscar_producto_id(lista)
      4 -> pedir_eliminar_producto_id(lista)
      10 -> :ok
    end
  end

  def pedir_agregar_producto(lista) do
    nombre = "Ingrese el nombre del producto a agregar: "
    |> EntradaDatos.ingresar(:texto)
    |> String.trim()

    id = "Ingrese el id del producto a agregar: "
    |> EntradaDatos.ingresar(:entero)

    if producto_existe?(lista, id) do
      IO.puts("Producto con ID: '#{id}' ya existe en el inventario")
      init(lista)
    else
      IO.puts("Producto agregado con éxito.")
      init(agregar_producto(lista, nombre, id))
    end
  end

  def agregar_producto(lista, nombre, id) do
    lista ++ [{String.downcase(nombre), id}]
  end

  def pedir_buscar_producto_id(lista) do
    id =
      "Ingrese el id del producto a consultar: "
      |> EntradaDatos.ingresar(:entero)

    {producto, estado} = buscar_producto_id(lista, id)

    case estado do
      true -> IO.puts("Producto con ID: '#{id}' encontrado. Tiene como nombre '#{producto}'.")
      false -> IO.puts("Producto con ID: '#{id}' no existe.")
    end

    init(lista)
  end

  def pedir_eliminar_producto_id(lista) do
    id =
      "Ingrese el id del producto a eliminar: "
      |> EntradaDatos.ingresar(:entero)

    {lista_actualizada, aprobacion} = eliminar_producto(lista, id)

    case aprobacion do
      true -> IO.puts("Producto con ID: '#{id}' eliminado.")
      false -> IO.puts("Producto con ID: '#{id}' no existe.")
    end

    init(lista_actualizada)
  end

  def eliminar_producto(lista, id) do
    if producto_existe?(lista, id) do
      lista_nueva = lista |> Enum.filter(fn {_nombre, id_producto} -> id_producto != id end)
      {lista_nueva, true}
    else
      {lista, false}
    end
  end

  def producto_existe?(lista, id) do
    lista |> Enum.any?(fn {_nombre, id_producto} -> id == id_producto end)
  end

  def mostrar_productos(lista) do
    IO.puts("Listado de productos: ")
    mostrar_producto_recursivo(lista)
    init(lista)
  end

  def mostrar_producto_recursivo([]), do: :ok

  def mostrar_producto_recursivo([cabeza | cola]) do
    {nombre, id} = cabeza
    IO.puts("~#{String.capitalize(nombre)} con id '#{id}'.")
    mostrar_producto_recursivo(cola)
  end


  #Ejemplo no recursivo
  def mostrar_producto_no_recursivo(lista) do
    lista
    |> Enum.each(fn {nombre_producto, id_producto} ->
      IO.puts("~#{String.capitalize(nombre_producto)} con id '#{id_producto}'.")
    end)
  end
end

Tienda.main()
