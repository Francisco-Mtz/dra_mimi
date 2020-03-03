defmodule Dramimi.Repo.Migrations.CreateMedicamentos do
  use Ecto.Migration

  def change do
    create table(:medicamentos) do
      add :nombreComercial, :string
      add :nombreGenerico, :string
      add :presentacion, :string
      add :laboratorio, :string
      add :precio, :float
      add :stock, :integer

      timestamps()
    end

  end
end
