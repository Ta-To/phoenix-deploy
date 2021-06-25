defmodule PhoenixDeploy.ReleaseTasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:phoenix_deploy)
    path = Application.app_dir(:phoenix_deploy, "priv/repo/migrations")
    Ecto.Migrator.run(PhoenixDeploy.Repo, path, :up, all: true)
  end
end
