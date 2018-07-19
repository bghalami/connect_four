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
    @board.each do |row|
      puts row.join
    end
  end

  def reset_board
    @board = [["A","B","C","D","E","F","G"],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."],
            [".",".",".",".",".",".","."]]
  end

end
