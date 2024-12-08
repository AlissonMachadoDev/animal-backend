defmodule AnimalBackend.GameStructure.UserCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.Accounts.User
  alias AnimalBackend.GameStructure.Card

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "user_cards" do
    belongs_to :user, User
    belongs_to :card, Card

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%User{} = user, %Card{} = card) do
    user
    |> change()
    |> put_assoc(:cards, user.cards ++ [card])
  end

  @doc false
  def changeset(user_cards, attrs) do
    user_cards
    |> cast(attrs, [])
    |> validate_required([])
  end
end
