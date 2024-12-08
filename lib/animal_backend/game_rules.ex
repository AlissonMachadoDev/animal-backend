defmodule AnimalBackend.GameRules do
  @moduledoc """
  The GameRules context.
  """

  import Ecto.Query, warn: false
  alias AnimalBackend.Repo

  alias AnimalBackend.GameStructure
  alias AnimalBackend.Accounts

  @ceiling 11

  def sort_card(user_id) do
    user =
      Accounts.get_user!(user_id)
      |> Repo.preload(:cards)

    cards = GameStructure.list_cards()

    selected_card = select_card(cards, user.cards)

    GameStructure.create_user_cards(user, selected_card)
  end

  defp select_card(cards, [_] = selected_cards) do
    card = Enum.random(cards)

    total = sum_card_values(selected_cards)

    if validate_ceiling(card.value, total) do
      card
    else
      select_card(cards, selected_cards)
    end
  end

  defp select_card(cards, [_, _] = selected_cards) do
    total = sum_card_values(selected_cards)

    Enum.find(cards, fn card -> card.value == @ceiling - total end)
  end

  defp select_card(cards, selected_cards) do
    card = Enum.random(cards)

    total = sum_card_values(selected_cards)

    if validate_ceiling(card.value, total) do
      card
    else
      select_card(cards, selected_cards)
    end
  end

  defp validate_ceiling(value, sum) do
    sum + value < @ceiling and value != @ceiling / 2
  end

  defp sum_card_values(cards) do
    Enum.reduce(cards, 0, fn card, acc -> card.value + acc end)
  end
end
