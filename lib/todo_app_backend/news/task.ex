defmodule TodoAppBackend.News.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :status, :boolean, default: false
    field :text, :string
    field :due_date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:text, :status, :due_date])
    |> validate_required([:text, :status])
  end
end
