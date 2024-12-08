defmodule AnimalBackend.Repo.Migrations.CreateMatchUserCards do
  use Ecto.Migration

  def change do
    create table(:match_user_cards) do
      add :match_user_id, references(:match_users, on_delete: :nothing)
      add :card_id, references(:cards, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:match_user_cards, [:match_user_id])
    create index(:match_user_cards, [:card_id])
  end
end
