require "minitest/autorun"
require "minitest/pride"
require "./lib/bag"

class BagTest < Minitest::Test

  def test_it_exists
    bag = Bag.new

    assert_instance_of Bag, bag
  end

  def test_it_adds_pieces
    bag = Bag.new

    assert_instance_of Piece, bag.x
    assert_instance_of Piece, bag.o
  end
end
