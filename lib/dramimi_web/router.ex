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

    get "/agregar", DoctorController, :agregar
    get "/crear_receta", DoctorController, :crear_receta
    get "/buscarPaciente", DoctorController, :buscarPaciente
    post "/nuevoPaciente", DoctorController, :nuevoPaciente
    post "/nuevaReceta", DoctorController, :nuevaReceta
    get "/buscarMedicamentoD", DoctorController, :buscarMedicamentoDC
    post "/obtenerMedicamentoD", DoctorController, :obtenerMedicamentoDC
    post "/obtenerPaciente", DoctorController, :obtenerPaciente
    
  

        #Rutas de apartado gerencia
        get "/gerenciaDashboard", GerenciaController, :gerenciaC
        get "/mensajeAlert", GerenciaController, :mensajeCorrectoC
    
        get "/Agregar_Medicamento", GerenciaController, :agregarMedicamentoC
        post "/nuevoMedicamento", GerenciaController, :nuevoMedicamentoC
    
        get "/Todos_los_medicamentos", GerenciaController, :allMedicamentosC
    
        get "/Buscar_Medicamento", GerenciaController, :buscarMedicamentoC
        post "/obtenerMedicamento", GerenciaController, :obtenerMedicamentoC
        
        get "/modificarMedicamento/:idMedicamento", GerenciaController, :modificarMedicamentoC
        post "/nuevosDatos", GerenciaController, :nuevosDatosC
        get "/eliminarMedicamento/:idMedicamento", GerenciaController, :eliminarMedicamentoC

    
  end

  # Other scopes may use custom stacks.
  # scope "/api", DramimiWeb do
  #   pipe_through :api
  # end
end
