defmodule AtmPseudoAppWeb.PropietarioView do
  use AtmPseudoAppWeb, :view
  alias AtmPseudoAppWeb.PropietarioView

  def render("index.json", %{propietarios: propietarios}) do
    %{data: render_many(propietarios, PropietarioView, "propietario.json")}
  end

  def render("show.json", %{propietario: propietario}) do
    %{data: render_one(propietario, PropietarioView, "propietario.json")}
  end

  def render("propietario.json", %{propietario: propietario}) do
    vehiculos = propietario.vehiculos
                |> Enum.map(& Map.from_struct(&1))
                |> Enum.map(& Enum.reduce([:__meta__, :propietario, :propietario_id, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    %{
      id: propietario.id,
      num_id: propietario.num_id,
      nombres: propietario.nombres,
      apellidos: propietario.apellidos,
      fecha_nac: propietario.fecha_nac,
      vehiculos: vehiculos
    }
  end
end
