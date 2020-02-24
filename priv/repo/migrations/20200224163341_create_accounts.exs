defmodule WhatsWhere.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table("accounts") do
      add :username, :string, size: 255, null: false
      add :encrypted_password, :string, size: 2048, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create unique_index(:accounts, [:username], name: :unique_username)

    execute("""
    INSERT INTO accounts (username,encrypted_password,inserted_at,updated_at)
      VALUES (
        'sysadmin',
        '$pbkdf2-sha512$160000$KhHzBzcUjgNvKfWcf4ezRg$7tMx0zsOeXD5U2RVmmvyRG9yFktFODmveERFLNkmLGRqoNjoxSTMOBfw77oyEM0HKXrtvTqWsmAlLzblI4XfCA',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
      );
    """)
  end
end
