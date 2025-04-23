defmodule Reserva do
  defstruct [
    id: nil,
    fecha_reserva: nil,
    fecha_entrada: nil,
    total: nil,
    cliente: nil,
    habitaciones: []
  ]
end
