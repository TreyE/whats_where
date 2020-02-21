# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :whats_where,
  ecto_repos: [WhatsWhere.Repo]

# Configures the endpoint
config :whats_where, WhatsWhereWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l2jTkZFr3O+zUT3wiEUyOzCdJSGFV9m45YDsWsLRsjCw1dYutjwwAdZ2O01KC9xv",
  render_errors: [view: WhatsWhereWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WhatsWhere.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "jQRca8e3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
