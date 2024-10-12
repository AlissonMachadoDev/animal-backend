defmodule AnimalBackendWeb.UserRegistrationController do
  use AnimalBackendWeb, :controller

  import AnimalBackendWeb.ErrorHelpers

  alias AnimalBackend.Accounts

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/api/users/confirm/#{&1}")
          )

        conn
        |> put_status(:ok)
        |> json(%{user: user})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
    end
  end
end
