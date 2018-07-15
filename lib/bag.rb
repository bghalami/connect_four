require "pry"
require "./lib/piece"

class Bag
  attr_accessor :x, :o
  def initialize
    @x = Piece.new("X")
    @o = Piece.new("O")
  end
end
