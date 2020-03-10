defmodule Dramimi.VentasTest do
  use Dramimi.DataCase

  alias Dramimi.Ventas

  describe "ventas" do
    alias Dramimi.Ventas.Venta

    @valid_attrs %{total: 120.5}
    @update_attrs %{total: 456.7}
    @invalid_attrs %{total: nil}

    def venta_fixture(attrs \\ %{}) do
      {:ok, venta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ventas.create_venta()

      venta
    end

    test "list_ventas/0 returns all ventas" do
      venta = venta_fixture()
      assert Ventas.list_ventas() == [venta]
    end

    test "get_venta!/1 returns the venta with given id" do
      venta = venta_fixture()
      assert Ventas.get_venta!(venta.id) == venta
    end

    test "create_venta/1 with valid data creates a venta" do
      assert {:ok, %Venta{} = venta} = Ventas.create_venta(@valid_attrs)
      assert venta.total == 120.5
    end

    test "create_venta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ventas.create_venta(@invalid_attrs)
    end

    test "update_venta/2 with valid data updates the venta" do
      venta = venta_fixture()
      assert {:ok, %Venta{} = venta} = Ventas.update_venta(venta, @update_attrs)
      assert venta.total == 456.7
    end

    test "update_venta/2 with invalid data returns error changeset" do
      venta = venta_fixture()
      assert {:error, %Ecto.Changeset{}} = Ventas.update_venta(venta, @invalid_attrs)
      assert venta == Ventas.get_venta!(venta.id)
    end

    test "delete_venta/1 deletes the venta" do
      venta = venta_fixture()
      assert {:ok, %Venta{}} = Ventas.delete_venta(venta)
      assert_raise Ecto.NoResultsError, fn -> Ventas.get_venta!(venta.id) end
    end

    test "change_venta/1 returns a venta changeset" do
      venta = venta_fixture()
      assert %Ecto.Changeset{} = Ventas.change_venta(venta)
    end
  end
end
