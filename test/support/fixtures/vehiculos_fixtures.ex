defmodule AtmPseudoApp.VehiculosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AtmPseudoApp.Vehiculos` context.
  """

  @doc """
  Generate a vehiculo.
  """
  def vehiculo_fixture(attrs \\ %{}) do
    {:ok, vehiculo} =
      attrs
      |> Enum.into(%{
        anio: 42,
        color: "some color",
        marca: "some marca",
        modelo: "some modelo",
        placa: "some placa",
        tipo: "some tipo"
      })
      |> AtmPseudoApp.Vehiculos.create_vehiculo()

    vehiculo
  end
end
