defmodule AnimalBackend.Repo.Migrations.CreateMatchUsers do
  use Ecto.Migration

  def change do
    create table(:match_users) do
      add :total_power, :integer,
        comment: "The total power of the cards of the user in this match."

      add :user_id, references(:users, on_delete: :nothing)
      add :match_id, references(:matches, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:match_users, [:user_id])
    create index(:match_users, [:match_id])
  end
end
