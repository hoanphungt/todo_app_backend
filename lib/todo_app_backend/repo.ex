defmodule TodoAppBackend.Repo do
  use Ecto.Repo,
    otp_app: :todo_app_backend,
    adapter: Ecto.Adapters.Postgres
end
