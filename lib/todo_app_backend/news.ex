defmodule TodoAppBackend.News do
  @moduledoc """
  The News context.
  """

  import Ecto.Query, warn: false
  alias TodoAppBackend.Repo

  alias TodoAppBackend.News.Task

  @doc """
  Returns the list of tasks.
  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.
  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.
  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.
  """
  def update_task(%{id: id} = args) do
    case Repo.get(Task, id) do
      nil ->
        {:error, "Task not found"}

      task ->
        task
        |> Task.changeset(args)
        |> Repo.update()
    end
  end

  @doc """
  Deletes a task.
  """
  def delete_task(%{id: id}) do
    case Repo.get(Task, id) do
      nil ->
        {:error, "Task not found"}

      task ->
        Repo.delete(task)
    end
  end
end
