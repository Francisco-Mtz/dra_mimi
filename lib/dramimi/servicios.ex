defmodule Dramimi.Servicios do
  @moduledoc """
  The Servicios context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Servicios.Servicio

  @doc """
  Returns the list of servicios.

  ## Examples

      iex> list_servicios()
      [%Servicio{}, ...]

  """
  def list_servicios do
    Repo.all(Servicio)
  end

  @doc """
  Gets a single servicio.

  Raises `Ecto.NoResultsError` if the Servicio does not exist.

  ## Examples

      iex> get_servicio!(123)
      %Servicio{}

      iex> get_servicio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_servicio!(id), do: Repo.get!(Servicio, id)

  @doc """
  Creates a servicio.

  ## Examples

      iex> create_servicio(%{field: value})
      {:ok, %Servicio{}}

      iex> create_servicio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_servicio(attrs \\ %{}) do
    %Servicio{}
    |> Servicio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a servicio.

  ## Examples

      iex> update_servicio(servicio, %{field: new_value})
      {:ok, %Servicio{}}

      iex> update_servicio(servicio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_servicio(%Servicio{} = servicio, attrs) do
    servicio
    |> Servicio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a servicio.

  ## Examples

      iex> delete_servicio(servicio)
      {:ok, %Servicio{}}

      iex> delete_servicio(servicio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_servicio(%Servicio{} = servicio) do
    Repo.delete(servicio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking servicio changes.

  ## Examples

      iex> change_servicio(servicio)
      %Ecto.Changeset{source: %Servicio{}}

  """
  def change_servicio(%Servicio{} = servicio) do
    Servicio.changeset(servicio, %{})
  end
end
