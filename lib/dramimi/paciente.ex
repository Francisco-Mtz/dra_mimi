defmodule Dramimi.Paciente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pacientes" do
    field :edad, :integer
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(paciente, attrs  \\ %{}) do
    paciente
    |> cast(attrs, [:nombre, :edad])
    |> validate_required([:nombre, :edad])
  end
end
