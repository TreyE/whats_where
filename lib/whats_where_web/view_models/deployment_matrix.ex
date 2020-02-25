defmodule WhatsWhereWeb.ViewModels.DeploymentMatrix do

  defstruct [
    environments: [],
    programs: [],
    matrix_entries: %{}
  ]

  def new(deployment_list) do
    environments = extract_environment_list(deployment_list)
    programs = extract_program_list(deployment_list)
    entry_map = build_entry_map(deployment_list)
    %__MODULE__{
      environments: environments,
      programs: programs,
      matrix_entries: entry_map
    }
  end

  def has_entry_for(dm, environment, prog_name) do
    Map.has_key?(dm.matrix_entries, {environment.id, prog_name})
  end

  def get_entry!(dm, environment, prog_name) do
    Map.fetch!(dm.matrix_entries, {environment.id, prog_name})
  end

  defp extract_environment_list(deployment_list) do
    deployment_list
    |> Enum.sort_by(fn(d) -> d.environment.name end)
    |> Enum.uniq_by(fn(d) -> d.environment.id end)
    |> Enum.map(fn(d) -> d.environment end)
  end

  defp extract_program_list(deployment_list) do
    deployment_list
    |> Enum.map(fn(d) -> d.program.name end)
    |> Enum.sort()
    |> Enum.uniq()
  end

  defp build_entry_map(deployment_list) do
    Enum.reduce(deployment_list, Map.new(), fn(d, acc) ->
      acc
      |> Map.put({d.environment.id, d.program.name}, d)
    end)
  end
end
