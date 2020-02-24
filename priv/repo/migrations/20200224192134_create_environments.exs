defmodule WhatsWhere.Repo.Migrations.CreateEnvironments do
  use Ecto.Migration

  def change do
    create table("environments") do
      add :name, :string, size: 255, null: false
      add :owner, :string, size: 255, null: true
      add :status, :string, size: 64, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create unique_index(:environments, [:name], name: :unique_environments_name)
    create index(:environments, [:status])
    create index(:environments, [:owner])
    create constraint(:environments, :status_value, check: "status in ('in_use','available','deploying','down','unprovisioned')")
  end
end
