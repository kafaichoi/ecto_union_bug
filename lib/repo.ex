defmodule EctoUnionBug.Repo do
  use Ecto.Repo,
    otp_app: :ecto_union_bug,
    adapter: Ecto.Adapters.Postgres
end
