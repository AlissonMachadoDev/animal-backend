defmodule AnimalBackendWeb.UserConfirmationController do
  use AnimalBackendWeb, :controller

  alias AnimalBackend.Accounts

  def create(conn, %{"user" => %{"email" => email}}) do
    case Accounts.get_user_by_email(email) do
      %Accounts.User{} = user ->
        Accounts.deliver_user_confirmation_instructions(
          user,
          &url(~p"/api/users/confirm/#{&1}")
        )

        conn
        |> put_status(:ok)
        |> json(%{info: "User confirmation sent with success."})

      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{info: "No user with this email was found."})
    end
  end

  # Do not log in the user after confirmation to avoid a
  # leaked token giving the user access to the account.
  def update(conn, %{"token" => token}) do
    case Accounts.confirm_user(token) do
      {:ok, _} ->
        conn
        |> put_status(:ok)
        |> json(%{info: "User confirmed successfully."})

      :error ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{info: "Error when confirming accoumt, please, try again."})
    end
  end
end
