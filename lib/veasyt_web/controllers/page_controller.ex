defmodule VeasytWeb.PageController do
  use VeasytWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
