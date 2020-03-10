defmodule DramimiWeb.GerenciaController do
    use DramimiWeb, :controller
    alias Dramimi.Medicamentos.Medicamento
    alias Dramimi.Medicamentos
    alias Dramimi.Repo
  
    def gerenciaC(conn, _params) do
      render(conn, "gerencia.html")
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def buscarMedicamentoC(conn, _params) do
      idMedicamento = Ecto.Changeset
      render(conn, "buscarMedicamento.html", idMedicamento: idMedicamento)
    end
   
    def obtenerMedicamentoC(conn, %{"idMedicamento" => idMedicamento}) do
      try do
         render(conn, "medicamentoEncontrado.html", medicamento: Medicamentos.get_medicamento!(idMedicamento))
      after render(conn, "gerencia.html")
      end
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def agregarMedicamentoC(conn, _params) do
      changeset = Medicamento.changeset(%Medicamento{})
      render(conn, "agregarMedicamento.html", changeset: changeset)
    end
    
    def nuevoMedicamentoC(conn, %{"nombreComercial" => nombreComercial, "nombreGenerico" => nombreGenerico, "laboratorio" => laboratorio, "precio" => precio, "presentacion" => presentacion, "stock" => stock}) do
      changeset = Medicamento.changeset(%Medicamento{nombreComercial: nombreComercial, nombreGenerico: nombreGenerico, presentacion: presentacion, laboratorio: laboratorio, precio: String.to_float(precio), stock: String.to_integer(stock)})
      case Repo.insert(changeset) do
        {:ok, medicamento} -> render(conn, "gerencia.html", nombreEnviado: nombreComercial)
        {:error, changeset} -> render(conn, "gerencia.html")
      end
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def allMedicamentosC(conn, _params) do
        render(conn, "allMedicamentos.html", medicamentos: Medicamentos.list_medicamentos)
    end



  end