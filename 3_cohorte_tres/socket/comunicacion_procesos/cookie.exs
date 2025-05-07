defmodule Cookie do
  @longitud_clave 128

  def main() do
    :crypto.strong_rand_bytes(@longitud_clave)
    |> Base.encode64()
    |> EntradaDatos.mostrar_error()
  end
end

Cookie.main()
