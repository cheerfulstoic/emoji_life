defmodule EmojiLife.GameTest do
  use ExUnit.Case

  alias EmojiLife.Game

  describe "board_from_string" do
    test "Empty string" do
      assert Game.board_from_string("") == {:error, "Not big enough"}
    end

    test "1x1" do
      {:ok, board} = Game.board_from_string("🙈")

      assert Game.size(board) == {1, 1}
      assert Game.at_position(board, 1, 1) == "🙈"
    end

    test "3x2" do
      {:ok, board} = Game.board_from_string("""
        🙈.🐧
        ..🙈
      """)

      assert Game.size(board) == {3, 2}
      assert Game.at_position(board, 1, 1) == "🙈"
      assert Game.at_position(board, 2, 1) == nil
      assert Game.at_position(board, 3, 1) == "🐧"
      assert Game.at_position(board, 1, 2) == nil
      assert Game.at_position(board, 2, 2) == nil
      assert Game.at_position(board, 3, 2) == "🙈"
    end
  end
end

