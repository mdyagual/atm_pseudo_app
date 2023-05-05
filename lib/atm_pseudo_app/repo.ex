defmodule AtmPseudoApp.Repo do
  use Ecto.Repo,
    otp_app: :atm_pseudo_app,
    adapter: Ecto.Adapters.Postgres
end
