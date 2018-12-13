defmodule BudgetingWeb.SessionController do
  use BudgetingWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case BudgetingWeb.Auth.login_by_email_and_password(conn, email, password) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> BudgetingWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
