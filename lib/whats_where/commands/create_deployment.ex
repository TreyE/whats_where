defmodule WhatsWhere.Commands.CreateDeployment do
  alias WhatsWhere.Data.Deployment
  alias WhatsWhere.Repo

  def create_deployment_from_params(params) do
    cs = Deployment.new(params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> build_deployment(cs)
    end
  end

  defp build_deployment(cs) do
    record = Repo.insert!(cs)
    {:ok, record}
  end
end
