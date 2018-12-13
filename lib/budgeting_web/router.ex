defmodule BudgetingWeb.Router do
  use BudgetingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BudgetingWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BudgetingWeb do
    pipe_through :browser

    resources "/users", UserController, only: [:new, :create, :show, :index]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BudgetingWeb do
  #   pipe_through :api
  # end
end
