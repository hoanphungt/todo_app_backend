defmodule TodoAppBackend.Repo.Migrations.AddDueDateToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :due_date, :date
    end
  end
end
