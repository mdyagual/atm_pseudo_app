defmodule AtmPseudoApp.Vehiculos do
  @moduledoc """
  The Vehiculos context.
  """

  import Ecto.Query, warn: false
  alias AtmPseudoApp.Repo

  alias AtmPseudoApp.Vehiculos.Vehiculo

  @doc """
  Returns the list of vehiculos.

  ## Examples

      iex> list_vehiculos()
      [%Vehiculo{}, ...]

  """
  def list_vehiculos do
    Repo.all(Vehiculo) |> Repo.preload(:propietario)
  end

  @doc """
  Gets a single vehiculo.

  Raises `Ecto.NoResultsError` if the Vehiculo does not exist.

  ## Examples

      iex> get_vehiculo!(123)
      %Vehiculo{}

      iex> get_vehiculo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehiculo!(id), do: Repo.get!(Vehiculo, id) |> Repo.preload(:propietario)

  @doc """
  Creates a vehiculo.

  ## Examples

      iex> create_vehiculo(%{field: value})
      {:ok, %Vehiculo{}}

      iex> create_vehiculo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehiculo(attrs \\ %{}) do
    %Vehiculo{}
    |> Repo.preload(:propietario)
    |> Vehiculo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vehiculo.

  ## Examples

      iex> update_vehiculo(vehiculo, %{field: new_value})
      {:ok, %Vehiculo{}}

      iex> update_vehiculo(vehiculo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehiculo(%Vehiculo{} = vehiculo, attrs) do
    vehiculo
    |> Vehiculo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vehiculo.

  ## Examples

      iex> delete_vehiculo(vehiculo)
      {:ok, %Vehiculo{}}

      iex> delete_vehiculo(vehiculo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehiculo(%Vehiculo{} = vehiculo) do
    Repo.delete(vehiculo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehiculo changes.

  ## Examples

      iex> change_vehiculo(vehiculo)
      %Ecto.Changeset{data: %Vehiculo{}}

  """
  def change_vehiculo(%Vehiculo{} = vehiculo, attrs \\ %{}) do
    Vehiculo.changeset(vehiculo, attrs)
  end
end
