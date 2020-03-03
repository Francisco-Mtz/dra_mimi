defmodule Dramimi.Recetas do
  @moduledoc """
  The Recetas context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Recetas.Receta

  @doc """
  Returns the list of recetas.

  ## Examples

      iex> list_recetas()
      [%Receta{}, ...]

  """
  def list_recetas do
    Repo.all(Receta)
  end

  @doc """
  Gets a single receta.

  Raises `Ecto.NoResultsError` if the Receta does not exist.

  ## Examples

      iex> get_receta!(123)
      %Receta{}

      iex> get_receta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receta!(id), do: Repo.get!(Receta, id)

  @doc """
  Creates a receta.

  ## Examples

      iex> create_receta(%{field: value})
      {:ok, %Receta{}}

      iex> create_receta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receta(attrs \\ %{}) do
    %Receta{}
    |> Receta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receta.

  ## Examples

      iex> update_receta(receta, %{field: new_value})
      {:ok, %Receta{}}

      iex> update_receta(receta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receta(%Receta{} = receta, attrs) do
    receta
    |> Receta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receta.

  ## Examples

      iex> delete_receta(receta)
      {:ok, %Receta{}}

      iex> delete_receta(receta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receta(%Receta{} = receta) do
    Repo.delete(receta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receta changes.

  ## Examples

      iex> change_receta(receta)
      %Ecto.Changeset{source: %Receta{}}

  """
  def change_receta(%Receta{} = receta) do
    Receta.changeset(receta, %{})
  end
end
