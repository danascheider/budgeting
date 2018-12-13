defmodule BudgetingWeb.UserView do
  use BudgetingWeb, :view

  alias Budgeting.Accounts.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
