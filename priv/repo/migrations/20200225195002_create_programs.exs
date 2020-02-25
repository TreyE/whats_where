defmodule WhatsWhere.Repo.Migrations.CreatePrograms do
  use Ecto.Migration

  def change do
    create table("programs") do
      add :name, :string, size: 255, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create unique_index(:programs, [:name], name: :unique_programs_name)
  end
end
