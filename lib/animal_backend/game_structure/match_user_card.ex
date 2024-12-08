defmodule AnimalBackend.GameStructure.MatchUserCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.GameStructure.Card
  alias AnimalBackend.GameStructure.MatchUser

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "match_user_cards" do
    belongs_to :card, Card
    belongs_to :match_user, MatchUser

    timestamps(type: :utc_datetime)
  end

  def changeset(match_user, cards) do
    match_user
    |> change()
    |> put_assoc(:cards, cards)
  end
end
