defmodule AtmPseudoApp.Propietarios do
  @moduledoc """
  The Propietarios context.
  """

  import Ecto.Query, warn: false
  alias AtmPseudoApp.Repo

  alias AtmPseudoApp.Propietarios.Propietario

  @doc """
  Returns the list of propietarios.

  ## Examples

      iex> list_propietarios()
      [%Propietario{}, ...]

  """
  def list_propietarios do
    Repo.all(Propietario) |> Repo.preload(:vehiculos)
  end

  @doc """
  Gets a single propietario.

  Raises `Ecto.NoResultsError` if the Propietario does not exist.

  ## Examples

      iex> get_propietario!(123)
      %Propietario{}

      iex> get_propietario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_propietario!(id), do: Repo.get!(Propietario, id) |> Repo.preload(:vehiculos)

  @doc """
  Creates a propietario.

  ## Examples

      iex> create_propietario(%{field: value})
      {:ok, %Propietario{}}

      iex> create_propietario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_propietario(attrs \\ %{}) do
    %Propietario{}
    |> Repo.preload(:vehiculos)
    |> Propietario.changeset(attrs)

    |> Repo.insert()
  end

  @doc """
  Updates a propietario.

  ## Examples

      iex> update_propietario(propietario, %{field: new_value})
      {:ok, %Propietario{}}

      iex> update_propietario(propietario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_propietario(%Propietario{} = propietario, attrs) do
    propietario
    |> Propietario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a propietario.

  ## Examples

      iex> delete_propietario(propietario)
      {:ok, %Propietario{}}

      iex> delete_propietario(propietario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_propietario(%Propietario{} = propietario) do
    Repo.delete(propietario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking propietario changes.

  ## Examples

      iex> change_propietario(propietario)
      %Ecto.Changeset{data: %Propietario{}}

  """
  def change_propietario(%Propietario{} = propietario, attrs \\ %{}) do
    Propietario.changeset(propietario, attrs)
  end
end
