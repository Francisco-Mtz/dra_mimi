defmodule Dramimi.Repo.Migrations.CreatePrescripciones do
  use Ecto.Migration

  def change do
    create table(:prescripciones) do
      add :idMedicamento, :integer
      add :idReceta, :integer
      add :duracion, :string
      add :dosis, :string
      add :indicaciones, :string

      timestamps()
    end

  end
end
