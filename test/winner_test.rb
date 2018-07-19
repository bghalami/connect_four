require "minitest/autorun"
require "minitest/pride"
require "./lib/winner"

class WinnerTest < Minitest::Test

  def setup
    @board = Board.new
    @winner = Winner.new(@board)
    @winner.game_board.board = [
      ["A","B","C","D","E","F","G"],
      [".",".",".",".",".",".","."],
      [".","X","X","X","X",".","."],
      [".","X","X","X","X",".","."],
      [".","X","X","X","X",".","."],
      [".","X","X","X","X",".","."],
      [".",".",".",".",".",".","."]
    ]
  end

  def test_horizontal_win
    assert_equal false, @winner.clear_winner
    @winner.horizontal_checker(6)
    assert_equal true, @winner.clear_winner
  end

  def test_vertical_win
    assert_equal false, @winner.clear_winner
    @winner.vertical_checker(0)
    assert_equal true, @winner.clear_winner
  end

  def test_bottom_left_to_top_right_win
    assert_equal false, @winner.clear_winner
      @winner.bottom_left_to_top_right_complete(6,0)
    assert_equal true, @winner.clear_winner
  end

  def test_top_left_to_bottom_right_win
    assert_equal false, @winner.clear_winner
      @winner.top_left_to_bottom_right_complete(1,0)
    assert_equal true, @winner.clear_winner
  end

  def test_it_can_end_in_draw
    @winner.game_board.board = [
      ["A","B","C","D","E","F","G"],
      ["X","X","O","X","X","O","O"],
      ["O","X","O","O","X","X","X"],
      ["O","O","X","X","X","O","O"],
      ["X","X","O","O","X","X","X"],
      ["X","X","O","X","X","O","O"],
      ["X","X","O","O","X","X","X"]
    ]
    @winner.draw
    assert_equal true, @winner.clear_winner
  end

end
