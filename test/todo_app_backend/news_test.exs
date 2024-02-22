defmodule TodoAppBackend.NewsTest do
  use TodoAppBackend.DataCase

  alias TodoAppBackend.News

  describe "tasks" do
    alias TodoAppBackend.News.Task

    import TodoAppBackend.NewsFixtures

    @invalid_attrs %{status: nil, text: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert News.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert News.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{status: true, text: "some text"}

      assert {:ok, %Task{} = task} = News.create_task(valid_attrs)
      assert task.status == true
      assert task.text == "some text"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{status: false, text: "some updated text"}

      assert {:ok, %Task{} = task} = News.update_task(task, update_attrs)
      assert task.status == false
      assert task.text == "some updated text"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_task(task, @invalid_attrs)
      assert task == News.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = News.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> News.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = News.change_task(task)
    end
  end
end
