defmodule Dramimi.PacientesTest do
  use Dramimi.DataCase

  alias Dramimi.Pacientes

  describe "pacientes" do
    alias Dramimi.Pacientes.Paciente

    @valid_attrs %{edad: 42, genero: "some genero", nombre: "some nombre", telefono: 42}
    @update_attrs %{edad: 43, genero: "some updated genero", nombre: "some updated nombre", telefono: 43}
    @invalid_attrs %{edad: nil, genero: nil, nombre: nil, telefono: nil}

    def paciente_fixture(attrs \\ %{}) do
      {:ok, paciente} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pacientes.create_paciente()

      paciente
    end

    test "list_pacientes/0 returns all pacientes" do
      paciente = paciente_fixture()
      assert Pacientes.list_pacientes() == [paciente]
    end

    test "get_paciente!/1 returns the paciente with given id" do
      paciente = paciente_fixture()
      assert Pacientes.get_paciente!(paciente.id) == paciente
    end

    test "create_paciente/1 with valid data creates a paciente" do
      assert {:ok, %Paciente{} = paciente} = Pacientes.create_paciente(@valid_attrs)
      assert paciente.edad == 42
      assert paciente.genero == "some genero"
      assert paciente.nombre == "some nombre"
      assert paciente.telefono == 42
    end

    test "create_paciente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pacientes.create_paciente(@invalid_attrs)
    end

    test "update_paciente/2 with valid data updates the paciente" do
      paciente = paciente_fixture()
      assert {:ok, %Paciente{} = paciente} = Pacientes.update_paciente(paciente, @update_attrs)
      assert paciente.edad == 43
      assert paciente.genero == "some updated genero"
      assert paciente.nombre == "some updated nombre"
      assert paciente.telefono == 43
    end

    test "update_paciente/2 with invalid data returns error changeset" do
      paciente = paciente_fixture()
      assert {:error, %Ecto.Changeset{}} = Pacientes.update_paciente(paciente, @invalid_attrs)
      assert paciente == Pacientes.get_paciente!(paciente.id)
    end

    test "delete_paciente/1 deletes the paciente" do
      paciente = paciente_fixture()
      assert {:ok, %Paciente{}} = Pacientes.delete_paciente(paciente)
      assert_raise Ecto.NoResultsError, fn -> Pacientes.get_paciente!(paciente.id) end
    end

    test "change_paciente/1 returns a paciente changeset" do
      paciente = paciente_fixture()
      assert %Ecto.Changeset{} = Pacientes.change_paciente(paciente)
    end
  end
end
