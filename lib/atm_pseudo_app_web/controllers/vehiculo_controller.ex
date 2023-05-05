defmodule AtmPseudoAppWeb.VehiculoController do
  use AtmPseudoAppWeb, :controller

  alias AtmPseudoApp.Vehiculos
  alias AtmPseudoApp.Vehiculos.Vehiculo

  action_fallback AtmPseudoAppWeb.FallbackController

  def index(conn, _params) do
    vehiculos = Vehiculos.list_vehiculos()
    render(conn, "index.json", vehiculos: vehiculos)
  end

  def create(conn, %{"vehiculo" => vehiculo_params}) do
    with {:ok, %Vehiculo{} = vehiculo} <- Vehiculos.create_vehiculo(vehiculo_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.vehiculo_path(conn, :show, vehiculo))
      |> render("show.json", vehiculo: vehiculo)
    end
  end

  def show(conn, %{"id" => id}) do
    vehiculo = Vehiculos.get_vehiculo!(id)
    render(conn, "show.json", vehiculo: vehiculo)
  end

  def update(conn, %{"id" => id, "vehiculo" => vehiculo_params}) do
    vehiculo = Vehiculos.get_vehiculo!(id)

    with {:ok, %Vehiculo{} = vehiculo} <- Vehiculos.update_vehiculo(vehiculo, vehiculo_params) do
      render(conn, "show.json", vehiculo: vehiculo)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehiculo = Vehiculos.get_vehiculo!(id)

    with {:ok, %Vehiculo{}} <- Vehiculos.delete_vehiculo(vehiculo) do
      send_resp(conn, :no_content, "")
    end
  end
end
