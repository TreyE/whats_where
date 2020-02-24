defmodule WhatsWhere.Data.Environment do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime_usec]

   schema "environments" do
    field :name, :string
    field :status, :string
    field :owner, :string

    timestamps()
  end

  def blank() do
    %WhatsWhere.Data.Environment{}
    |> cast(%{}, [])
  end

  def new(attrs) do
    changeset(%WhatsWhere.Data.Environment{}, attrs)
  end

  def editable(environment) do
    environment
    |> cast(%{}, [])
  end

  def changeset(%WhatsWhere.Data.Environment{} = environment, attrs) do
    environment
    |> cast(attrs, [:name, :status, :owner])
    |> validate_required(:name)
    |> validate_required(:status)
    |> validate_length(:name, min: 5, max: 255)
    |> validate_length(:owner, min: 0, max: 255)
    |> validate_inclusion(:status, WhatsWhere.Data.EnvironmentStatus.allowed_values())
  end
end
