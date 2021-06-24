# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_deploy,
  ecto_repos: [PhoenixDeploy.Repo]

# Configures the endpoint
config :phoenix_deploy, PhoenixDeployWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oiDZWqvxzh+Bb/b0QvfW+rqouchHAb3xLKQn9ZEMchqj4PMktHr5eAHmg9ZZ/vwy",
  render_errors: [view: PhoenixDeployWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixDeploy.PubSub,
  live_view: [signing_salt: "HS1hAjdk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
