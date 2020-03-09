defmodule DramimiWeb.RecetaLive do
    use Phoenix.LiveView
  
    alias DramimiWeb.RecetaView
  
    def mount(__session, socket) do
      {:ok, assign(socket, medicamentos: [])}
    end
  
    def render(assigns) do
      RecetaView.render("receta.html", assigns)
    end
  
  end