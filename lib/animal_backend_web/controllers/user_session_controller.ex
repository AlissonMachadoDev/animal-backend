defmodule AnimalBackendWeb.UserSessionController do
  use AnimalBackendWeb, :controller

  alias AnimalBackend.Accounts

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      conn
      |> put_status(:ok)
      |> json(%{user: user, token: Accounts.create_user_api_token(user)})
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      conn
      |> put_status(:expectation_failed)
      |> json(%{error: "Invalid email or password"})
    end
  end

  def delete(conn, _params) do
    ["Bearer " <> token] = get_req_header(conn, "authorization")
    {:ok, decoded_token} = Base.url_decode64(token, padding: false)
    hashed_token = :crypto.hash(:sha256, decoded_token)

    with {1, _} <- Accounts.delete_user_api_token(hashed_token) do
      conn
      |> put_status(:ok)
      |> json(%{message: "log out successfully."})
    else
      {0, _} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: "token not found."})
    end
  end
end
