defmodule EmojiLife.Game.Implementations.Classic do
  @behaviour EmojiLife.Game.Implementations

  alias EmojiLife.Game
  alias EmojiLife.Game.Board

  @impl EmojiLife.Game.Implementations
  def step(board) do
    new_positions =
      1..board.width
      |> Stream.flat_map(fn x ->
        Enum.map(1..board.height, fn y -> {x, y} end)
      end)
      |> Enum.reduce(%{}, fn {x, y}, result ->
        neighbors = Board.neighbors(board, x, y)

        live_cell = Board.at_position(board, x, y)

        should_be_live = if(live_cell, do: Enum.member?(2..3, length(neighbors)), else: length(neighbors) == 3)

        if should_be_live do
          new_character = character_with_max_count(neighbors, board)

          Map.put(result, {x, y}, new_character)
        else
          result
        end
      end)

    {:ok, Map.put(board, :positions, new_positions)}
  end

  defp character_with_max_count(positions, board) do
    counts =
      Enum.reduce(positions, %{}, fn {x, y}, result ->
        Map.update(result, Board.at_position(board, x, y), 1, & &1 + 1)
      end)

    max_count = Map.values(counts) |> Enum.max()

    Enum.filter(Map.keys(counts), fn char -> counts[char] == max_count end)
    |> sample()
  end

  def sample(enumerable) do
    Enum.at(enumerable, :rand.uniform(length(enumerable)) - 1)
  end
end
