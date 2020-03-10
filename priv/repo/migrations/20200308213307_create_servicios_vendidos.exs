defmodule Dramimi.Repo.Migrations.CreateServiciosVendidos do
  use Ecto.Migration

  def change do
    create table(:servicios_vendidos) do
      add :idVenta, :integer
      add :idServicio, :integer

      timestamps()
    end

  end
end
