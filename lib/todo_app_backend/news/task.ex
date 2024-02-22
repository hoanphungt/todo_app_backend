defmodule TodoAppBackend.News.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :status, :boolean, default: false
    field :text, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:text, :status])
    |> validate_required([:text, :status])
  end
end
