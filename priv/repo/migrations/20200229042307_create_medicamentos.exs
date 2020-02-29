defmodule Dramimi.Repo.Migrations.CreateMedicamentos do
  use Ecto.Migration

  def change do
    create table(:medicamentos) do
      add :nombre, :string
      add :precio, :float
      add :generico, :boolean, default: false, null: false

      timestamps()
    end

  end
end
