defmodule AnimalBackend.GameStructureFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AnimalBackend.GameStructure` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image_url: "some image_url",
        name: "some name",
        value: 42
      })
      |> AnimalBackend.GameStructure.create_card()

    card
  end

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{})
      |> AnimalBackend.GameStructure.create_match()

    match
  end

  @doc """
  Generate a match_user.
  """
  def match_user_fixture(attrs \\ %{}) do
    {:ok, match_user} =
      attrs
      |> Enum.into(%{
        total_power: 42
      })
      |> AnimalBackend.GameStructure.create_match_user()

    match_user
  end

  @doc """
  Generate a match_user_card.
  """
  def match_user_card_fixture(attrs \\ %{}) do
    {:ok, match_user_card} =
      attrs
      |> Enum.into(%{})
      |> AnimalBackend.GameStructure.create_match_user_card()

    match_user_card
  end

  @doc """
  Generate a set.
  """
  def set_fixture(attrs \\ %{}) do
    {:ok, set} =
      attrs
      |> Enum.into(%{
        set_position: 42
      })
      |> AnimalBackend.GameStructure.create_set()

    set
  end

  @doc """
  Generate a moviment.
  """
  def moviment_fixture(attrs \\ %{}) do
    {:ok, moviment} =
      attrs
      |> Enum.into(%{
        is_first_moviment?: true
      })
      |> AnimalBackend.GameStructure.create_moviment()

    moviment
  end
end
