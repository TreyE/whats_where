defmodule WhatsWhereWeb.PageController do
  use WhatsWhereWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
