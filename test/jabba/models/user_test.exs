defmodule Jabba.UserTest do
  use ExUnit.Case

  alias Jabba.User

  @default %{
    username: "jbob",
    name: "joe bob",
    email: "jbob@jabba.dev",
    password: "password"}

  test "it validates :username is required" do
    user = User.new(Map.merge(@default, %{username: ""}))
    assert user.errors == [:username, {}]
  end
end
