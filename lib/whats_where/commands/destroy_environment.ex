defmodule WhatsWhere.Commands.DestroyEnvironment do
  alias WhatsWhere.Repo
  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Data.Deployment

  import Ecto.Query

  def destroy_environment(
      id,
      notification_mod \\ WhatsWhere
    ) do
    destroy_deployment_records(id)
    destroy_environment_record(id)
    notification_mod.broadcast_environment_updates()
    notification_mod.broadcast_deployment_updates()
  end

  defp destroy_environment_record(id) do
    environment = Repo.get!(Environment, id)
    Repo.delete!(environment)
  end

  defp destroy_deployment_records(env_id) do
    query = (
      from d in Deployment,
      where: d.environment_id == ^env_id
    )
    Repo.delete_all(query)
  end
end
