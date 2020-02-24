use Mix.Config

# Configure your database
config :whats_where, WhatsWhere.Repo,
  database: "whats_where_test",
  hostname: "localhost",
  username: "postgres",
  password: "",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :whats_where, WhatsWhereWeb.Endpoint,
  http: [port: 4002],
  server: false

config :whats_where, WhatsWhere.Authentication.Guardian,
  issuer: "WhatsWhere",
  secret_key: "rqvGULwGescBTkL8sgigX+AxL4m992vlrkNy7QkO1bifWuFEGQuNWBPS3kx2IBBf"

config :junit_formatter,
  report_dir: "."

# Print only warnings and errors during test
config :logger, level: :warn
