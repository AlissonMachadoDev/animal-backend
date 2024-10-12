defmodule AnimalBackendWeb.UserSettingsController do
  use AnimalBackendWeb, :controller

  import AnimalBackendWeb.ErrorHelpers

  alias AnimalBackend.Accounts

  def update(conn, %{"action" => "update_email"} = params) do
    %{"current_password" => password, "user" => user_params} = params
    user = conn.assigns.current_user

    case Accounts.apply_user_email(user, password, user_params) do
      {:ok, applied_user} ->
        Accounts.deliver_user_update_email_instructions(
          applied_user,
          user.email,
          &url(~p"/api/users/settings/confirm_email/#{&1}")
        )

        conn
        |> put_status(:ok)
        |> json(%{info: "A link to confirm your email change has been sent to the new address."})

      {:error, changeset} ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
    end
  end

  def update(conn, %{"action" => "update_password"} = params) do
    %{"current_password" => password, "user" => user_params} = params
    user = conn.assigns.current_user

    case Accounts.update_user_password(user, password, user_params) do
      {:ok, _user} ->
        conn
        |> put_status(:ok)
        |> json(%{info: "Password updated with success, please, do your login again."})

      {:error, changeset} ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
    end
  end

  def confirm_email(conn, %{"token" => token}) do
    {:ok, user} = Accounts.get_user_changing_email(token)

    case Accounts.update_user_email(user, token) do
      :ok ->
        conn
        |> put_status(:ok)
        |> json(%{info: "Email updated with success, please, do your login again."})

      :error ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{error: "Email change link is invalid or it has expired."})
    end
  end
end
