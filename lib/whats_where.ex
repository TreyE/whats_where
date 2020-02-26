defmodule WhatsWhere do
  @moduledoc """
  WhatsWhere keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias WhatsWhereWeb.Channels.EnvironmentUpdatesChannel
  alias WhatsWhereWeb.Channels.DeploymentUpdatesChannel
  alias WhatsWhere.Commands.DestroyEnvironment
  alias WhatsWhere.Queries.Deployments
  alias WhatsWhere.Queries.Environments
  alias WhatsWhere.Queries.Programs

  def blank_environment() do
    WhatsWhere.Data.Environment.blank()
  end

  def editable_environment(id) do
    WhatsWhere.Commands.UpdateEnvironment.get_editable_environment(id)
  end

  def environment_status_select_list() do
    WhatsWhere.Data.EnvironmentStatus.select_list()
  end

  def create_environment_from_params(params) do
    WhatsWhere.Commands.CreateEnvironment.create_environment_from_params(params)
  end

  def update_environment_from_params(id, params) do
    WhatsWhere.Commands.UpdateEnvironment.update_environment_from_params(id, params)
  end

  def blank_program() do
    WhatsWhere.Data.Program.blank()
  end

  def editable_program(id) do
    WhatsWhere.Commands.UpdateProgram.get_editable_program(id)
  end

  def create_program_from_params(params) do
    WhatsWhere.Commands.CreateProgram.create_program_from_params(params)
  end

  def update_program_from_params(id, params) do
    WhatsWhere.Commands.UpdateProgram.update_program_from_params(id, params)
  end

  def blank_deployment() do
    WhatsWhere.Data.Deployment.blank()
  end

  def editable_deployment(id) do
    WhatsWhere.Commands.UpdateDeployment.get_editable_deployment(id)
  end

  def create_deployment_from_params(params) do
    WhatsWhere.Commands.CreateDeployment.create_deployment_from_params(params)
  end

  def update_deployment_from_params(id, params) do
    WhatsWhere.Commands.UpdateDeployment.update_deployment_from_params(id, params)
  end

  def program_list() do
    Programs.program_list()
  end

  def environment_list() do
    Environments.environment_list()
  end

  def display_environment_list() do
    Environments.display_environment_list()
  end

  def deployment_list() do
    Deployments.deployment_list()
  end

  def matrix_deployment_list() do
    Deployments.matrix_deployment_list()
  end

  def broadcast_environment_updates() do
    EnvironmentUpdatesChannel.broadcast_environments_updated()
  end

  def broadcast_deployment_updates() do
    DeploymentUpdatesChannel.broadcast_deployments_updated()
  end

  def environment_names_ids() do
    Environments.environment_names_ids()
  end

  def program_names_ids() do
    Programs.program_names_ids()
  end

  def destroy_environment(id) do
    DestroyEnvironment.destroy_environment(id)
  end
end
