defmodule Dramimi.Medicamentos_vendidos do
  @moduledoc """
  The Medicamentos_vendidos context.
  """

  import Ecto.Query, warn: false
  alias Dramimi.Repo

  alias Dramimi.Medicamentos_vendidos.Medicamento_vendido

  @doc """
  Returns the list of medicamentos_vendidos.

  ## Examples

      iex> list_medicamentos_vendidos()
      [%Medicamento_vendido{}, ...]

  """
  def list_medicamentos_vendidos do
    Repo.all(Medicamento_vendido)
  end

  @doc """
  Gets a single medicamento_vendido.

  Raises `Ecto.NoResultsError` if the Medicamento vendido does not exist.

  ## Examples

      iex> get_medicamento_vendido!(123)
      %Medicamento_vendido{}

      iex> get_medicamento_vendido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medicamento_vendido!(id), do: Repo.get!(Medicamento_vendido, id)

  @doc """
  Creates a medicamento_vendido.

  ## Examples

      iex> create_medicamento_vendido(%{field: value})
      {:ok, %Medicamento_vendido{}}

      iex> create_medicamento_vendido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medicamento_vendido(attrs \\ %{}) do
    %Medicamento_vendido{}
    |> Medicamento_vendido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medicamento_vendido.

  ## Examples

      iex> update_medicamento_vendido(medicamento_vendido, %{field: new_value})
      {:ok, %Medicamento_vendido{}}

      iex> update_medicamento_vendido(medicamento_vendido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medicamento_vendido(%Medicamento_vendido{} = medicamento_vendido, attrs) do
    medicamento_vendido
    |> Medicamento_vendido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medicamento_vendido.

  ## Examples

      iex> delete_medicamento_vendido(medicamento_vendido)
      {:ok, %Medicamento_vendido{}}

      iex> delete_medicamento_vendido(medicamento_vendido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medicamento_vendido(%Medicamento_vendido{} = medicamento_vendido) do
    Repo.delete(medicamento_vendido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medicamento_vendido changes.

  ## Examples

      iex> change_medicamento_vendido(medicamento_vendido)
      %Ecto.Changeset{source: %Medicamento_vendido{}}

  """
  def change_medicamento_vendido(%Medicamento_vendido{} = medicamento_vendido) do
    Medicamento_vendido.changeset(medicamento_vendido, %{})
  end
end
