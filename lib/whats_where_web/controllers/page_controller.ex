defmodule WhatsWhereWeb.PageController do
  use WhatsWhereWeb, :controller

  alias WhatsWhereWeb.ViewModels.DeploymentMatrix

  def index(conn, _params) do
    environments = WhatsWhere.display_environment_list()
    render(conn, "index.html", %{environments: environments})
  end

  def matrix(conn, _params) do
    deployment_matrix = DeploymentMatrix.new(WhatsWhere.matrix_deployment_list())
    render(conn, "matrix.html", %{deployment_matrix: deployment_matrix})
  end
end
