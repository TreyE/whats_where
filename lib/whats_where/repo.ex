defmodule WhatsWhere.Repo do
  use Ecto.Repo,
    otp_app: :whats_where,
    adapter: Ecto.Adapters.Postgres
end
