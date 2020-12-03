defmodule EmojiLife.Game.Implementations do
  alias EmojiLife.Game.Board

  @callback step(Board.t) :: {:ok, Board.t} | {:error, String.t}
end
