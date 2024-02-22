defmodule TodoAppBackend.NewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoAppBackend.News` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        status: true,
        text: "some text"
      })
      |> TodoAppBackend.News.create_task()

    task
  end
end
