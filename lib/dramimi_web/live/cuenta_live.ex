defmodule DramimiWeb.CuentaLive do
  use Phoenix.LiveView
  alias Dramimi.Medicamentos
  alias Dramimi.Servicios
  alias Dramimi.Ventas
  alias Dramimi.Medicamentos_vendidos
  alias Dramimi.Servicios_vendidos

  alias DramimiWeb.CuentaView

  def mount(__session, socket) do
    {:ok, assign(socket, 
    medicamentos: [],
    servicios: Servicios.list_servicios(),
    serviciosCuenta: [],
    total: 0.0,
    error: "",
    confirmado: "",
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
      {:noreply, assign(socket, encontrado: medicamento, total: suma, 
      medicamentos: listaMedicamentos, error: "", confirmado: "")}

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

      suma = servicio.precio + socket.assigns.total

      serviciosEnCuenta = socket.assigns.serviciosCuenta ++ [servicio]

      {:noreply, assign(socket, total: suma, error: "", 
      serviciosCuenta: serviciosEnCuenta, confirmado: "")}
    
    rescue
      Ecto.NoResultsError ->
        {:noreply, assign(socket, error: "Servicio no encontrado")}
    end

  end

  def handle_event("confirmar", _value, socket) do
    
    # Crear venta
    total = socket.assigns.total
    nueva_venta = %{"total" => total}
    {:ok, venta_creada} = Ventas.create_venta(nueva_venta)
    # IO.inspect venta_creada.id
    
    idVenta = venta_creada.id

    # Registrar medicamentos en la tabla medicamentos_vendidos
    Enum.each(socket.assigns.medicamentos, fn(el) ->  
      idMedicamento = el.id
      nuevo_medicamento_vendido = %{"idVenta" => idVenta, "idMedicamento" => idMedicamento}
      {:ok, medicamento_vendido_creado} = Medicamentos_vendidos.create_medicamento_vendido(nuevo_medicamento_vendido)
      IO.inspect medicamento_vendido_creado
    end)

    Enum.each(socket.assigns.serviciosCuenta, fn(el) ->  
      idServicio = el.id
      nuevo_servicio_vendido = %{"idVenta" => idVenta, "idServicio" => idServicio}
      {:ok, servicio_vendido_creado} = Servicios_vendidos.create_servicio_vendido(nuevo_servicio_vendido)
      IO.inspect servicio_vendido_creado
    end)


    {:noreply, assign(socket, total: 0.0, medicamentos: [], serviciosCuenta: [], confirmado: "Venta guardada con exito")}
  end

  def handle_event("eliminarMedicamento", %{"id" => id}, socket) do
    
    num = String.to_integer(id)

    medicamento_a_eliminar = Enum.find(socket.assigns.medicamentos, fn(el) -> 
      el.id == num
    end)
    # IO.puts "Precio de medicamento eliminado: #{medicamento_a_eliminar.precio}"

    nuevo_total = socket.assigns.total - medicamento_a_eliminar.precio

    medicamentos_modificado = Enum.filter(socket.assigns.medicamentos, fn(el) ->
      el.id != num
    end)

    {:noreply, assign(socket, medicamentos: medicamentos_modificado, total: nuevo_total)}
  end

  def handle_event("eliminarServicio", %{"id" => id}, socket) do
    
    num = String.to_integer(id)

    servicio_a_eliminar = Enum.find(socket.assigns.serviciosCuenta, fn(el) -> 
      el.id == num
    end)
    # IO.puts "Precio de medicamento eliminado: #{medicamento_a_eliminar.precio}"

    nuevo_total = socket.assigns.total - servicio_a_eliminar.precio

    servicios_modificado = Enum.filter(socket.assigns.serviciosCuenta, fn(el) ->
      el.id != num
    end)

    {:noreply, assign(socket, serviciosCuenta: servicios_modificado, total: nuevo_total)}
  end

end
