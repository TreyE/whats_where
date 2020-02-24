defmodule WhatsWhere.Data.EnvironmentStatus do
  @allowed_statuses [
    "available",
    "in_use",
    "deploying",
    "down",
    "unprovisioned"
  ]

  def allowed_values() do
    @allowed_statuses
  end

  def select_list() do
    Enum.map(@allowed_statuses, fn(stat) ->
      {titleize(stat),stat}
    end)
  end

  defp titleize(stat) do
    stat
    |> String.replace("_", " ", global: true)
    |> String.capitalize()
  end
end
