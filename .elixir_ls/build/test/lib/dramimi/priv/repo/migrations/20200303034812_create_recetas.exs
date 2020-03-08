defmodule Dramimi.Repo.Migrations.CreateRecetas do
  use Ecto.Migration

  def change do
    create table(:recetas) do
      add :idPaciente, :integer
      add :idServicio, :integer
      add :diagnostico, :string
      add :peso, :integer
      add :altura, :integer
      add :temperatura, :integer
      add :frecuenciaCardiaca, :string
      add :presionArterial, :string
      add :frecuenciaRespiratoria, :string

      timestamps()
    end

  end
end
