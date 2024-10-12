defmodule AnimalBackendWeb.UserAuthTest do
  use AnimalBackendWeb.ConnCase, async: true

  alias Phoenix.LiveView
  alias AnimalBackend.Accounts
  alias AnimalBackendWeb.UserAuth
  import AnimalBackend.AccountsFixtures

  @remember_me_cookie "_animal_backend_web_user_remember_me"

  setup %{conn: conn} do
    conn =
      conn
      |> Map.replace!(:secret_key_base, AnimalBackendWeb.Endpoint.config(:secret_key_base))
      |> init_test_session(%{})

    %{user: user_fixture(), conn: conn}
  end
end
