# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

config :whats_where, WhatsWhereWeb.Endpoint,
  secret_key_base: (System.get_env("HTTP_SECRET_KEY_BASE") || raise "SECRET KEY BASE UNSPECIFIED")

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :whats_where, WhatsWhereWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
