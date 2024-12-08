defmodule AnimalBackend.GameStructure.Set do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnimalBackend.Accounts.User
  alias AnimalBackend.GameStructure.Match

  @derive {Jason.Encoder, except: [:__struct__, :__meta__]}
  schema "sets" do
    field :set_position, :integer
    belongs_to :winner_user, User, foreign_key: :winner_user_id
    belongs_to :match, Match

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(set, attrs) do
    set
    |> cast(attrs, [:set_position])
    |> validate_required([:set_position])
    |> put_assoc(:match, attrs.match)
  end
end
