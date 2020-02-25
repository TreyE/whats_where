defmodule WhatsWhere.Commands.CreateEnvironment do
  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Repo

  def create_environment_from_params(params) do
    cs = Environment.new(params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> build_environment(cs)
    end
  end

  defp build_environment(cs) do
    record = Repo.insert!(cs)
    WhatsWhere.broadcast_environment_updates()
    WhatsWhere.broadcast_deployment_updates()
    {:ok, record}
  end
end
