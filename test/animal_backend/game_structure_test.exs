defmodule AnimalBackend.GameStructureTest do
  use AnimalBackend.DataCase

  alias AnimalBackend.GameStructure

  describe "cards" do
    alias AnimalBackend.GameStructure.Card

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{description: nil, image_url: nil, name: nil, value: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert GameStructure.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert GameStructure.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{description: "some description", image_url: "some image_url", name: "some name", value: 42}

      assert {:ok, %Card{} = card} = GameStructure.create_card(valid_attrs)
      assert card.description == "some description"
      assert card.image_url == "some image_url"
      assert card.name == "some name"
      assert card.value == 42
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{description: "some updated description", image_url: "some updated image_url", name: "some updated name", value: 43}

      assert {:ok, %Card{} = card} = GameStructure.update_card(card, update_attrs)
      assert card.description == "some updated description"
      assert card.image_url == "some updated image_url"
      assert card.name == "some updated name"
      assert card.value == 43
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_card(card, @invalid_attrs)
      assert card == GameStructure.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = GameStructure.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_card(card)
    end
  end

  describe "user_cards" do
    alias AnimalBackend.GameStructure.UserCards

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{}

    test "list_user_cards/0 returns all user_cards" do
      user_cards = user_cards_fixture()
      assert GameStructure.list_user_cards() == [user_cards]
    end

    test "get_user_cards!/1 returns the user_cards with given id" do
      user_cards = user_cards_fixture()
      assert GameStructure.get_user_cards!(user_cards.id) == user_cards
    end

    test "create_user_cards/1 with valid data creates a user_cards" do
      valid_attrs = %{}

      assert {:ok, %UserCards{} = user_cards} = GameStructure.create_user_cards(valid_attrs)
    end

    test "create_user_cards/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_user_cards(@invalid_attrs)
    end

    test "update_user_cards/2 with valid data updates the user_cards" do
      user_cards = user_cards_fixture()
      update_attrs = %{}

      assert {:ok, %UserCards{} = user_cards} = GameStructure.update_user_cards(user_cards, update_attrs)
    end

    test "update_user_cards/2 with invalid data returns error changeset" do
      user_cards = user_cards_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_user_cards(user_cards, @invalid_attrs)
      assert user_cards == GameStructure.get_user_cards!(user_cards.id)
    end

    test "delete_user_cards/1 deletes the user_cards" do
      user_cards = user_cards_fixture()
      assert {:ok, %UserCards{}} = GameStructure.delete_user_cards(user_cards)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_user_cards!(user_cards.id) end
    end

    test "change_user_cards/1 returns a user_cards changeset" do
      user_cards = user_cards_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_user_cards(user_cards)
    end
  end

  describe "matches" do
    alias AnimalBackend.GameStructure.Match

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert GameStructure.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert GameStructure.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{}

      assert {:ok, %Match{} = match} = GameStructure.create_match(valid_attrs)
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      update_attrs = %{}

      assert {:ok, %Match{} = match} = GameStructure.update_match(match, update_attrs)
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_match(match, @invalid_attrs)
      assert match == GameStructure.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = GameStructure.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_match(match)
    end
  end

  describe "match_users" do
    alias AnimalBackend.GameStructure.MatchUser

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{total_power: nil}

    test "list_match_users/0 returns all match_users" do
      match_user = match_user_fixture()
      assert GameStructure.list_match_users() == [match_user]
    end

    test "get_match_user!/1 returns the match_user with given id" do
      match_user = match_user_fixture()
      assert GameStructure.get_match_user!(match_user.id) == match_user
    end

    test "create_match_user/1 with valid data creates a match_user" do
      valid_attrs = %{total_power: 42}

      assert {:ok, %MatchUser{} = match_user} = GameStructure.create_match_user(valid_attrs)
      assert match_user.total_power == 42
    end

    test "create_match_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_match_user(@invalid_attrs)
    end

    test "update_match_user/2 with valid data updates the match_user" do
      match_user = match_user_fixture()
      update_attrs = %{total_power: 43}

      assert {:ok, %MatchUser{} = match_user} = GameStructure.update_match_user(match_user, update_attrs)
      assert match_user.total_power == 43
    end

    test "update_match_user/2 with invalid data returns error changeset" do
      match_user = match_user_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_match_user(match_user, @invalid_attrs)
      assert match_user == GameStructure.get_match_user!(match_user.id)
    end

    test "delete_match_user/1 deletes the match_user" do
      match_user = match_user_fixture()
      assert {:ok, %MatchUser{}} = GameStructure.delete_match_user(match_user)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_match_user!(match_user.id) end
    end

    test "change_match_user/1 returns a match_user changeset" do
      match_user = match_user_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_match_user(match_user)
    end
  end

  describe "match_user_cards" do
    alias AnimalBackend.GameStructure.MatchUserCard

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{}

    test "list_match_user_cards/0 returns all match_user_cards" do
      match_user_card = match_user_card_fixture()
      assert GameStructure.list_match_user_cards() == [match_user_card]
    end

    test "get_match_user_card!/1 returns the match_user_card with given id" do
      match_user_card = match_user_card_fixture()
      assert GameStructure.get_match_user_card!(match_user_card.id) == match_user_card
    end

    test "create_match_user_card/1 with valid data creates a match_user_card" do
      valid_attrs = %{}

      assert {:ok, %MatchUserCard{} = match_user_card} = GameStructure.create_match_user_card(valid_attrs)
    end

    test "create_match_user_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_match_user_card(@invalid_attrs)
    end

    test "update_match_user_card/2 with valid data updates the match_user_card" do
      match_user_card = match_user_card_fixture()
      update_attrs = %{}

      assert {:ok, %MatchUserCard{} = match_user_card} = GameStructure.update_match_user_card(match_user_card, update_attrs)
    end

    test "update_match_user_card/2 with invalid data returns error changeset" do
      match_user_card = match_user_card_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_match_user_card(match_user_card, @invalid_attrs)
      assert match_user_card == GameStructure.get_match_user_card!(match_user_card.id)
    end

    test "delete_match_user_card/1 deletes the match_user_card" do
      match_user_card = match_user_card_fixture()
      assert {:ok, %MatchUserCard{}} = GameStructure.delete_match_user_card(match_user_card)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_match_user_card!(match_user_card.id) end
    end

    test "change_match_user_card/1 returns a match_user_card changeset" do
      match_user_card = match_user_card_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_match_user_card(match_user_card)
    end
  end

  describe "sets" do
    alias AnimalBackend.GameStructure.Set

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{set_position: nil}

    test "list_sets/0 returns all sets" do
      set = set_fixture()
      assert GameStructure.list_sets() == [set]
    end

    test "get_set!/1 returns the set with given id" do
      set = set_fixture()
      assert GameStructure.get_set!(set.id) == set
    end

    test "create_set/1 with valid data creates a set" do
      valid_attrs = %{set_position: 42}

      assert {:ok, %Set{} = set} = GameStructure.create_set(valid_attrs)
      assert set.set_position == 42
    end

    test "create_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_set(@invalid_attrs)
    end

    test "update_set/2 with valid data updates the set" do
      set = set_fixture()
      update_attrs = %{set_position: 43}

      assert {:ok, %Set{} = set} = GameStructure.update_set(set, update_attrs)
      assert set.set_position == 43
    end

    test "update_set/2 with invalid data returns error changeset" do
      set = set_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_set(set, @invalid_attrs)
      assert set == GameStructure.get_set!(set.id)
    end

    test "delete_set/1 deletes the set" do
      set = set_fixture()
      assert {:ok, %Set{}} = GameStructure.delete_set(set)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_set!(set.id) end
    end

    test "change_set/1 returns a set changeset" do
      set = set_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_set(set)
    end
  end

  describe "moviments" do
    alias AnimalBackend.GameStructure.Moviment

    import AnimalBackend.GameStructureFixtures

    @invalid_attrs %{is_first_moviment?: nil}

    test "list_moviments/0 returns all moviments" do
      moviment = moviment_fixture()
      assert GameStructure.list_moviments() == [moviment]
    end

    test "get_moviment!/1 returns the moviment with given id" do
      moviment = moviment_fixture()
      assert GameStructure.get_moviment!(moviment.id) == moviment
    end

    test "create_moviment/1 with valid data creates a moviment" do
      valid_attrs = %{is_first_moviment?: true}

      assert {:ok, %Moviment{} = moviment} = GameStructure.create_moviment(valid_attrs)
      assert moviment.is_first_moviment? == true
    end

    test "create_moviment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameStructure.create_moviment(@invalid_attrs)
    end

    test "update_moviment/2 with valid data updates the moviment" do
      moviment = moviment_fixture()
      update_attrs = %{is_first_moviment?: false}

      assert {:ok, %Moviment{} = moviment} = GameStructure.update_moviment(moviment, update_attrs)
      assert moviment.is_first_moviment? == false
    end

    test "update_moviment/2 with invalid data returns error changeset" do
      moviment = moviment_fixture()
      assert {:error, %Ecto.Changeset{}} = GameStructure.update_moviment(moviment, @invalid_attrs)
      assert moviment == GameStructure.get_moviment!(moviment.id)
    end

    test "delete_moviment/1 deletes the moviment" do
      moviment = moviment_fixture()
      assert {:ok, %Moviment{}} = GameStructure.delete_moviment(moviment)
      assert_raise Ecto.NoResultsError, fn -> GameStructure.get_moviment!(moviment.id) end
    end

    test "change_moviment/1 returns a moviment changeset" do
      moviment = moviment_fixture()
      assert %Ecto.Changeset{} = GameStructure.change_moviment(moviment)
    end
  end
end
