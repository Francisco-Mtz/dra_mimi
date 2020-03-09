defmodule DramimiWeb.DoctorController do
    use DramimiWeb, :controller
  
    def index(conn, _params) do
      render(conn, "index.html")
    end

    def receta(conn, _params) do
      render(conn, "receta.html")
    end 

  end