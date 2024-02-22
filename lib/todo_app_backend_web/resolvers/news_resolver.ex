defmodule TodoAppBackendWeb.NewsResolver do
  alias TodoAppBackend.News

  def all_tasks(_root, _args, _info) do
    {:ok, News.list_tasks()}
  end

  def create_task(_root, args, _info) do
    case News.create_task(args) do
      {:ok, task} -> {:ok, task}
      _error -> {:error, "could not create task"}
    end
  end

  def update_task(_root, args, _info) do
    case News.update_task(args) do
      {:ok, task} -> {:ok, task}
      _error -> {:error, "could not update task"}
    end
  end

  def delete_task(_root, args, _info) do
    case News.delete_task(args) do
      {:ok, task} -> {:ok, task}
      _error -> {:error, "could not delete task"}
    end
  end
end
