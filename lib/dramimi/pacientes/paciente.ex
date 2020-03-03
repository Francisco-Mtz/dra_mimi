defmodule Dramimi.Pacientes.Paciente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pacientes" do
    field :edad, :integer
    field :genero, :string
    field :nombre, :string
    field :telefono, :integer

    timestamps()
  end

  @doc false
  def changeset(paciente, attrs) do
    paciente
    |> cast(attrs, [:nombre, :edad, :genero, :telefono])
    |> validate_required([:nombre, :edad, :genero, :telefono])
  end
end
