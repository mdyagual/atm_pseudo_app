defmodule AtmPseudoApp.PropietariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AtmPseudoApp.Propietarios` context.
  """

  @doc """
  Generate a propietario.
  """
  def propietario_fixture(attrs \\ %{}) do
    {:ok, propietario} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        fecha_nac: ~D[2023-05-04],
        nombres: "some nombres",
        num_id: "some num_id"
      })
      |> AtmPseudoApp.Propietarios.create_propietario()

    propietario
  end
end
