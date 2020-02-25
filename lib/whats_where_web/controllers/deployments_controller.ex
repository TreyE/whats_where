defmodule WhatsWhereWeb.DeploymentsController do
  use WhatsWhereWeb, :controller

  def new(conn, _) do
    deployment = WhatsWhere.blank_deployment()
    render(conn, "new.html", %{form: deployment})
  end

  def create(conn, %{"deployment" => params}) do
    result = WhatsWhere.create_deployment_from_params(params)
    case result do
      {:error, cs} -> render(conn, "new.html", %{form: cs})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.deployments_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => deployment_id}) do
    deployment = WhatsWhere.editable_deployment(deployment_id)
    render(conn, "edit.html", %{form: deployment, id: deployment_id})
  end

  def update(conn, %{"deployment" => params, "id" => deployment_id}) do
    result = WhatsWhere.update_deployment_from_params(deployment_id, params)
    case result do
      {:error, cs} -> render(conn, "edit.html", %{form: cs, id: deployment_id})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.deployments_path(conn, :index))
    end
  end

  def index(conn, _) do
    deployments = WhatsWhere.deployment_list()
    render(conn, "index.html", %{deployments: deployments})
  end
end
