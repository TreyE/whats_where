defmodule WhatsWhereWeb.ProgramsController do
  use WhatsWhereWeb, :controller

  def new(conn, _) do
    program = WhatsWhere.blank_program()
    render(conn, "new.html", %{form: program})
  end

  def create(conn, %{"program" => params}) do
    result = WhatsWhere.create_program_from_params(params)
    case result do
      {:error, cs} -> render(conn, "new.html", %{form: cs})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.programs_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => program_id}) do
    program = WhatsWhere.editable_program(program_id)
    render(conn, "edit.html", %{form: program, id: program_id})
  end

  def update(conn, %{"program" => params, "id" => program_id}) do
    result = WhatsWhere.update_program_from_params(program_id, params)
    case result do
      {:error, cs} -> render(conn, "edit.html", %{form: cs, id: program_id})
      {:ok, _} -> redirect(conn, to: WhatsWhereWeb.Router.Helpers.programs_path(conn, :index))
    end
  end

  def index(conn, _) do
    programs = WhatsWhere.program_list()
    render(conn, "index.html", %{programs: programs})
  end
end
