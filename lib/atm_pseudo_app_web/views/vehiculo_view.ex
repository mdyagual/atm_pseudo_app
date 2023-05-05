defmodule AtmPseudoAppWeb.VehiculoView do
  use AtmPseudoAppWeb, :view
  alias AtmPseudoAppWeb.VehiculoView

  def render("index.json", %{vehiculos: vehiculos}) do
    %{data: render_many(vehiculos, VehiculoView, "vehiculo.json")}
  end

  def render("show.json", %{vehiculo: vehiculo}) do
    %{data: render_one(vehiculo, VehiculoView, "vehiculo.json")}
  end

  def render("vehiculo.json", %{vehiculo: vehiculo}) do
    #Bring the propietario
    propietario = [vehiculo.propietario]
                  |> Enum.map(& Map.from_struct(&1))
                  |> Enum.map(& Enum.reduce([:__meta__, :vehiculos, :inserted_at, :updated_at], &1, fn key, val -> Map.delete(val, key) end))
                  |> List.first
    %{
      id: vehiculo.id,
      placa: vehiculo.placa,
      tipo: vehiculo.tipo,
      marca: vehiculo.marca,
      modelo: vehiculo.modelo,
      color: vehiculo.color,
      anio: vehiculo.anio,
      propietario: propietario
    }
  end
end
