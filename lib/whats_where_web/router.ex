defmodule WhatsWhereWeb.Router do
  use WhatsWhereWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :check_login do
    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"},
      module: WhatsWhere.Authentication.Guardian,
      error_handler: WhatsWhereWeb.SessionsController
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"},
      module: WhatsWhere.Authentication.Guardian,
      error_handler: WhatsWhereWeb.SessionsController
    plug Guardian.Plug.EnsureAuthenticated,
      module: WhatsWhere.Authentication.Guardian,
      error_handler: WhatsWhereWeb.SessionsController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhatsWhereWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/matrix", PageController, :matrix
    resources "/sessions", SessionsController, only: [:new, :create]
  end

  scope "/", WhatsWhereWeb do
    pipe_through([:browser, :check_login])

    delete "/sessions", SessionsController, :destroy
    resources "/environments", EnvironmentsController, only: [:new, :create, :index, :edit, :update]
    resources "/programs", ProgramsController, except: [:show, :delete]
    resources "/deployments", DeploymentsController, except: [:show, :delete]
  end
  # Other scopes may use custom stacks.
  # scope "/api", WhatsWhereWeb do
  #   pipe_through :api
  # end
end
