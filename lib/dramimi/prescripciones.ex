defmodule Dramimi.Prescripciones do
  @moduledoc """
  The Prescripciones context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Prescripciones.Prescripcion

  @doc """
  Returns the list of prescripciones.

  ## Examples

      iex> list_prescripciones()
      [%Prescripcion{}, ...]

  """
  def list_prescripciones do
    Repo.all(Prescripcion)
  end

  @doc """
  Gets a single prescripcion.

  Raises `Ecto.NoResultsError` if the Prescripcion does not exist.

  ## Examples

      iex> get_prescripcion!(123)
      %Prescripcion{}

      iex> get_prescripcion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prescripcion!(id), do: Repo.get!(Prescripcion, id)

  @doc """
  Creates a prescripcion.

  ## Examples

      iex> create_prescripcion(%{field: value})
      {:ok, %Prescripcion{}}

      iex> create_prescripcion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prescripcion(attrs \\ %{}) do
    %Prescripcion{}
    |> Prescripcion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prescripcion.

  ## Examples

      iex> update_prescripcion(prescripcion, %{field: new_value})
      {:ok, %Prescripcion{}}

      iex> update_prescripcion(prescripcion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prescripcion(%Prescripcion{} = prescripcion, attrs) do
    prescripcion
    |> Prescripcion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prescripcion.

  ## Examples

      iex> delete_prescripcion(prescripcion)
      {:ok, %Prescripcion{}}

      iex> delete_prescripcion(prescripcion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prescripcion(%Prescripcion{} = prescripcion) do
    Repo.delete(prescripcion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prescripcion changes.

  ## Examples

      iex> change_prescripcion(prescripcion)
      %Ecto.Changeset{source: %Prescripcion{}}

  """
  def change_prescripcion(%Prescripcion{} = prescripcion) do
    Prescripcion.changeset(prescripcion, %{})
  end
end
