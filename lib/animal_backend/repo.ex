defmodule AnimalBackend.Repo do
  use Ecto.Repo,
    otp_app: :animal_backend,
    adapter: Ecto.Adapters.Postgres
end
