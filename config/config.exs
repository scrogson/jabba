# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :jabba, Jabba.Endpoint,
  url: [host: "jabba.dev"],
  root: Path.expand("..", __DIR__),
  secret_key_base: "VYI8kxSQ/aZmcRo9+zstDaVf39OEGWvQj4vrsHjmEouLl3Ol0fpPOI+d8dm8eFo4",
  debug_errors: false,
  pubsub: [name: Jabba.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ejabberd,
  file: "config/#{Mix.env}.ejabberd.yml",
  log_path: 'logs/ejabberd.log'

config :mnesia,
  dir: to_char_list("mnesia/#{Mix.env}")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
