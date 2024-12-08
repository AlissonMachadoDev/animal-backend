defmodule AnimalBackend.GameStructure.Moviment do
  use Ecto.Schema
  import Ecto.Changeset

  alias AnimalBackend.GameStructure.Set
  alias AnimalBackend.GameStructure.Card
  alias AnimalBackend.GameStructure.MatchUser

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "moviments" do
    field :is_first_moviment?, :boolean, default: false
    belongs_to :set, Set
    belongs_to :card, Card
    belongs_to :match_user, MatchUser

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(moviment, attrs) do
    moviment
    |> cast(attrs, [:is_first_moviment?])
    |> validate_required([:is_first_moviment?])
    |> put_assoc(:set, attrs.set)
    |> put_assoc(:card, attrs.card)
    |> put_assoc(:match_user, attrs.match_user)
  end
end
