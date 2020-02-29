defmodule DramimiWeb.Router do
  use DramimiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
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
    get "/doctorDashboard", DoctorController, :index
    get "/gerenciaDashboard", GerenciaController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DramimiWeb do
  #   pipe_through :api
  # end
end
