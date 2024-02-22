defmodule TodoAppBackend.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :text, :string
      add :status, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
