defmodule EctoUnionBug.Repo.Migrations.AddPosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :subtitle, :string, null: false
    end
  end
end
