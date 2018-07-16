require "minitest/autorun"
require "minitest/pride"
require "./lib/computer"

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_it_generates_random_number_in_range
    computer = Computer.new
    tester = [computer.make_move]

    assert true, tester.include?(0..6)
  end

end
