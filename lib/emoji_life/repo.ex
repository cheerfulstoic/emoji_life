defmodule EmojiLife.Repo do
  use Ecto.Repo,
    otp_app: :emoji_life,
    adapter: Ecto.Adapters.Postgres
end
