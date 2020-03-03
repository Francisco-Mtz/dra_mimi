defmodule Dramimi.RecetasTest do
  use Dramimi.DataCase

  alias Dramimi.Recetas

  describe "recetas" do
    alias Dramimi.Recetas.Receta

    @valid_attrs %{altura: 42, diagnostico: "some diagnostico", frecuenciaCardiaca: "some frecuenciaCardiaca", frecuenciaRespiratoria: "some frecuenciaRespiratoria", idPaciente: 42, idServicio: 42, peso: 42, presionArterial: "some presionArterial", temperatura: 42}
    @update_attrs %{altura: 43, diagnostico: "some updated diagnostico", frecuenciaCardiaca: "some updated frecuenciaCardiaca", frecuenciaRespiratoria: "some updated frecuenciaRespiratoria", idPaciente: 43, idServicio: 43, peso: 43, presionArterial: "some updated presionArterial", temperatura: 43}
    @invalid_attrs %{altura: nil, diagnostico: nil, frecuenciaCardiaca: nil, frecuenciaRespiratoria: nil, idPaciente: nil, idServicio: nil, peso: nil, presionArterial: nil, temperatura: nil}

    def receta_fixture(attrs \\ %{}) do
      {:ok, receta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recetas.create_receta()

      receta
    end

    test "list_recetas/0 returns all recetas" do
      receta = receta_fixture()
      assert Recetas.list_recetas() == [receta]
    end

    test "get_receta!/1 returns the receta with given id" do
      receta = receta_fixture()
      assert Recetas.get_receta!(receta.id) == receta
    end

    test "create_receta/1 with valid data creates a receta" do
      assert {:ok, %Receta{} = receta} = Recetas.create_receta(@valid_attrs)
      assert receta.altura == 42
      assert receta.diagnostico == "some diagnostico"
      assert receta.frecuenciaCardiaca == "some frecuenciaCardiaca"
      assert receta.frecuenciaRespiratoria == "some frecuenciaRespiratoria"
      assert receta.idPaciente == 42
      assert receta.idServicio == 42
      assert receta.peso == 42
      assert receta.presionArterial == "some presionArterial"
      assert receta.temperatura == 42
    end

    test "create_receta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recetas.create_receta(@invalid_attrs)
    end

    test "update_receta/2 with valid data updates the receta" do
      receta = receta_fixture()
      assert {:ok, %Receta{} = receta} = Recetas.update_receta(receta, @update_attrs)
      assert receta.altura == 43
      assert receta.diagnostico == "some updated diagnostico"
      assert receta.frecuenciaCardiaca == "some updated frecuenciaCardiaca"
      assert receta.frecuenciaRespiratoria == "some updated frecuenciaRespiratoria"
      assert receta.idPaciente == 43
      assert receta.idServicio == 43
      assert receta.peso == 43
      assert receta.presionArterial == "some updated presionArterial"
      assert receta.temperatura == 43
    end

    test "update_receta/2 with invalid data returns error changeset" do
      receta = receta_fixture()
      assert {:error, %Ecto.Changeset{}} = Recetas.update_receta(receta, @invalid_attrs)
      assert receta == Recetas.get_receta!(receta.id)
    end

    test "delete_receta/1 deletes the receta" do
      receta = receta_fixture()
      assert {:ok, %Receta{}} = Recetas.delete_receta(receta)
      assert_raise Ecto.NoResultsError, fn -> Recetas.get_receta!(receta.id) end
    end

    test "change_receta/1 returns a receta changeset" do
      receta = receta_fixture()
      assert %Ecto.Changeset{} = Recetas.change_receta(receta)
    end
  end
end
