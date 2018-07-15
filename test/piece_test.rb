require "minitest/autorun"
require "minitest/pride"
require "./lib/piece"

class PieceTest < Minitest::Test

  def test_it_exists
    piece = Piece.new("X")

    assert_instance_of Piece, piece
  end

  def test_it_is_assigned_team
    piece = Piece.new("X")
    piece_2 = Piece.new("O")

    assert_equal "O", piece_2.team
    assert_equal "X", piece.team
  end
end
