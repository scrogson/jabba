defmodule Jabba.PageController do
  use Jabba.Web, :controller

  plug :action

  def index(conn, _params) do
    users = :ejabberd_admin.registered_users(host)
    render conn, "index.html", users: users
  end
end
