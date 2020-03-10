defmodule DramimiWeb.Router do
  use DramimiWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    # plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DramimiWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/farmaciaDashboard", FarmaciaController, :index
    get "/cuenta", FarmaciaController, :cuenta

    get "/doctorDashboard", DoctorController, :index
    get "/receta", DoctorController, :receta

    get "/gerenciaDashboard", GerenciaController, :index
    get "/agregar", DoctorController, :agregar
    get "/crear_receta", DoctorController, :crear_receta
    post "/nuevoPaciente", DoctorController, :nuevoPaciente
    post "/nuevaReceta", DoctorController, :nuevaReceta
  end

  # Other scopes may use custom stacks.
  # scope "/api", DramimiWeb do
  #   pipe_through :api
  # end
end
