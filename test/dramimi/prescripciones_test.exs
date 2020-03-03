defmodule Dramimi.PrescripcionesTest do
  use Dramimi.DataCase

  alias Dramimi.Prescripciones

  describe "prescripciones" do
    alias Dramimi.Prescripciones.Prescripcion

    @valid_attrs %{dosis: "some dosis", duracion: "some duracion", idMedicamento: 42, idReceta: 42, indicaciones: "some indicaciones"}
    @update_attrs %{dosis: "some updated dosis", duracion: "some updated duracion", idMedicamento: 43, idReceta: 43, indicaciones: "some updated indicaciones"}
    @invalid_attrs %{dosis: nil, duracion: nil, idMedicamento: nil, idReceta: nil, indicaciones: nil}

    def prescripcion_fixture(attrs \\ %{}) do
      {:ok, prescripcion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prescripciones.create_prescripcion()

      prescripcion
    end

    test "list_prescripciones/0 returns all prescripciones" do
      prescripcion = prescripcion_fixture()
      assert Prescripciones.list_prescripciones() == [prescripcion]
    end

    test "get_prescripcion!/1 returns the prescripcion with given id" do
      prescripcion = prescripcion_fixture()
      assert Prescripciones.get_prescripcion!(prescripcion.id) == prescripcion
    end

    test "create_prescripcion/1 with valid data creates a prescripcion" do
      assert {:ok, %Prescripcion{} = prescripcion} = Prescripciones.create_prescripcion(@valid_attrs)
      assert prescripcion.dosis == "some dosis"
      assert prescripcion.duracion == "some duracion"
      assert prescripcion.idMedicamento == 42
      assert prescripcion.idReceta == 42
      assert prescripcion.indicaciones == "some indicaciones"
    end

    test "create_prescripcion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prescripciones.create_prescripcion(@invalid_attrs)
    end

    test "update_prescripcion/2 with valid data updates the prescripcion" do
      prescripcion = prescripcion_fixture()
      assert {:ok, %Prescripcion{} = prescripcion} = Prescripciones.update_prescripcion(prescripcion, @update_attrs)
      assert prescripcion.dosis == "some updated dosis"
      assert prescripcion.duracion == "some updated duracion"
      assert prescripcion.idMedicamento == 43
      assert prescripcion.idReceta == 43
      assert prescripcion.indicaciones == "some updated indicaciones"
    end

    test "update_prescripcion/2 with invalid data returns error changeset" do
      prescripcion = prescripcion_fixture()
      assert {:error, %Ecto.Changeset{}} = Prescripciones.update_prescripcion(prescripcion, @invalid_attrs)
      assert prescripcion == Prescripciones.get_prescripcion!(prescripcion.id)
    end

    test "delete_prescripcion/1 deletes the prescripcion" do
      prescripcion = prescripcion_fixture()
      assert {:ok, %Prescripcion{}} = Prescripciones.delete_prescripcion(prescripcion)
      assert_raise Ecto.NoResultsError, fn -> Prescripciones.get_prescripcion!(prescripcion.id) end
    end

    test "change_prescripcion/1 returns a prescripcion changeset" do
      prescripcion = prescripcion_fixture()
      assert %Ecto.Changeset{} = Prescripciones.change_prescripcion(prescripcion)
    end
  end
end
