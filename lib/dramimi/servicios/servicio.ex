defmodule Dramimi.Servicios.Servicio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servicios" do
    field :descripcion, :string
    field :nombre, :string
    field :precio, :float

    timestamps()
  end

  @doc false
  def changeset(servicio, attrs) do
    servicio
    |> cast(attrs, [:nombre, :descripcion, :precio])
    |> validate_required([:nombre, :descripcion, :precio])
  end
end
