defmodule Dramimi.ServiciosTest do
  use Dramimi.DataCase

  alias Dramimi.Servicios

  describe "servicios" do
    alias Dramimi.Servicios.Servicio

    @valid_attrs %{descripcion: "some descripcion", nombre: "some nombre", precio: 120.5}
    @update_attrs %{descripcion: "some updated descripcion", nombre: "some updated nombre", precio: 456.7}
    @invalid_attrs %{descripcion: nil, nombre: nil, precio: nil}

    def servicio_fixture(attrs \\ %{}) do
      {:ok, servicio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Servicios.create_servicio()

      servicio
    end

    test "list_servicios/0 returns all servicios" do
      servicio = servicio_fixture()
      assert Servicios.list_servicios() == [servicio]
    end

    test "get_servicio!/1 returns the servicio with given id" do
      servicio = servicio_fixture()
      assert Servicios.get_servicio!(servicio.id) == servicio
    end

    test "create_servicio/1 with valid data creates a servicio" do
      assert {:ok, %Servicio{} = servicio} = Servicios.create_servicio(@valid_attrs)
      assert servicio.descripcion == "some descripcion"
      assert servicio.nombre == "some nombre"
      assert servicio.precio == 120.5
    end

    test "create_servicio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Servicios.create_servicio(@invalid_attrs)
    end

    test "update_servicio/2 with valid data updates the servicio" do
      servicio = servicio_fixture()
      assert {:ok, %Servicio{} = servicio} = Servicios.update_servicio(servicio, @update_attrs)
      assert servicio.descripcion == "some updated descripcion"
      assert servicio.nombre == "some updated nombre"
      assert servicio.precio == 456.7
    end

    test "update_servicio/2 with invalid data returns error changeset" do
      servicio = servicio_fixture()
      assert {:error, %Ecto.Changeset{}} = Servicios.update_servicio(servicio, @invalid_attrs)
      assert servicio == Servicios.get_servicio!(servicio.id)
    end

    test "delete_servicio/1 deletes the servicio" do
      servicio = servicio_fixture()
      assert {:ok, %Servicio{}} = Servicios.delete_servicio(servicio)
      assert_raise Ecto.NoResultsError, fn -> Servicios.get_servicio!(servicio.id) end
    end

    test "change_servicio/1 returns a servicio changeset" do
      servicio = servicio_fixture()
      assert %Ecto.Changeset{} = Servicios.change_servicio(servicio)
    end
  end
end
