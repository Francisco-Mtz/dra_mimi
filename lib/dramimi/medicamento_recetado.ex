defmodule Dramimi.MedicamentoRecetado do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos_recetados" do
    field :generico, :boolean, default: false
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(medicamento_recetado, attrs  \\ %{}) do
    medicamento_recetado
    |> cast(attrs, [:nombre, :generico])
    |> validate_required([:nombre, :generico])
  end
end
