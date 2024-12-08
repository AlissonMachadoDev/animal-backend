defmodule AnimalBackend.Repo.Migrations.CreateSets do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :set_position, :integer, comment: "Which posiiton of the match this set is."
      add :match_id, references(:matches, on_delete: :nothing)
      add :winner_user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:sets, [:match_id])
    create index(:sets, [:winner_user_id])
  end
end
