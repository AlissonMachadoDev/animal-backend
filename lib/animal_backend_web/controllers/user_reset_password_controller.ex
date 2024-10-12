defmodule AnimalBackendWeb.UserResetPasswordController do
  use AnimalBackendWeb, :controller

  import AnimalBackendWeb.ErrorHelpers

  alias AnimalBackend.Accounts

  def create(conn, %{"user" => %{"email" => email}}) do
    case Accounts.get_user_by_email(email) do
      %Accounts.User{} = user ->
        Accounts.deliver_user_reset_password_instructions(
          user,
          &url(~p"/api/users/reset_password/#{&1}")
        )

        conn
        |> put_status(:ok)
        |> json(%{info: "Reset password steps sent with success."})

      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{info: "No user with this email was found."})
    end
  end

  # Do not log in the user after reset password to avoid a
  # leaked token giving the user access to the account.
  def update(conn, %{"user" => user_params}) do
    ["Bearer " <> bearer_token] = get_req_header(conn, "authorization")

    with {:ok, user} <- Accounts.fetch_user_by_api_token(bearer_token) do
      case Accounts.reset_user_password(user, user_params) do
        {:ok, _} ->
          conn
          |> put_status(:ok)
          |> json(%{info: "password updated with success."})

        {:error, changeset} ->
          conn
          |> put_status(:expectation_failed)
          |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
      end
    else
      _ ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{info: "Invalid password token."})
    end
  end
end
