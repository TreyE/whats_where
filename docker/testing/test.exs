use Mix.Config

# Configure your database
config :whats_where, WhatsWhere.Repo,
  username: "postgres",
  password: "postgres",
  database: "whats_where_test",
  hostname: "whats_where_test_db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :whats_where, WhatsWhereWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
