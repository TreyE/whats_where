defmodule WhatsWhere.Repo.Migrations.UpdateEnvironmentStatusConstraints do
  use Ecto.Migration

  def up do
    drop constraint(:environments, :status_value, check: "status in ('in_use','available','deploying','down','unprovisioned')")
    create constraint(:environments, :status_value, check: "status in ('in_use','reserved','available','deploying','down','unprovisioned')")
  end

  def down do
    drop constraint(:environments, :status_value, check: "status in ('in_use','reserved','available','deploying','down','unprovisioned')")
    create constraint(:environments, :status_value, check: "status in ('in_use','available','deploying','down','unprovisioned')")
  end
end
