defmodule Dramimi.Medicamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos" do
    field :generico, :boolean, default: false
    field :nombre, :string
    field :precio, :float

    timestamps()
  end

  @doc false
  def changeset(medicamento, attrs \\ %{}) do
    medicamento
    |> cast(attrs, [:nombre, :precio, :generico])
    |> validate_required([:nombre, :precio, :generico])
  end
end
