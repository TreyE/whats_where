defmodule WhatsWhereWeb.PageView do
  use WhatsWhereWeb, :view

  def background_environment_status(environment) do
    case environment.status do
      "in_use" -> "bg-info"
      "reserved" -> "bg-primary"
      "available" -> "bg-success"
      "deploying" -> "bg-warning"
      "down" -> "bg-danger"
      _ -> "bg-dark"
    end
  end

  def has_owner(environment) do
    case environment.owner do
      nil -> false
      "" -> false
      "reserved" -> true
      _ -> (environment.status == "in_use")
    end
  end
end
