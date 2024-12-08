defmodule AnimalBackend.GameStructure do
  @moduledoc """
  The GameStructure context.
  """

  import Ecto.Query, warn: false
  alias AnimalBackend.Repo

  alias AnimalBackend.GameStructure.Card

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Card{}, ...]

  """
  def list_cards do
    Repo.all(Card)
  end

  @doc """
  Gets a single card.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

      iex> get_card!(123)
      %Card{}

      iex> get_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card!(id), do: Repo.get!(Card, id)

  @doc """
  Gets a single card by his value.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

      iex> get_card_by_value!(123)
      %Card{}

      iex> get_card_by_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card_by_value!(value), do: Repo.get_by!(Card, value: value)

  @doc """
  Creates a card.

  ## Examples

      iex> create_card(%{field: value})
      {:ok, %Card{}}

      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

      iex> update_card(card, %{field: new_value})
      {:ok, %Card{}}

      iex> update_card(card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a card.

  ## Examples

      iex> delete_card(card)
      {:ok, %Card{}}

      iex> delete_card(card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card(%Card{} = card) do
    Repo.delete(card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card changes.

  ## Examples

      iex> change_card(card)
      %Ecto.Changeset{data: %Card{}}

  """
  def change_card(%Card{} = card, attrs \\ %{}) do
    Card.changeset(card, attrs)
  end

  alias AnimalBackend.GameStructure.UserCard

  @doc """
  Returns the list of user_card.

  ## Examples

      iex> list_user_cards()
      [%UserCard{}, ...]

  """
  def list_user_cards do
    Repo.all(UserCard)
  end

  @doc """
  Gets a single user_card.

  Raises `Ecto.NoResultsError` if the User cards does not exist.

  ## Examples

      iex> get_user_card!(123)
      %UserCard{}

      iex> get_user_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_card!(id), do: Repo.get!(UserCard, id)

  @doc """
  Creates a user_card.

  ## Examples

      iex> create_user_card(%{field: value})
      {:ok, %UserCard{}}

      iex> create_user_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_card(attrs \\ %{}) do
    %UserCard{}
    |> UserCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates user_cards.

  ## Examples

      iex> create_user_cards(%{User{}, %Card{})
      {:ok, %User{}}

      iex> create_user_cards(%User{}, nil)
      {:error, %Ecto.Changeset{}}

  """
  def create_user_cards(user, card) do
    user
    |> UserCard.changeset(card)
    |> Repo.update()
  end

  @doc """
  Updates a user_card.

  ## Examples

      iex> update_user_card(user_card, %{field: new_value})
      {:ok, %UserCard{}}

      iex> update_user_card(user_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_card(%UserCard{} = user_card, attrs) do
    user_card
    |> UserCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_card.

  ## Examples

      iex> delete_user_card(user_card)
      {:ok, %UserCard{}}

      iex> delete_user_card(user_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_card(%UserCard{} = user_card) do
    Repo.delete(user_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_card changes.

  ## Examples

      iex> change_user_card(user_card)
      %Ecto.Changeset{data: %UserCard{}}

  """
  def change_user_card(%UserCard{} = user_card, attrs \\ %{}) do
    UserCard.changeset(user_card, attrs)
  end

  alias AnimalBackend.GameStructure.Match

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end

  alias AnimalBackend.GameStructure.MatchUser

  @doc """
  Returns the list of match_users.

  ## Examples

      iex> list_match_users()
      [%MatchUser{}, ...]

  """
  def list_match_users do
    Repo.all(MatchUser)
  end

  @doc """
  Gets a single match_user.

  Raises `Ecto.NoResultsError` if the Match user does not exist.

  ## Examples

      iex> get_match_user!(123)
      %MatchUser{}

      iex> get_match_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match_user!(id), do: Repo.get!(MatchUser, id)

  def find_match_user!(match_id, user_id),
    do: Repo.get_by!(MatchUser, match_id: match_id, user_id: user_id)

  @doc """
  Creates a match_user.

  ## Examples

      iex> create_match_user(%{field: value})
      {:ok, %MatchUser{}}

      iex> create_match_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match_user(%{
        user: user,
        match: match,
        total_power: total_power
      }) do
    match
    |> MatchUser.changeset(user)
    |> Repo.update()

    find_match_user!(match.id, user.id)
    |> update_match_user(%{total_power: total_power})
  end

  @doc """
  Updates a match_user.

  ## Examples

      iex> update_match_user(match_user, %{field: new_value})
      {:ok, %MatchUser{}}

      iex> update_match_user(match_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match_user(%MatchUser{} = match_user, attrs) do
    match_user
    |> MatchUser.changeset_update(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match_user.

  ## Examples

      iex> delete_match_user(match_user)
      {:ok, %MatchUser{}}

      iex> delete_match_user(match_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match_user(%MatchUser{} = match_user) do
    Repo.delete(match_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match_user changes.

  ## Examples

      iex> change_match_user(match_user)
      %Ecto.Changeset{data: %MatchUser{}}

  """
  def change_match_user(%MatchUser{} = match_user, attrs \\ %{}) do
    MatchUser.changeset(match_user, attrs)
  end

  alias AnimalBackend.GameStructure.MatchUserCard

  @doc """
  Returns the list of match_user_cards.

  ## Examples

      iex> list_match_user_cards()
      [%MatchUserCard{}, ...]

  """
  def list_match_user_cards do
    Repo.all(MatchUserCard)
  end

  @doc """
  Gets a single match_user_card.

  Raises `Ecto.NoResultsError` if the Match user card does not exist.

  ## Examples

      iex> get_match_user_card!(123)
      %MatchUserCard{}

      iex> get_match_user_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match_user_card!(id), do: Repo.get!(MatchUserCard, id)

  @doc """
  Creates a match_user_card.

  ## Examples

      iex> create_match_user_card(%{field: value})
      {:ok, %MatchUserCard{}}

      iex> create_match_user_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match_user_card(attrs \\ %{}) do
    %MatchUserCard{}
    |> MatchUserCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates create_match_user_cards.

  ## Examples

      iex> create_match_user_cards(%{MatchUser{}, %Card{})
      {:ok, %User{}}

      iex> create_match_user_cards(%MatchUser{}, nil)
      {:error, %Ecto.Changeset{}}

  """
  def create_match_user_cards(match_user, cards) do
    match_user
    |> MatchUserCard.changeset(cards)
    |> Repo.update()
  end

  @doc """
  Updates a match_user_card.

  ## Examples

      iex> update_match_user_card(match_user_card, %{field: new_value})
      {:ok, %MatchUserCard{}}

      iex> update_match_user_card(match_user_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match_user_card(%MatchUserCard{} = match_user_card, attrs) do
    match_user_card
    |> MatchUserCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match_user_card.

  ## Examples

      iex> delete_match_user_card(match_user_card)
      {:ok, %MatchUserCard{}}

      iex> delete_match_user_card(match_user_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match_user_card(%MatchUserCard{} = match_user_card) do
    Repo.delete(match_user_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match_user_card changes.

  ## Examples

      iex> change_match_user_card(match_user_card)
      %Ecto.Changeset{data: %MatchUserCard{}}

  """
  def change_match_user_card(%MatchUserCard{} = match_user_card, attrs \\ %{}) do
    MatchUserCard.changeset(match_user_card, attrs)
  end

  alias AnimalBackend.GameStructure.Set

  @doc """
  Returns the list of sets.

  ## Examples

      iex> list_sets()
      [%Set{}, ...]

  """
  def list_sets do
    Repo.all(Set)
  end

  @doc """
  Gets a single set.

  Raises `Ecto.NoResultsError` if the Set does not exist.

  ## Examples

      iex> get_set!(123)
      %Set{}

      iex> get_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_set!(id), do: Repo.get!(Set, id)

  @doc """
  Creates a set.

  ## Examples

      iex> create_set(%{field: value})
      {:ok, %Set{}}

      iex> create_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_set(attrs \\ %{}) do
    %Set{}
    |> Set.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a set.

  ## Examples

      iex> update_set(set, %{field: new_value})
      {:ok, %Set{}}

      iex> update_set(set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_set(%Set{} = set, attrs) do
    set
    |> Set.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a set.

  ## Examples

      iex> delete_set(set)
      {:ok, %Set{}}

      iex> delete_set(set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_set(%Set{} = set) do
    Repo.delete(set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking set changes.

  ## Examples

      iex> change_set(set)
      %Ecto.Changeset{data: %Set{}}

  """
  def change_set(%Set{} = set, attrs \\ %{}) do
    Set.changeset(set, attrs)
  end

  alias AnimalBackend.GameStructure.Moviment

  @doc """
  Returns the list of moviments.

  ## Examples

      iex> list_moviments()
      [%Moviment{}, ...]

  """
  def list_moviments do
    Repo.all(Moviment)
  end

  @doc """
  Gets a single moviment.

  Raises `Ecto.NoResultsError` if the Moviment does not exist.

  ## Examples

      iex> get_moviment!(123)
      %Moviment{}

      iex> get_moviment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_moviment!(id), do: Repo.get!(Moviment, id)

  @doc """
  Creates a moviment.

  ## Examples

      iex> create_moviment(%{field: value})
      {:ok, %Moviment{}}

      iex> create_moviment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_moviment(attrs \\ %{}) do
    %Moviment{}
    |> Moviment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a moviment.

  ## Examples

      iex> update_moviment(moviment, %{field: new_value})
      {:ok, %Moviment{}}

      iex> update_moviment(moviment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_moviment(%Moviment{} = moviment, attrs) do
    moviment
    |> Moviment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a moviment.

  ## Examples

      iex> delete_moviment(moviment)
      {:ok, %Moviment{}}

      iex> delete_moviment(moviment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_moviment(%Moviment{} = moviment) do
    Repo.delete(moviment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking moviment changes.

  ## Examples

      iex> change_moviment(moviment)
      %Ecto.Changeset{data: %Moviment{}}

  """
  def change_moviment(%Moviment{} = moviment, attrs \\ %{}) do
    Moviment.changeset(moviment, attrs)
  end
end
