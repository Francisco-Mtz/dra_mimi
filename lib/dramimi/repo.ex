defmodule Dramimi.Repo do
  use Ecto.Repo,
    otp_app: :dramimi,
    adapter: Ecto.Adapters.Postgres
end
