defmodule AtmPseudoAppWeb.PropietarioController do
  use AtmPseudoAppWeb, :controller

  alias AtmPseudoApp.Propietarios
  alias AtmPseudoApp.Propietarios.Propietario

  action_fallback AtmPseudoAppWeb.FallbackController

  def index(conn, _params) do
    propietarios = Propietarios.list_propietarios()
    render(conn, "index.json", propietarios: propietarios)
  end

  def create(conn, %{"propietario" => propietario_params}) do
    with {:ok, %Propietario{} = propietario} <- Propietarios.create_propietario(propietario_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.propietario_path(conn, :show, propietario))
      |> render("show.json", propietario: propietario)
    end
  end

  def show(conn, %{"id" => id}) do
    propietario = Propietarios.get_propietario!(id)
    render(conn, "show.json", propietario: propietario)
  end

  def update(conn, %{"id" => id, "propietario" => propietario_params}) do
    propietario = Propietarios.get_propietario!(id)

    with {:ok, %Propietario{} = propietario} <- Propietarios.update_propietario(propietario, propietario_params) do
      render(conn, "show.json", propietario: propietario)
    end
  end

  def delete(conn, %{"id" => id}) do
    propietario = Propietarios.get_propietario!(id)

    with {:ok, %Propietario{}} <- Propietarios.delete_propietario(propietario) do
      send_resp(conn, :no_content, "")
    end
  end
end
