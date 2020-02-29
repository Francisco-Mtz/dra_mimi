defmodule Dramimi.Repo.Migrations.CreatePacientes do
  use Ecto.Migration

  def change do
    create table(:pacientes) do
      add :nombre, :string
      add :edad, :integer

      timestamps()
    end

  end
end
