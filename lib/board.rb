require "pry"

class Board
  attr_accessor :board,
                :a_to_num

  def initialize
    @board = [["A","B","C","D","E","F","G"],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."]]
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
    puts "#{@board[0].join}"
    puts "#{@board[1].join}"
    puts "#{@board[2].join}"
    puts "#{@board[3].join}"
    puts "#{@board[4].join}"
    puts "#{@board[5].join}"
    puts "#{@board[6].join}"
  end
end
