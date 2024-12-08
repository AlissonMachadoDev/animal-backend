defmodule AnimalBackend.GameStructure.Card do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.Accounts.User
  alias AnimalBackend.GameStructure.UserCard
  alias AnimalBackend.GameStructure.MatchUser
  alias AnimalBackend.GameStructure.MatchUserCard
  alias AnimalBackend.GameStructure.Match

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "cards" do
    field :description, :string
    field :image_url, :string
    field :name, :string
    field :value, :integer

    many_to_many :users, User, join_through: UserCard
    many_to_many :match_users, MatchUser, join_through: MatchUserCard
    many_to_many :matches, Match, join_through: MatchUser

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:description, :name, :value, :image_url])
    |> validate_required([:description, :name, :value, :image_url])
  end

  def format_struct(card) do
    card
    |> Map.drop([:__meta__, :__struct__, :users, :match_users, :matches])
  end
end
