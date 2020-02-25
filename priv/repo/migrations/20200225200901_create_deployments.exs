defmodule WhatsWhere.Repo.Migrations.CreateDeployments do
  use Ecto.Migration

  def change do
    create table("deployments") do
      add :branch, :string, size: 512, null: false

      add :environment_id, references(:environments), null: false
      add :program_id, references(:programs), null: false

      timestamps(type: :utc_datetime_usec)
    end

    create index(:deployments, [:environment_id])
    create index(:deployments, [:program_id])
  end
end
