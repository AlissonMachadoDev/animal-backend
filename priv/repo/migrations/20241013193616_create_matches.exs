defmodule AnimalBackend.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do

      timestamps(type: :utc_datetime)
    end
  end
end
