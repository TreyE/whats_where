defmodule WhatsWhereWeb.PageController do
  use WhatsWhereWeb, :controller

  def index(conn, _params) do
    environments = WhatsWhere.environment_list()
    render(conn, "index.html", %{environments: environments})
  end
end
