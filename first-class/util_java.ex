defmodule UtilJava do
  def ingresar(mensaje,:texto) do
    case System.cmd("java", ["-cp", ".", "Util","input", mensaje]) do
        {output, 0} ->
        String.trim(output)
        {_error, _code} ->
        nil
        end
  end
end
