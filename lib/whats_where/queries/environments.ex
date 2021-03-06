defmodule WhatsWhere.Queries.Environments do
  import Ecto.Query

  alias WhatsWhere.Data.Environment

  def environment_list() do
    query = (
      from e in Environment,
      order_by: e.name
    )
    WhatsWhere.Repo.all(query)
  end

  def display_environment_list() do
    query = (
      from e in Environment,
      order_by: e.name,
      where: (e.status != "unprovisioned")
    )
    WhatsWhere.Repo.all(query)
  end

  def environment_names_ids() do
    query = (
      from e in Environment,
      order_by: e.name,
      select: {e.name, e.id}
    )
    WhatsWhere.Repo.all(query)
  end
end
