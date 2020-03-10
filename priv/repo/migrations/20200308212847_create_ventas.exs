defmodule Dramimi.Repo.Migrations.CreateVentas do
  use Ecto.Migration

  def change do
    create table(:ventas) do
      add :total, :float

      timestamps()
    end

  end
end
