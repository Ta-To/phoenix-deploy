defmodule PhoenixDeploy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixDeploy.Repo,
      # Start the Telemetry supervisor
      PhoenixDeployWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixDeploy.PubSub},
      # Start the Endpoint (http/https)
      PhoenixDeployWeb.Endpoint
      # Start a worker by calling: PhoenixDeploy.Worker.start_link(arg)
      # {PhoenixDeploy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixDeploy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixDeployWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
