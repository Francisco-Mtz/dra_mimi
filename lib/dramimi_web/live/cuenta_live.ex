defmodule DramimiWeb.CuentaLive do
  use Phoenix.LiveView
  alias Dramimi.Medicamentos
  alias Dramimi.Servicios
  alias DramimiWeb.CuentaView

  def mount(__session, socket) do
    {:ok, assign(socket, 
    medicamentos: [],
    servicios: Servicios.list_servicios(),
    serviciosCuenta: [],
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

  def handle_event("agregarServicio", %{"servicio" => id}, socket) do
    
    try do
      num = String.to_integer(id)
      servicio = Servicios.get_servicio!(num)
      IO.inspect servicio

      suma = servicio.precio + socket.assigns.total

      serviciosEnCuenta = socket.assigns.serviciosCuenta ++ [servicio]

      {:noreply, assign(socket, total: suma, error: "", serviciosCuenta: serviciosEnCuenta)}
    
    rescue
      Ecto.NoResultsError ->
        {:noreply, assign(socket, error: "Servicio no encontrado")}
    end


  end

end
