defmodule WhatsWhere.Queries.Environments do
  import Ecto.Query

  alias WhatsWhere.Data.Environment

  def environment_list() do
    query = (
      from e in Environment,
      order_by: e.name,
      where: (e.status != "unprovisioned")
    )
    WhatsWhere.Repo.all(query)
  end
end
