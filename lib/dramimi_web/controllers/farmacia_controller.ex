defmodule DramimiWeb.FarmaciaController do
    use DramimiWeb, :controller

    def index(conn, _params) do
      render(conn, "index.html")
    end

    def cuenta(conn, _params) do
      render(conn, "cuenta.html")
    end
  end
