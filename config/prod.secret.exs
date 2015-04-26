use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :jabba, Jabba.Endpoint,
  secret_key_base: "9/xAKf6HWm6zFlyK29X/ozMBhx13L+H0rdQa4+m2q3gnpmkctu6v0IcicZkkzEwC"

# Configure your database
config :jabba, Jabba.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jabba_prod"
