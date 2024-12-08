defmodule AnimalBackend.Repo.Migrations.CreateMoviments do
  use Ecto.Migration

  def change do
    create table(:moviments) do
      add :is_first_moviment?, :boolean,
        default: false,
        null: false,
        comment: "If this moviment is the first or the last moviment of the match."

      add :set_id, references(:sets, on_delete: :nothing)
      add :card_id, references(:cards, on_delete: :nothing)
      add :match_user_id, references(:match_users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:moviments, [:card_id])
    create index(:moviments, [:set_id])
    create index(:moviments, [:match_user_id])
  end
end
