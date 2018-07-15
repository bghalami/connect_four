require "pry"

class Board
  attr_accessor :title_row,
                :row_one,
                :row_two,
                :row_three,
                :row_four,
                :row_five,
                :row_six,
                :a_to_num

  def initialize
    @title_row = ["A","B","C","D","E","F","G"]
    @row_one = [".",".",".",".",".",".","."]
    @row_two = [".",".",".",".",".",".","."]
    @row_three = [".",".",".",".",".",".","."]
    @row_four = [".",".",".",".",".",".","."]
    @row_five = [".",".",".",".",".",".","."]
    @row_six = [".",".",".",".",".",".","."]
    @a_to_num = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6
    }
  end

  def see_board
    puts "#{@title_row.join}"
    puts "#{@row_one.join}"
    puts "#{@row_two.join}"
    puts "#{@row_three.join}"
    puts "#{@row_four.join}"
    puts "#{@row_five.join}"
    puts "#{@row_six.join}"
  end
end
