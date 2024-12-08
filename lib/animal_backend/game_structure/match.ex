defmodule AnimalBackend.GameStructure.Match do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.GameStructure.MatchUser
  alias AnimalBackend.Accounts.User

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "matches" do
    many_to_many :users, User, join_through: MatchUser
    has_many :match_users, MatchUser
    has_many :match_user_cards, through: [:match_users, :match_user_cards]
    has_many :cards, through: [:match_user_cards, :card]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [])
    |> validate_required([])
  end

  def format_struct(match) do
    match
    |> Map.drop([:__struct__, :__meta__, :match_users, :match_user_cards, :cards])
  end
end
