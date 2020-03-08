defmodule Dramimi.Repo.Migrations.CreatePacientes do
  use Ecto.Migration

  def change do
    create table(:pacientes) do
      add :nombre, :string
      add :edad, :integer
      add :genero, :string
      add :telefono, :integer

      timestamps()
    end

  end
end
