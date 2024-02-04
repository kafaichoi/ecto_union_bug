import Config

config :ecto_union_bug, EctoUnionBug.Repo,
  username: "postgres",
  password: "postgres",
  database: "myapp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
