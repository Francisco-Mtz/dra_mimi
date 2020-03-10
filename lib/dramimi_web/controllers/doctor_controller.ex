defmodule DramimiWeb.DoctorController do
    use DramimiWeb, :controller
    alias Dramimi.Pacientes.Paciente
    alias Dramimi.Recetas.Receta
    alias Dramimi.Repo

    def index(conn, _params) do
      render(conn, "index.html")
    end

    def receta(conn, _params) do
      render(conn, "receta.html")
    end

    def agregar(conn, _params) do
      changeset=Paciente.changeset(%Paciente{})
      render(conn, "agregar.html", changeset: changeset)
    end

    def nuevoPaciente(conn, %{"nombre" => nombre, "edad" => edad, "genero" => genero, "telefono" => telefono}) do
      changeset=Paciente.changeset(%Paciente{nombre: nombre, edad: String.to_integer(edad), genero: genero, telefono: String.to_integer(telefono)})
      case Repo.insert(changeset)
      do
      {:ok, paciente} -> render(conn, "index.html",nombreEnviado: nombre) 
      {:error, changeset} -> render(conn, "index.html")
      end
    end

    def crear_receta(conn, _params) do
      changeset=Receta.changeset(%Receta{})
      render(conn, "Crear_receta.html", changeset: changeset)
    end

    def nuevaReceta(conn, %{"idPaciente" => idPaciente, "idServicio" => idServicio, "diagnostico" => diagnostico, "peso" => peso ,"altura" => altura,"temperatura" => temperatura,"frecuenciaCardiaca" => frecuenciaCardiaca, "presionArterial" => presionArterial, "frecuenciaRespiratoria" => frecuenciaRespiratoria}) do
      changeset=Receta.changeset(%Receta{idPaciente: String.to_integer(idPaciente), idServicio: String.to_integer(idServicio), diagnostico: diagnostico, peso: String.to_integer(peso), altura: String.to_integer(altura), temperatura: String.to_integer(temperatura),frecuenciaCardiaca: frecuenciaCardiaca, presionArterial: presionArterial, frecuenciaRespiratoria: frecuenciaRespiratoria})
      case Repo.insert(changeset)
      do
      {:ok, receta} -> render(conn, "index.html",nombreEnviado: idPaciente) 
      {:error, changeset} -> render(conn, "index.html")
      end
    end



  end
  
