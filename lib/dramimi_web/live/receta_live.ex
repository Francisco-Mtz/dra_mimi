defmodule DramimiWeb.RecetaLive do
    use Phoenix.LiveView
    alias Dramimi.Pacientes
    alias Dramimi.Servicios
    alias Dramimi.Recetas
  
    alias DramimiWeb.RecetaView
  
    def mount(__session, socket) do
      {:ok, assign(socket, medicamentos: [], 
      servicios: Servicios.list_servicios(),
      paciente: nil, error: "", mensaje: "")} 
    end
  
    def render(assigns) do
      RecetaView.render("receta.html", assigns)
    end

    def handle_event("guardarReceta", %{"idPaciente" => idPaciente, "servicio" => servicio, "altura" => altura, "frecuenciaCardiaca" => frecuenciaCardiaca, "frecuenciaRespiratoria" => frecuenciaRespiratoria, "peso" => peso, "presionArterial" => presionArterial, "temperatura" => temperatura, "diagnostico" => diagnostico}, socket) do
      
      altura_int = String.to_integer(altura)
      peso_int = String.to_integer(peso)
      temperatura_int = String.to_integer(temperatura)
      idServicio = String.to_integer(servicio)
      

      nueva_receta = %{"altura" => altura_int,
                      "diagnostico" => diagnostico,
                      "frecuenciaCardiaca" => frecuenciaCardiaca,
                      "frecuenciaRespiratoria" => frecuenciaRespiratoria,
                      "idPaciente" => idPaciente,
                      "idServicio" => idServicio,
                      "peso" => peso_int,
                      "presionArterial" => presionArterial,
                      "temperatura" => temperatura_int
      }

      {:ok, receta_creada} = Recetas.create_receta(nueva_receta)
      IO.inspect receta_creada

      num = String.to_integer(idPaciente)
      try do
        paciente_obtenido = Pacientes.get_paciente!(num)
        {:noreply, assign(socket, paciente: paciente_obtenido, mensaje: "Receta guardada con exito")}
      rescue
        Ecto.NoResultsError ->
          {:noreply, assign(socket, error: "Paciente no encontrado", paciente: nil)}
      end

      
    end
  
  end