defmodule Dramimi.Repo.Migrations.CreateMedicamentosVendidos do
  use Ecto.Migration

  def change do
    create table(:medicamentos_vendidos) do
      add :idVenta, :integer
      add :idMedicamento, :integer

      timestamps()
    end

  end
end
