# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :emoji_life,
  ecto_repos: [EmojiLife.Repo]

# Configures the endpoint
config :emoji_life, EmojiLifeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VnIDdLrJNnHd+lmVTyF+qRbb2/4dHcLgWIxxJG3axpflZr8jTR0bHTPZL4OnFtZ1",
  render_errors: [view: EmojiLifeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmojiLife.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :emoji_life, EmojiLifeWeb.Endpoint,
   live_view: [
     signing_salt: "a++VKA/vVVsPlwcFRUWYUbsVfdNOh1uZ"
   ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
