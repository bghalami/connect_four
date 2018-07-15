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
    bag.new_bag

    assert_equal 21, bag.xs.count
    assert_equal 21, bag.os.count
    assert_instance_of Piece, bag.xs[0]
    assert_instance_of Piece, bag.os[0]
  end
end
