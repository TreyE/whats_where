defmodule WhatsWhere.Commands.DestroyEnvironmentTest do
  use ExUnit.Case, async: true

  alias WhatsWhere.Repo
  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Data.Program
  alias WhatsWhere.Data.Deployment

  alias WhatsWhere.Commands.DestroyEnvironment

  alias Mocks.Commands.DestroyEnvironment.NotificationMock

  import Ecto.Query

  setup %{} do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    environment = build_environment()
    deployment = build_deployment(environment)
    %{
      environment_record: environment,
      deployment_record: deployment
    }
  end

  test "destroys the environment", context do
    environment_id = context[:environment_record].id
    DestroyEnvironment.destroy_environment(environment_id)
    found_environment = Repo.get(Environment, environment_id)
    nil = found_environment
  end

  test "destroys the associated deployments", context do
    environment_id = context[:environment_record].id
    DestroyEnvironment.destroy_environment(environment_id)
    found_deployments = deployments_for_environment(environment_id)
    [] = found_deployments
  end

  test "sends notifications", context do
    NotificationMock.setup()
    NotificationMock.allow(
      :broadcast_environment_updates,
      [],
      :ok
    )
    NotificationMock.expect(
      :broadcast_environment_updates,
      []
    )
    NotificationMock.allow(
      :broadcast_deployment_updates,
      [],
      :ok
    )
    NotificationMock.expect(
      :broadcast_deployment_updates,
      []
    )
    environment_id = context[:environment_record].id
    DestroyEnvironment.destroy_environment(environment_id, NotificationMock)
    NotificationMock.verify()
  end

  defp build_environment() do
    env = Environment.new(
      %{
        name: "TestEnvForDestroyEnvironment",
        status: "in_use"
      }
    )
    Repo.insert!(env)
  end

  defp build_deployment(env) do
    prog_cs = Program.new(
      %{
        name: "TestEnvForDestroyEnvironment"
      }
    )
    prog = Repo.insert!(prog_cs)
    dep_cs = Deployment.new(
      %{
        environment_id: env.id,
        program_id: prog.id,
        branch: "master"
      }
    )
    Repo.insert!(dep_cs)
  end

  defp deployments_for_environment(env_id) do
    query = (
      from d in Deployment,
      where: d.environment_id == ^env_id
    )
    Repo.all(query)
  end
end
