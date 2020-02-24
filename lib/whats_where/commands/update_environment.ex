defmodule WhatsWhere.Commands.UpdateEnvironment do
  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Repo

  def get_editable_environment(id) do
    record = Repo.get!(Environment, id)
    Environment.editable(record)
  end

  def update_environment_from_params(id, params) do
    record = Repo.get!(Environment, id)
    cs = Environment.changeset(record, params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> update_environment(cs)
    end
  end

  defp update_environment(cs) do
    record = Repo.update!(cs)
    WhatsWhere.broadcast_environment_updates()
    {:ok, record}
  end
end
