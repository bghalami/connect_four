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
      @winner.bl_tr_ultra_checker(6,0)
    assert_equal true, @winner.clear_winner
  end

  def test_top_left_to_bottom_right_win
    assert_equal false, @winner.clear_winner
      @winner.tl_br_ultra_checker(1,0)
    assert_equal true, @winner.clear_winner
  end

end
