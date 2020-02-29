defmodule Dramimi.Repo.Migrations.CreateServicios do
  use Ecto.Migration

  def change do
    create table(:servicios) do
      add :nombre, :string
      add :precio, :float

      timestamps()
    end

  end
end
