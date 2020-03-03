defmodule Dramimi.Medicamentos.Medicamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos" do
    field :laboratorio, :string
    field :nombreComercial, :string
    field :nombreGenerico, :string
    field :precio, :float
    field :presentacion, :string
    field :stock, :integer

    timestamps()
  end

  @doc false
  def changeset(medicamento, attrs) do
    medicamento
    |> cast(attrs, [:nombreComercial, :nombreGenerico, :presentacion, :laboratorio, :precio, :stock])
    |> validate_required([:nombreComercial, :nombreGenerico, :presentacion, :laboratorio, :precio, :stock])
  end
end
