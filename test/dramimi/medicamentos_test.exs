defmodule Dramimi.MedicamentosTest do
  use Dramimi.DataCase

  alias Dramimi.Medicamentos

  describe "medicamentos" do
    alias Dramimi.Medicamentos.Medicamento

    @valid_attrs %{laboratorio: "some laboratorio", nombreComercial: "some nombreComercial", nombreGenerico: "some nombreGenerico", precio: 120.5, presentacion: "some presentacion", stock: 42}
    @update_attrs %{laboratorio: "some updated laboratorio", nombreComercial: "some updated nombreComercial", nombreGenerico: "some updated nombreGenerico", precio: 456.7, presentacion: "some updated presentacion", stock: 43}
    @invalid_attrs %{laboratorio: nil, nombreComercial: nil, nombreGenerico: nil, precio: nil, presentacion: nil, stock: nil}

    def medicamento_fixture(attrs \\ %{}) do
      {:ok, medicamento} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medicamentos.create_medicamento()

      medicamento
    end

    test "list_medicamentos/0 returns all medicamentos" do
      medicamento = medicamento_fixture()
      assert Medicamentos.list_medicamentos() == [medicamento]
    end

    test "get_medicamento!/1 returns the medicamento with given id" do
      medicamento = medicamento_fixture()
      assert Medicamentos.get_medicamento!(medicamento.id) == medicamento
    end

    test "create_medicamento/1 with valid data creates a medicamento" do
      assert {:ok, %Medicamento{} = medicamento} = Medicamentos.create_medicamento(@valid_attrs)
      assert medicamento.laboratorio == "some laboratorio"
      assert medicamento.nombreComercial == "some nombreComercial"
      assert medicamento.nombreGenerico == "some nombreGenerico"
      assert medicamento.precio == 120.5
      assert medicamento.presentacion == "some presentacion"
      assert medicamento.stock == 42
    end

    test "create_medicamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medicamentos.create_medicamento(@invalid_attrs)
    end

    test "update_medicamento/2 with valid data updates the medicamento" do
      medicamento = medicamento_fixture()
      assert {:ok, %Medicamento{} = medicamento} = Medicamentos.update_medicamento(medicamento, @update_attrs)
      assert medicamento.laboratorio == "some updated laboratorio"
      assert medicamento.nombreComercial == "some updated nombreComercial"
      assert medicamento.nombreGenerico == "some updated nombreGenerico"
      assert medicamento.precio == 456.7
      assert medicamento.presentacion == "some updated presentacion"
      assert medicamento.stock == 43
    end

    test "update_medicamento/2 with invalid data returns error changeset" do
      medicamento = medicamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Medicamentos.update_medicamento(medicamento, @invalid_attrs)
      assert medicamento == Medicamentos.get_medicamento!(medicamento.id)
    end

    test "delete_medicamento/1 deletes the medicamento" do
      medicamento = medicamento_fixture()
      assert {:ok, %Medicamento{}} = Medicamentos.delete_medicamento(medicamento)
      assert_raise Ecto.NoResultsError, fn -> Medicamentos.get_medicamento!(medicamento.id) end
    end

    test "change_medicamento/1 returns a medicamento changeset" do
      medicamento = medicamento_fixture()
      assert %Ecto.Changeset{} = Medicamentos.change_medicamento(medicamento)
    end
  end
end
