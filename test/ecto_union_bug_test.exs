defmodule EctoUnionBugTest do
  use ExUnit.Case
  doctest EctoUnionBug

  alias EctoUnionBug.Repo
  import Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoUnionBug.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(EctoUnionBug.Repo, {:shared, self()})
    :ok
  end

  defmodule Post do
    use Ecto.Schema
    import Ecto.Changeset

    schema "posts" do
      field(:title, :string)
      field(:subtitle, :string)
    end
  end

  test "bug" do
    post1 = %Post{title: "post1", subtitle: "post1_subtitle"}
    post2 = %Post{subtitle: "post2_subtitle", title: "post2"}
    Repo.insert(post1)
    Repo.insert(post2)

    union_query1 =
      from(p in Post,
        where: p.title == "post1",
        select: %{id: p.id, title: p.title, subtitle: p.subtitle}
      )

    union_query2 =
      from(p in Post,
        where: p.title == "post2",
        select: %{id: p.id, subtitle: p.subtitle, title: p.title}
      )

    post1 =
      union_query2
      |> union(^union_query1)
      |> Repo.all()
      |> dbg()
      |> Enum.find(&(&1.title == "post1"))

    refute is_nil(post1)
  end
end
