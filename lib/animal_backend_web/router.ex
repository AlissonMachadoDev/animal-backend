defmodule AnimalBackendWeb.Router do
  use AnimalBackendWeb, :router

  import AnimalBackendWeb.UserAuth

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth_api do
    plug :fetch_api_user
  end

  scope "/api", AnimalBackendWeb do
    pipe_through :api

    ## Authentication routes

    scope "/" do
      pipe_through [:auth_api]
      put "/users/settings", UserSettingsController, :update
      delete "/users/log_out", UserSessionController, :delete
      post "/users/confirm", UserConfirmationController, :create

      get "/match/start", GameController, :create_match
      post "/match/get-cards", GameController, :get_user_match_cards
    end

    scope "/" do
      post "/users/confirm/:token", UserConfirmationController, :update
      get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
      post "/users/register", UserRegistrationController, :create
      post "/users/log_in", UserSessionController, :create
      post "/users/reset_password", UserResetPasswordController, :create
      put "/users/reset_password/:token", UserResetPasswordController, :update
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:animal_backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: AnimalBackendWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
