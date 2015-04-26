defmodule Jabba.Config do

  def host do
    get_env(:url)[:host]
  end

  defp get_env(key) do
    Jabba.Endpoint.config(key)
  end
end
