defmodule WhatsWhereWeb.Channels.EnvironmentUpdatesChannel do
  use Phoenix.Channel

  def join("environment_updates", _params, socket) do
    {:ok, socket}
  end

  def broadcast_environments_updated() do
    WhatsWhereWeb.Endpoint.broadcast(
      "environment_updates",
      "environments_updated",
      %{}
    )
  end
end
