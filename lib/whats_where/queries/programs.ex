defmodule WhatsWhere.Queries.Programs do
  import Ecto.Query

  alias WhatsWhere.Data.Program

  def program_list() do
    query = (
      from e in Program,
      order_by: e.name
    )
    WhatsWhere.Repo.all(query)
  end

  def program_names_ids() do
    query = (
      from e in Program,
      order_by: e.name,
      select: {e.name, e.id}
    )
    WhatsWhere.Repo.all(query)
  end
end
