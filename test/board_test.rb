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
    assert_equal ["A","B","C","D","E","F","G"], board.board[0]
    assert_equal empty_row, board.board[1]
    assert_equal empty_row, board.board[2]
    assert_equal empty_row, board.board[3]
    assert_equal empty_row, board.board[4]
    assert_equal empty_row, board.board[5]
    assert_equal empty_row, board.board[6]
  end

  def test_board_gets_reset
    board = Board.new
    empty_row = [".",".",".",".",".",".","."]
    board.board[1][2] = "X"
    board.board[3][3] = "X"
    board.board[5][6] = "X"
    board.reset_board
    assert_equal empty_row, board.board[1]
    assert_equal empty_row, board.board[2]
    assert_equal empty_row, board.board[3]
    assert_equal empty_row, board.board[4]
    assert_equal empty_row, board.board[5]
    assert_equal empty_row, board.board[6]
  end

  def test_comparing_hash_is_being_created
    board = Board.new
    assert_instance_of Hash, board.a_to_num
  end


end
