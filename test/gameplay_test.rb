require "minitest/autorun"
require "minitest/pride"
require "./lib/gameplay"

class GamePlayTest < Minitest::Test

  def test_it_exists
    gp = GamePlay.new

    assert_instance_of GamePlay, gp
  end

  def test_placement_is_being_translated_to_number
    gp = GamePlay.new

    assert_equal 1, gp.move_value("B")
  end

  def test_game_will_decide_between_x_and_o
    gp = GamePlay.new

    assert_equal "X", gp.x_or_o
    gp.move_counter += 1
    assert_equal "O", gp.x_or_o
  end

end
