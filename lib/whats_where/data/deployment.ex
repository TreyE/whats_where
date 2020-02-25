defmodule WhatsWhere.Data.Deployment do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime_usec]

  alias WhatsWhere.Data.Environment
  alias WhatsWhere.Data.Program

  schema "deployments" do
    field :branch, :string

    belongs_to :environment, Environment
    belongs_to :program, Program

    timestamps()
  end

  def blank() do
    %WhatsWhere.Data.Deployment{}
    |> cast(%{}, [])
  end

  def new(attrs) do
    changeset(%WhatsWhere.Data.Deployment{}, attrs)
  end

  def editable(deployment) do
    deployment
    |> cast(%{}, [])
  end

  def changeset(%WhatsWhere.Data.Deployment{} = deployment, attrs) do
    deployment
    |> cast(attrs, [:environment_id, :program_id, :branch])
    |> validate_required(:environment_id)
    |> validate_required(:program_id)
    |> validate_required(:branch)
    |> validate_length(:branch, min: 2, max: 512)
  end
end
