defmodule WhatsWhereWeb.Channels.DeploymentUpdatesChannel do
  use Phoenix.Channel

  def join("deployment_updates", _params, socket) do
    {:ok, socket}
  end

  def broadcast_deployments_updated() do
    WhatsWhereWeb.Endpoint.broadcast(
      "deployment_updates",
      "deployments_updated",
      %{}
    )
  end
end
