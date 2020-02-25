defmodule WhatsWhere.Commands.CreateProgram do
  alias WhatsWhere.Data.Program
  alias WhatsWhere.Repo

  def create_program_from_params(params) do
    cs = Program.new(params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> build_program(cs)
    end
  end

  defp build_program(cs) do
    record = Repo.insert!(cs)
    WhatsWhere.broadcast_deployment_updates()
    {:ok, record}
  end
end
