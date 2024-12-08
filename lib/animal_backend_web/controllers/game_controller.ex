defmodule AnimalBackendWeb.GameController do
  use AnimalBackendWeb, :controller

  alias AnimalBackend.Accounts
  alias AnimalBackend.GameFlow

  def create_match(conn, _) do
    ["Bearer " <> bearer_token] = get_req_header(conn, "authorization")

    with {:ok, user} <- Accounts.fetch_user_by_api_token(bearer_token) do
      case GameFlow.start_match(user) do
        {:ok, match} ->
          conn
          |> put_status(:ok)
          |> json(match)
      end
    else
      _ ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{info: "Invalid password token."})
    end
  end

  def get_user_match_cards(conn, %{"match_user_id" => match_user_id}) do
    cards = GameFlow.get_cards_from_match(match_user_id)

    conn
    |> put_status(:ok)
    |> json(cards)
  end

  # def start_set()

  def ready(conn, %{"match_user_id" => match_user_id}) do
    cards = GameFlow.get_cards_from_match(match_user_id)

    conn
    |> put_status(:ok)
    |> json(cards)
  end
end
