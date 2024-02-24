defmodule TodoAppBackendWeb.Router do
  use TodoAppBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TodoAppBackendWeb.Schema,
      interface: :simple,
      context: %{pubsub: TodoAppBackendWeb.Endpoint}
  end
end
