defmodule Dramimi.Medicamentos_vendidosTest do
  use Dramimi.DataCase

  alias Dramimi.Medicamentos_vendidos

  describe "medicamentos_vendidos" do
    alias Dramimi.Medicamentos_vendidos.Medicamento_vendido

    @valid_attrs %{idMedicamento: 42, idVenta: 42}
    @update_attrs %{idMedicamento: 43, idVenta: 43}
    @invalid_attrs %{idMedicamento: nil, idVenta: nil}

    def medicamento_vendido_fixture(attrs \\ %{}) do
      {:ok, medicamento_vendido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medicamentos_vendidos.create_medicamento_vendido()

      medicamento_vendido
    end

    test "list_medicamentos_vendidos/0 returns all medicamentos_vendidos" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert Medicamentos_vendidos.list_medicamentos_vendidos() == [medicamento_vendido]
    end

    test "get_medicamento_vendido!/1 returns the medicamento_vendido with given id" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert Medicamentos_vendidos.get_medicamento_vendido!(medicamento_vendido.id) == medicamento_vendido
    end

    test "create_medicamento_vendido/1 with valid data creates a medicamento_vendido" do
      assert {:ok, %Medicamento_vendido{} = medicamento_vendido} = Medicamentos_vendidos.create_medicamento_vendido(@valid_attrs)
      assert medicamento_vendido.idMedicamento == 42
      assert medicamento_vendido.idVenta == 42
    end

    test "create_medicamento_vendido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medicamentos_vendidos.create_medicamento_vendido(@invalid_attrs)
    end

    test "update_medicamento_vendido/2 with valid data updates the medicamento_vendido" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert {:ok, %Medicamento_vendido{} = medicamento_vendido} = Medicamentos_vendidos.update_medicamento_vendido(medicamento_vendido, @update_attrs)
      assert medicamento_vendido.idMedicamento == 43
      assert medicamento_vendido.idVenta == 43
    end

    test "update_medicamento_vendido/2 with invalid data returns error changeset" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert {:error, %Ecto.Changeset{}} = Medicamentos_vendidos.update_medicamento_vendido(medicamento_vendido, @invalid_attrs)
      assert medicamento_vendido == Medicamentos_vendidos.get_medicamento_vendido!(medicamento_vendido.id)
    end

    test "delete_medicamento_vendido/1 deletes the medicamento_vendido" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert {:ok, %Medicamento_vendido{}} = Medicamentos_vendidos.delete_medicamento_vendido(medicamento_vendido)
      assert_raise Ecto.NoResultsError, fn -> Medicamentos_vendidos.get_medicamento_vendido!(medicamento_vendido.id) end
    end

    test "change_medicamento_vendido/1 returns a medicamento_vendido changeset" do
      medicamento_vendido = medicamento_vendido_fixture()
      assert %Ecto.Changeset{} = Medicamentos_vendidos.change_medicamento_vendido(medicamento_vendido)
    end
  end
end
