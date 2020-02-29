defmodule Dramimi.Servicio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servicios" do
    field :nombre, :string
    field :precio, :float

    timestamps()
  end

  @doc false
  def changeset(servicio, attrs  \\ %{}) do
    servicio
    |> cast(attrs, [:nombre, :precio])
    |> validate_required([:nombre, :precio])
  end
end
