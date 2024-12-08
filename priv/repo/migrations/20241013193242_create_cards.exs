defmodule AnimalBackend.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :description, :string
      add :name, :string
      add :value, :integer, comment: "The power of the card."
      add :image_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
