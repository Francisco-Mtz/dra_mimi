defmodule Dramimi.Servicios_vendidos.Servicio_vendido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servicios_vendidos" do
    field :idServicio, :integer
    field :idVenta, :integer

    timestamps()
  end

  @doc false
  def changeset(servicio_vendido, attrs) do
    servicio_vendido
    |> cast(attrs, [:idVenta, :idServicio])
    |> validate_required([:idVenta, :idServicio])
  end
end
