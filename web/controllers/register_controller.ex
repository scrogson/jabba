defmodule Jabba.RegisterController do
  use Jabba.Web, :controller

  alias Jabba.User

  plug :action

  def new(conn, _params) do
    user = User.new
    render conn, "new.html", user: user
  end

  def create(conn, %{"user" => params}) do
    user = User.new(params)
    if user.valid? do
      User.create(user)
      conn
      |> put_flash(:info, "Registered successfully!")
      |> redirect(to: page_path(conn, :index))
    else
      render conn, "new.html", user: user
    end
  end
end
