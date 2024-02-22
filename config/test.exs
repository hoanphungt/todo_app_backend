import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :todo_app_backend, TodoAppBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "todo_app_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo_app_backend, TodoAppBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MD2JUgFETfOum9WHhCfiVQfx9lakPgGUfhEgs4MjJNzLW/00yFkN5PAU85PX3skl",
  server: false

# In test we don't send emails.
config :todo_app_backend, TodoAppBackend.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
