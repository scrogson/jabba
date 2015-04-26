defmodule Jabba.User do
  use Jabba.Web, :model

  schema "users" do
    field :username
    field :name
    field :email
    field :password
  end

  @required_fields ~w(username name email password)

  def new do
    cast(%__MODULE__{}, nil, @required_fields)
  end

  def new(params) do
    cast(%__MODULE__{}, params, @required_fields)
    |> update_change(:name, &format_name/1)
    |> update_change(:username, &String.downcase/1)
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:username, min: 1)
    |> validate_length(:name, min: 1)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_unique_user()
  end

  def create(%{changes: user}) do
    :ejabberd_auth.try_register(user.username, host, user.password)
    setup_vcard(user)
  end

  defp setup_vcard(user) do
    :mod_admin_extra.set_nickname(user.username, host, user.username)
    :mod_admin_extra.set_vcard(user.username, host, "FN", user.name)
    :mod_admin_extra.set_vcard(user.username, host, "EMAIL", "USERID", user.email)
  end

  defp format_name(name) do
    Enum.map_join(String.split(name), " ", &String.capitalize(&1))
  end

  defp validate_unique_user(%{changes: user} = changeset) do
    case :ejabberd_auth.is_user_exists(user.username, host) do
      true  -> add_error(changeset, :username, "already exists")
      false -> changeset
    end
  end
end
