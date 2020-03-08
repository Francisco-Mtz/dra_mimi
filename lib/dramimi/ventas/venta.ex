defmodule Dramimi.Ventas.Venta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ventas" do
    field :total, :float

    timestamps()
  end

  @doc false
  def changeset(venta, attrs) do
    venta
    |> cast(attrs, [:total])
    |> validate_required([:total])
  end
end
