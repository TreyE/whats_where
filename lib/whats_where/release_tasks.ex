defmodule WhatsWhere.ReleaseTasks do
@moduledoc """
  Application level tasks performed on the production server after deployment.

  Currently consists only of providing the ability to run database migrations.
  """

  @repos Application.get_env(:whats_where, :ecto_repos, [])

  def migrate(_argv) do
    Enum.each(@repos, fn(repo_mod) ->
      Ecto.Migrator.with_repo(repo_mod, fn(repo) ->
        migrations_path = priv_path_for(repo, "migrations")
        Ecto.Migrator.run(repo, migrations_path, :up, all: true)
      end)
    end)
  end

  defp priv_path_for(repo, filename) do
    app = Keyword.get(repo.config(), :otp_app)

    repo_underscore =
      repo
      |> Module.split()
      |> List.last()
      |> Macro.underscore()

    priv_dir = "#{:code.priv_dir(app)}"

    Path.join([priv_dir, repo_underscore, filename])
  end
end
