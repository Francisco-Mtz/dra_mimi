defmodule Dramimi.Servicios_vendidosTest do
  use Dramimi.DataCase

  alias Dramimi.Servicios_vendidos

  describe "servicios_vendidos" do
    alias Dramimi.Servicios_vendidos.Servicio_vendido

    @valid_attrs %{idServicio: 42, idVenta: 42}
    @update_attrs %{idServicio: 43, idVenta: 43}
    @invalid_attrs %{idServicio: nil, idVenta: nil}

    def servicio_vendido_fixture(attrs \\ %{}) do
      {:ok, servicio_vendido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Servicios_vendidos.create_servicio_vendido()

      servicio_vendido
    end

    test "list_servicios_vendidos/0 returns all servicios_vendidos" do
      servicio_vendido = servicio_vendido_fixture()
      assert Servicios_vendidos.list_servicios_vendidos() == [servicio_vendido]
    end

    test "get_servicio_vendido!/1 returns the servicio_vendido with given id" do
      servicio_vendido = servicio_vendido_fixture()
      assert Servicios_vendidos.get_servicio_vendido!(servicio_vendido.id) == servicio_vendido
    end

    test "create_servicio_vendido/1 with valid data creates a servicio_vendido" do
      assert {:ok, %Servicio_vendido{} = servicio_vendido} = Servicios_vendidos.create_servicio_vendido(@valid_attrs)
      assert servicio_vendido.idServicio == 42
      assert servicio_vendido.idVenta == 42
    end

    test "create_servicio_vendido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Servicios_vendidos.create_servicio_vendido(@invalid_attrs)
    end

    test "update_servicio_vendido/2 with valid data updates the servicio_vendido" do
      servicio_vendido = servicio_vendido_fixture()
      assert {:ok, %Servicio_vendido{} = servicio_vendido} = Servicios_vendidos.update_servicio_vendido(servicio_vendido, @update_attrs)
      assert servicio_vendido.idServicio == 43
      assert servicio_vendido.idVenta == 43
    end

    test "update_servicio_vendido/2 with invalid data returns error changeset" do
      servicio_vendido = servicio_vendido_fixture()
      assert {:error, %Ecto.Changeset{}} = Servicios_vendidos.update_servicio_vendido(servicio_vendido, @invalid_attrs)
      assert servicio_vendido == Servicios_vendidos.get_servicio_vendido!(servicio_vendido.id)
    end

    test "delete_servicio_vendido/1 deletes the servicio_vendido" do
      servicio_vendido = servicio_vendido_fixture()
      assert {:ok, %Servicio_vendido{}} = Servicios_vendidos.delete_servicio_vendido(servicio_vendido)
      assert_raise Ecto.NoResultsError, fn -> Servicios_vendidos.get_servicio_vendido!(servicio_vendido.id) end
    end

    test "change_servicio_vendido/1 returns a servicio_vendido changeset" do
      servicio_vendido = servicio_vendido_fixture()
      assert %Ecto.Changeset{} = Servicios_vendidos.change_servicio_vendido(servicio_vendido)
    end
  end
end
