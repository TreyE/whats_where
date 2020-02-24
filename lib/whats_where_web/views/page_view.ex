defmodule WhatsWhereWeb.PageView do
  use WhatsWhereWeb, :view

  def background_environment_status(environment) do
    case environment.status do
      "in_use" -> "bg-info"
      "available" -> "bg-success"
      "deploying" -> "bg-warning"
      "down" -> "bg-danger"
      "unprovisioned" -> "bg-dark"
      _ -> "bg-primary"
    end
  end

  def has_owner(environment) do
    case environment.owner do
      nil -> false
      "" -> false
      _ -> (environment.status == "in_use")
    end
  end
end
