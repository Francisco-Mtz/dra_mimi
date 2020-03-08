# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dramimi.Repo.insert!(%Dramimi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


# Crear esquemas
# mix phx.gen.schema Paciente pacientes nombre:string \
# edad:integer

# mix phx.gen.schema Servicio servicios nombre:string precio:float

# mix phx.gen.schema Medicamento medicamentos nombre:string precio:float generico:boolean

# mix phx.gen.schema MedicamentoRecetado medicamentos_recetados nombre:string generico:boolean

