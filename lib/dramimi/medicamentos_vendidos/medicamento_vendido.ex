defmodule Dramimi.Medicamentos_vendidos.Medicamento_vendido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos_vendidos" do
    field :idMedicamento, :integer
    field :idVenta, :integer

    timestamps()
  end

  @doc false
  def changeset(medicamento_vendido, attrs) do
    medicamento_vendido
    |> cast(attrs, [:idVenta, :idMedicamento])
    |> validate_required([:idVenta, :idMedicamento])
  end
end
