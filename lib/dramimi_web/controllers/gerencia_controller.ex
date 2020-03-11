defmodule DramimiWeb.GerenciaController do
    use DramimiWeb, :controller
    alias Dramimi.Medicamentos.Medicamento
    alias Dramimi.Medicamentos
    alias Dramimi.Repo
  
    def gerenciaC(conn, _params) do
      render(conn, "gerencia.html")
    end

    def mensajeCorrectoC(conn, _params) do
      render(conn, "correcto.html")
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def buscarMedicamentoC(conn, _params) do
      idMedicamento = Ecto.Changeset
      render(conn, "buscarMedicamento.html", idMedicamento: idMedicamento)
    end
   
    def obtenerMedicamentoC(conn, %{"idMedicamento" => idMedicamento}) do
      try do
         render(conn, "medicamentoEncontrado.html", medicamento: Medicamentos.get_medicamento!(idMedicamento))
      after render(conn, "incorrecto.html")
      end
    end

    def eliminarMedicamentoC(conn, %{"idMedicamento" => idMedicamento}) do
      try do
        medicamentox = Medicamentos.get_medicamento!(idMedicamento)
        Medicamentos.delete_medicamento(medicamentox)
        render(conn, "correcto.html")
      after render(conn, "incorrecto.html")
      end
    end

    def modificarMedicamentoC(conn, %{"idMedicamento" => idMedicamento}) do
      try do
        changeset = Medicamento.changeset(%Medicamento{})
        render(conn, "modificarDatos.html", changeset: changeset, medicamento: Medicamentos.get_medicamento!(idMedicamento))
      after render(conn, "incorrecto.html")
      end
    end

    def nuevosDatosC(conn, %{"nombreComercial" => nombreComercial, "nombreGenerico" => nombreGenerico, "laboratorio" => laboratorio, "precio" => precio, "presentacion" => presentacion, "stock" => stock}) do
      try do 
        changeset = Medicamento.changeset(%Medicamento{nombreComercial: nombreComercial, nombreGenerico: nombreGenerico, presentacion: presentacion, laboratorio: laboratorio, precio: String.to_float(precio), stock: String.to_integer(stock)})
        Medicamentos.update_medicamento(Medicamento.changeset(%Medicamento{}), changeset)
        render(conn, "correcto.html")
      after
        render(conn, "correcto.html")
      end
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def agregarMedicamentoC(conn, _params) do
      changeset = Medicamento.changeset(%Medicamento{})
      render(conn, "agregarMedicamento.html", changeset: changeset)
    end
    
    def nuevoMedicamentoC(conn, %{"nombreComercial" => nombreComercial, "nombreGenerico" => nombreGenerico, "laboratorio" => laboratorio, "precio" => precio, "presentacion" => presentacion, "stock" => stock}) do
      try do 
        changeset = Medicamento.changeset(%Medicamento{nombreComercial: nombreComercial, nombreGenerico: nombreGenerico, presentacion: presentacion, laboratorio: laboratorio, precio: String.to_float(precio), stock: String.to_integer(stock)})
        Repo.insert(changeset)
        render(conn, "correcto.html")
      after
        render(conn, "incorrecto.html")
      end
    end

    #--------------------------------------------------------------------------------------------------------------------------------
    def allMedicamentosC(conn, _params) do
        render(conn, "allMedicamentos.html", medicamentos: Medicamentos.list_medicamentos)
    end



  end