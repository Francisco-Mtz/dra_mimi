defmodule Dramimi.Servicios_vendidos do
  @moduledoc """
  The Servicios_vendidos context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Servicios_vendidos.Servicio_vendido

  @doc """
  Returns the list of servicios_vendidos.

  ## Examples

      iex> list_servicios_vendidos()
      [%Servicio_vendido{}, ...]

  """
  def list_servicios_vendidos do
    Repo.all(Servicio_vendido)
  end

  @doc """
  Gets a single servicio_vendido.

  Raises `Ecto.NoResultsError` if the Servicio vendido does not exist.

  ## Examples

      iex> get_servicio_vendido!(123)
      %Servicio_vendido{}

      iex> get_servicio_vendido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_servicio_vendido!(id), do: Repo.get!(Servicio_vendido, id)

  @doc """
  Creates a servicio_vendido.

  ## Examples

      iex> create_servicio_vendido(%{field: value})
      {:ok, %Servicio_vendido{}}

      iex> create_servicio_vendido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_servicio_vendido(attrs \\ %{}) do
    %Servicio_vendido{}
    |> Servicio_vendido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a servicio_vendido.

  ## Examples

      iex> update_servicio_vendido(servicio_vendido, %{field: new_value})
      {:ok, %Servicio_vendido{}}

      iex> update_servicio_vendido(servicio_vendido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_servicio_vendido(%Servicio_vendido{} = servicio_vendido, attrs) do
    servicio_vendido
    |> Servicio_vendido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a servicio_vendido.

  ## Examples

      iex> delete_servicio_vendido(servicio_vendido)
      {:ok, %Servicio_vendido{}}

      iex> delete_servicio_vendido(servicio_vendido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_servicio_vendido(%Servicio_vendido{} = servicio_vendido) do
    Repo.delete(servicio_vendido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking servicio_vendido changes.

  ## Examples

      iex> change_servicio_vendido(servicio_vendido)
      %Ecto.Changeset{source: %Servicio_vendido{}}

  """
  def change_servicio_vendido(%Servicio_vendido{} = servicio_vendido) do
    Servicio_vendido.changeset(servicio_vendido, %{})
  end
end
