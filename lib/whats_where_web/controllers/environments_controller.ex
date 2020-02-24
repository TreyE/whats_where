defmodule WhatsWhereWeb.EnvironmentsController do
  use WhatsWhereWeb, :controller

  def new(conn, _) do
    environment = WhatsWhere.blank_environment()
    render(conn, "new.html", %{form: environment})
  end

  def create(conn, %{"environment" => params}) do
    result = WhatsWhere.create_environment_from_params(params)
    case result do
      {:error, cs} -> render(conn, "new.html", %{form: cs})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.environments_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => environment_id}) do
    environment = WhatsWhere.editable_environment(environment_id)
    render(conn, "edit.html", %{form: environment, id: environment_id})
  end

  def update(conn, %{"environment" => params, "id" => environment_id}) do
    result = WhatsWhere.update_environment_from_params(environment_id, params)
    case result do
      {:error, cs} -> render(conn, "edit.html", %{form: cs, id: environment_id})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.environments_path(conn, :index))
    end
  end

  def index(conn, _) do
    environments = WhatsWhere.environment_list()
    render(conn, "index.html", %{environments: environments})
  end
end
