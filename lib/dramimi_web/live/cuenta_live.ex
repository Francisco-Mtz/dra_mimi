defmodule DramimiWeb.CuentaLive do
  use Phoenix.LiveView
  alias Dramimi.Medicamentos
  alias DramimiWeb.CuentaView

  def mount(__session, socket) do
    {:ok, assign(socket, 
    medicamentos: [],
    total: 0.0,
    error: "",
    encontrado: nil)}
  end

  def render(assigns) do
    CuentaView.render("cuenta.html", assigns)
  end

  def handle_event("agregarMedicamento", %{"id" => id}, socket) do

    try do
      num = String.to_integer(id["id"])
      medicamento = Medicamentos.get_medicamento!(num)

      # IO.inspect medicamento

      suma = medicamento.precio + socket.assigns.total

      listaMedicamentos = socket.assigns.medicamentos ++ [medicamento]
      IO.inspect listaMedicamentos
      {:noreply, assign(socket, encontrado: medicamento, total: suma, medicamentos: listaMedicamentos, error: "")}

    rescue
      Ecto.NoResultsError ->
        {:noreply, assign(socket, error: "Medicamento no encontrado", encontrado: nil)}
    end
    # IO.inspect founded

  end

end
