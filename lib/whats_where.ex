defmodule WhatsWhere do
  @moduledoc """
  WhatsWhere keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias WhatsWhereWeb.Channels.EnvironmentUpdatesChannel

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

  def environment_list() do
    WhatsWhere.Repo.all(WhatsWhere.Data.Environment)
  end

  def broadcast_environment_updates() do
    EnvironmentUpdatesChannel.broadcast_environments_updated()
  end
end
