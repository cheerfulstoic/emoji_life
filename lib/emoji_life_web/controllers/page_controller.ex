defmodule EmojiLifeWeb.PageController do
  use EmojiLifeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
