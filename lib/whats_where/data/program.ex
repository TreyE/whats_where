defmodule WhatsWhere.Data.Program do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime_usec]

  schema "programs" do
    field :name, :string

    timestamps()
  end

  def blank() do
    %WhatsWhere.Data.Program{}
    |> cast(%{}, [])
  end

  def new(attrs) do
    changeset(%WhatsWhere.Data.Program{}, attrs)
  end

  def editable(program) do
    program
    |> cast(%{}, [])
  end

  def changeset(%WhatsWhere.Data.Program{} = program, attrs) do
    program
    |> cast(attrs, [:name])
    |> validate_required(:name)
    |> validate_length(:name, min: 5, max: 255)
  end
end
