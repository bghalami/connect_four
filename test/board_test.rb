require "minitest/autorun"
require "minitest/pride"
require "./lib/board"

class BoardTest < Minitest::Test

  def test_it_is
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_builds_empty_board
    board = Board.new
    empty_row = [".",".",".",".",".",".","."]
    assert_equal ["A","B","C","D","E","F","G"], board.title_row
    assert_equal empty_row, board.row_one
    assert_equal empty_row, board.row_two
    assert_equal empty_row, board.row_three
    assert_equal empty_row, board.row_four
    assert_equal empty_row, board.row_five
    assert_equal empty_row, board.row_six
  end

end
