defmodule AnimalBackendWeb.UserAuth do
  use AnimalBackendWeb, :verified_routes

  import Plug.Conn

  alias AnimalBackend.Accounts

  def fetch_api_user(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, user} <- Accounts.fetch_user_by_api_token(token) do
      assign(conn, :current_user, user)
    else
      _ ->
        conn
        |> send_resp(:unauthorized, "No access for you")
        |> halt()
    end
  end
end
