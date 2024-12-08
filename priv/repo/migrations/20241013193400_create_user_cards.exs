defmodule AnimalBackend.Repo.Migrations.CreateUserCards do
  use Ecto.Migration

  def change do
    create table(:user_cards) do
      add :user_id, references(:users, on_delete: :nothing)
      add :card_id, references(:cards, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:user_cards, [:user_id])
    create index(:user_cards, [:card_id])
  end
end
