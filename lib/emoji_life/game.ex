defmodule EmojiLife.Game do
  alias EmojiLife.Game.Board

  def new_board(width, height) do
    # TEMP
    positions = %{
      {10, 15} => true,
      {11, 16} => true,
      {12, 16} => true,
      {10, 17} => true,
      {9, 17} => true,
    }

    %Board{width: width, height: height, positions: positions}
  end

  def random_board(width, height, fill_chance, choices) do
    positions =
      Enum.reduce(1..width, %{}, fn x, final_result ->
        Enum.reduce(1..height, final_result, fn y, result ->
          emoji = Enum.at(choices, :rand.uniform(length(choices)) - 1)
          if(:rand.uniform() < fill_chance, do: Map.put(result, {x, y}, emoji), else: result)
        end)
      end)

    %Board{width: width, height: height, positions: positions}
  end

  def board_from_string(string) do
    if String.trim(string) == "" do
      {:error, "Not big enough"}
    else
      grid =
        string
        |> String.trim()
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.map(&String.codepoints/1)

      positions =
        grid
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {line, y}, final_result ->
          line
          |> Enum.with_index()
          |> Enum.reduce(final_result, fn
            {".", _}, result -> result
            {codepoint, x}, result -> Map.put(result, {x + 1, y + 1}, codepoint)
          end)
        end)

      {:ok, %Board{width: length(List.first(grid)),
        height: length(grid), positions: positions}}
    end
  end

  def size(board) do
    Board.size(board)
  end

  def at_position(board, x, y) do
    Board.at_position(board, x, y)
  end

  def puts(board) do
    Enum.map(1..board.height, fn y ->
      Enum.map(1..board.width, fn x -> Map.get(board.positions, {x, y}, ".") end)
      |> Enum.join("")
    end)
    |> Enum.join("\n")
    |> IO.puts()
  end

end
