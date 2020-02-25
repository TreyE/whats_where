defmodule WhatsWhere.Commands.UpdateDeployment do
  alias WhatsWhere.Data.Deployment
  alias WhatsWhere.Repo

  def get_editable_deployment(id) do
    record = Repo.get!(Deployment, id)
    Deployment.editable(record)
  end

  def update_deployment_from_params(id, params) do
    record = Repo.get!(Deployment, id)
    cs = Deployment.changeset(record, params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> update_deployment(cs)
    end
  end

  defp update_deployment(cs) do
    record = Repo.update!(cs)
    WhatsWhere.broadcast_deployment_updates()
    {:ok, record}
  end
end
