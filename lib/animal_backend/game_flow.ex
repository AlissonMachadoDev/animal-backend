defmodule AnimalBackend.GameFlow do
  @moduledoc """
  The GameFlow context.
  """

  import Ecto.Query, warn: false
  alias AnimalBackend.Repo

  alias AnimalBackend.Accounts
  alias AnimalBackend.Accounts.User
  alias AnimalBackend.GameStructure
  alias AnimalBackend.GameStructure.{Match, MatchUser, Card}

  def start_match(user) do
    # To start a match, first it needs to be defined the match users
    # It's selected randomly a adversary from the database
    # so it needs to be selected 3 cards of each player
    # then create the match users
    # finally creates the match user cards for both users
    # then update all the structs above
    user =
      user
      |> Repo.preload(:cards)

    opponent = select_fake_user(user.id)

    {:ok, match} = GameStructure.create_match(%{})

    user_cards = select_cards(user.cards)
    opponent_cards = select_cards(opponent.cards)

    match =
      match
      |> Repo.preload(:users)

    {:ok, match_user} =
      GameStructure.create_match_user(%{
        user: user,
        match: match,
        total_power: sum_card_values(user_cards)
      })

    match =
      match
      |> Repo.preload(:users)

    {:ok, match_opponent} =
      GameStructure.create_match_user(%{
        user: opponent,
        match: match,
        total_power: sum_card_values(opponent_cards)
      })

    GameStructure.create_match_user_cards(match_user |> Repo.preload(:cards), user_cards)
    GameStructure.create_match_user_cards(match_opponent |> Repo.preload(:cards), opponent_cards)

    {:ok, load_full_match(match)}
  end

  defp load_full_match(match) do
    match =
      match
      |> Repo.preload(match_users: [user: []])

    %{
      match: Match.format_struct(match),
      match_users:
        Enum.map(match.match_users, fn match_user ->
          %{
            match_user: MatchUser.format_struct(match_user),
            user: User.format_struct(match_user.user)
          }
        end)
    }
  end

  defp select_fake_user(user_id) do
    Accounts.list_users()
    |> Enum.filter(fn user -> user.id != user_id end)
    |> Enum.random()
    |> Repo.preload(:cards)
  end

  defp select_cards(cards) do
    cards
    |> Enum.shuffle()
    |> Enum.take(3)
  end

  defp sum_card_values(cards) do
    Enum.reduce(cards, 0, fn card, acc -> card.value + acc end)
  end

  def get_cards_from_match(match_user_id) do
    GameStructure.get_match_user!(match_user_id)
    |> Repo.preload(:cards)
    |> then(& &1.cards)
    |> Enum.map(fn card ->
      Card.format_struct(card)
    end)
    |> then(&%{cards: &1})
  end

  def opponent_moviment(match_user_id, set, is_first_moviment?) do
    match_user = GameStructure.get_match_user!(match_user_id)

    card =
      match_user
      |> Repo.preload(:cards)
      |> then(& &1.cards)
      |> Enum.map(fn card ->
        Card.format_struct(card)
      end)
      # |> Enum.filter(fn card -> card.id not in used_cards end)
      |> Enum.random()

    GameStructure.create_moviment(%{
      is_first_moviment?: is_first_moviment?,
      card: card,
      set: set,
      match_user: match_user
    })
  end

  def start_set(match, match_user, []) do
    {:ok, set} = GameStructure.create_set(%{set_position: 1, match: match})

    match =
      match
      |> Repo.preload(:match_users)

    opponent =
      match.match_users
      |> Enum.find(fn mu -> mu.id != match_user.id end)

    Enum.random([2, 2])
    |> case do
      1 ->
        %{set_id: set.id, who_starts: 1}

      2 ->
        card = opponent_moviment(opponent.id, set, true)
        %{set_id: set.id, who_starts: 2, card: card}
    end
  end
end
