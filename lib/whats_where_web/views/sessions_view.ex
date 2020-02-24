defmodule WhatsWhereWeb.SessionsView do
  use WhatsWhereWeb, :view

  def create_session_url(conn) do
    Routes.sessions_path(conn, :create)
  end
end
