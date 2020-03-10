defmodule Dramimi.Recetas.Receta do
  use Ecto.Schema
  import Ecto.Changeset
  alias Dramimi.Recetas.Receta

  schema "recetas" do
    field :altura, :integer
    field :diagnostico, :string
    field :frecuenciaCardiaca, :string
    field :frecuenciaRespiratoria, :string
    field :idPaciente, :integer
    field :idServicio, :integer
    field :peso, :integer
    field :presionArterial, :string
    field :temperatura, :integer

    timestamps()
  end

  @doc false
  def changeset(receta, attrs \\ %{}) do
    receta
    |> cast(attrs, [:idPaciente, :idServicio, :diagnostico, :peso, :altura, :temperatura, :frecuenciaCardiaca, :presionArterial, :frecuenciaRespiratoria])
    |> validate_required([:idPaciente, :idServicio, :diagnostico, :peso, :altura, :temperatura, :frecuenciaCardiaca, :presionArterial, :frecuenciaRespiratoria])
  end
end
