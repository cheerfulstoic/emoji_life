defmodule EmojiLifeWeb.GameLive do
  use Phoenix.LiveView

  alias EmojiLife.Game

  alias EmojiLifeWeb.GameView

  @game_implementation Game.Implementations.Classic

  def render(assigns) do
    Phoenix.View.render(EmojiLifeWeb.GameView, "game.html", assigns)
  end

  def mount(%{}, socket) do
    # temperature = Thermostat.get_user_reading(user_id, id)
    # {:ok, assign(socket, :temperature, temperature)}
    # board = Game.new_board(50, 50)
    # choices = ~w[🙈 🐧 😎 👺 👽 🙀 🐇]
    choices = ~w[🐼 🐴 🐇 ⚔️]
    board = Game.random_board(200, 200, 0.4, choices)
    {:ok, socket
    |> assign(:board, board)
    |> assign(:speed, 0.15)}
  end

  def handle_event("step", _value, socket) do
    schedule_tick(socket)

    # {:ok, new_board} = @game_implementation.step(socket.assigns.board)
    # {:noreply, assign(socket, :board, new_board)}
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    schedule_tick(socket)

    {:ok, new_board} = @game_implementation.step(socket.assigns.board)
    {:noreply, assign(socket, :board, new_board)}
  end

  def schedule_tick(socket) do
    Process.send_after(self(), :tick, trunc(1000 * socket.assigns.speed))
  end
end
