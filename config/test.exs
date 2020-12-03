use Mix.Config

# Configure your database
config :emoji_life, EmojiLife.Repo,
  username: "postgres",
  password: "emoji_life",
  database: "emoji_life_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :emoji_life, EmojiLifeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
