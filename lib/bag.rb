require "pry"
require "./lib/piece"

class Bag
  attr_accessor :xs, :os
  def initialize
    @xs = []
    @os = []
  end

  def new_bag
    21.times do
      @xs << Piece.new("X")
      @os << Piece.new("O")
    end
  end
end
