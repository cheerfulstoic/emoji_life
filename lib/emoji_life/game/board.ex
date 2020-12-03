defmodule EmojiLife.Game.Board do
  defstruct ~w[width height positions]a

  def size(board) do
    {board.width, board.height}
  end

  def at_position(board, x, y) do
    Map.get(board.positions, {x, y})
  end

  def neighbors(board, x, y) do
    neighbor_positions(board, x, y)
    |> Enum.filter(fn {x, y} ->
      at_position(board, x, y)
    end)
  end

  defp neighbor_positions(board, x, y) do
    [
      {x - 1, y - 1},
      {x, y - 1},
      {x + 1, y - 1},
      {x - 1, y},
      {x + 1, y},
      {x - 1, y + 1},
      {x, y + 1},
      {x + 1, y + 1},
    ]
    |> Stream.filter(fn
      {0, _} -> false
      {_, 0} -> false
      {x, y} -> x <= board.width && y <= board.height
    end)
  end
end

