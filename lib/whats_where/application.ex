defmodule WhatsWhere.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      WhatsWhere.Repo,
      # Start things which require the repository
      %{
        id: WhatsWhere.RepositoryDependents,
        type: :supervisor,
        start: {WhatsWhere.RepositoryDependents, :start_link, []}
      }
      # Starts a worker by calling: WhatsWhere.Worker.start_link(arg)
      # {WhatsWhere.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: WhatsWhere.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WhatsWhereWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
