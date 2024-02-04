import Config

config :ecto_union_bug, :ecto_repos, [EctoUnionBug.Repo]

config :ecto_union_bug, EctoUnionBug.Repo,
  database: "ecto_simple",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  # OR use a URL to connect instead
  url: "postgres://postgres:postgres@localhost/ecto_simple"

import_config "#{Mix.env()}.exs"
