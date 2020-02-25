defmodule WhatsWhere.Queries.Deployments do
  import Ecto.Query

  alias WhatsWhere.Data.Deployment
  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Data.Program

  def deployment_list() do
    query = (
      from d in Deployment,
      join: p in Program,
      on: d.program_id == p.id,
      join: e in Environment,
      on: d.environment_id == e.id,
      preload: [:environment, :program],
      order_by: [e.name, p.name, d.branch]
    )
    WhatsWhere.Repo.all(query)
  end
end
