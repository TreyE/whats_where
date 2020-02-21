use Mix.Config

# Configure your database
config :whats_where, WhatsWhere.Repo,
  database: "whats_where_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :whats_where, WhatsWhereWeb.Endpoint,
  http: [port: 4002],
  server: false

config :junit_formatter,
  report_dir: "."

# Print only warnings and errors during test
config :logger, level: :warn
