require "minitest/autorun"
require "minitest/pride"
require "./lib/gameplay"

class GamePlayTest < Minitest::Test
  def setup
    @gp = GamePlay.new
  end

  def test_it_exists
    assert_instance_of GamePlay, @gp
  end

  def test_placement_is_being_translated_to_number
    assert_equal 1, @gp.move_value("B")
  end

  def test_game_will_decide_between_x_and_o
    assert_equal "X", @gp.x_or_o
    @gp.move_counter += 1
    assert_equal "O", @gp.x_or_o
  end

  def test_dropping_piece_falls_in_the_right_place
    @gp.round_n_round(6,0)
    assert_equal "X", @gp.game_board.board[6][0]
  end

  def test_move_value_returns_correct_value
    assert_equal 1, @gp.move_value("B")
  end

  def test_it_stacks_guesses
    @gp.round_n_round(6,0)
    @gp.round_n_round(6,0)
    assert_equal "X", @gp.game_board.board[6][0]
    assert_equal "X", @gp.game_board.board[5][0]
  end

end
