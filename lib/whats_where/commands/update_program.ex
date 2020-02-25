defmodule WhatsWhere.Commands.UpdateProgram do
  alias WhatsWhere.Data.Program
  alias WhatsWhere.Repo

  def get_editable_program(id) do
    record = Repo.get!(Program, id)
    Program.editable(record)
  end

  def update_program_from_params(id, params) do
    record = Repo.get!(Program, id)
    cs = Program.changeset(record, params)
    case cs.valid? do
      false -> {:error, cs}
      _ -> update_program(cs)
    end
  end

  defp update_program(cs) do
    record = Repo.update!(cs)
    {:ok, record}
  end
end
