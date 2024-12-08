defmodule AnimalBackend.GameStructure.MatchUser do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.Accounts.User
  alias AnimalBackend.GameStructure.Match
  alias AnimalBackend.GameStructure.MatchUserCard
  alias AnimalBackend.GameStructure.Card

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "match_users" do
    field :total_power, :integer
    belongs_to :user, User
    belongs_to :match, Match

    has_many :match_user_cards, MatchUserCard
    many_to_many :cards, Card, join_through: MatchUserCard

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, user) do
    match
    |> change()
    |> put_assoc(:users, match.users ++ [user])
  end

  def changeset_update(match_user, attrs) do
    match_user
    |> cast(attrs, [:total_power])
    |> validate_required([:total_power])
  end

  def format_struct(match_user) do
    match_user
    |> Map.drop([:__struct__, :__meta__, :user, :match, :match_user_cards, :cards])
  end
end
