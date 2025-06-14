defmodule VeasytDashboardWeb.PageController do
  use VeasytDashboardWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
