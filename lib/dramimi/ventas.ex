defmodule Dramimi.Ventas do
  @moduledoc """
  The Ventas context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Ventas.Venta

  @doc """
  Returns the list of ventas.

  ## Examples

      iex> list_ventas()
      [%Venta{}, ...]

  """
  def list_ventas do
    Repo.all(Venta)
  end

  @doc """
  Gets a single venta.

  Raises `Ecto.NoResultsError` if the Venta does not exist.

  ## Examples

      iex> get_venta!(123)
      %Venta{}

      iex> get_venta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venta!(id), do: Repo.get!(Venta, id)

  @doc """
  Creates a venta.

  ## Examples

      iex> create_venta(%{field: value})
      {:ok, %Venta{}}

      iex> create_venta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venta(attrs \\ %{}) do
    %Venta{}
    |> Venta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a venta.

  ## Examples

      iex> update_venta(venta, %{field: new_value})
      {:ok, %Venta{}}

      iex> update_venta(venta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venta(%Venta{} = venta, attrs) do
    venta
    |> Venta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a venta.

  ## Examples

      iex> delete_venta(venta)
      {:ok, %Venta{}}

      iex> delete_venta(venta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venta(%Venta{} = venta) do
    Repo.delete(venta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venta changes.

  ## Examples

      iex> change_venta(venta)
      %Ecto.Changeset{source: %Venta{}}

  """
  def change_venta(%Venta{} = venta) do
    Venta.changeset(venta, %{})
  end
end
