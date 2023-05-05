defmodule AtmPseudoAppWeb.Router do
  alias AtmPseudoAppWeb.VehiculoController
  alias AtmPseudoAppWeb.PropietarioController
  use AtmPseudoAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/propietarios", PropietarioController, except: [:edit, :new, :update]
    put "/propietarios/:id", PropietarioController, :update
    resources "/vehiculos", VehiculoController, except: [:edit, :new, :update]
    put "/vehiculos/:id", VehiculoController, :update

  end
end
