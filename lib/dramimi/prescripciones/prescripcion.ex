defmodule Dramimi.Prescripciones.Prescripcion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prescripciones" do
    field :dosis, :string
    field :duracion, :string
    field :idMedicamento, :integer
    field :idReceta, :integer
    field :indicaciones, :string

    timestamps()
  end

  @doc false
  def changeset(prescripcion, attrs) do
    prescripcion
    |> cast(attrs, [:idMedicamento, :idReceta, :duracion, :dosis, :indicaciones])
    |> validate_required([:idMedicamento, :idReceta, :duracion, :dosis, :indicaciones])
  end
end
