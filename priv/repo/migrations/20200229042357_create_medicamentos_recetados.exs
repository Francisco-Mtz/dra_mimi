defmodule Dramimi.Repo.Migrations.CreateMedicamentosRecetados do
  use Ecto.Migration

  def change do
    create table(:medicamentos_recetados) do
      add :nombre, :string
      add :generico, :boolean, default: false, null: false

      timestamps()
    end

  end
end
