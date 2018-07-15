require "pry"
require "./lib/board"
require "./lib/computer"


class GamePlay
  attr_accessor :board, :move_counter
  def initialize
    @move_counter = 0
    # @bag = Bag.new
    @board = Board.new
  end

  def get_move
    puts "Enter a letter(A-G) to place piece!"
    move = gets.chomp.upcase
    move_value(move)
  end

  def move_value(move)
    value = @board.a_to_num[move]
  end

  def x_or_o
    if @move_counter.even?
      "X"
    else
      "O"
    end
  end


  def drop_piece
    move = get_move

    if @board.row_six[move] == "."
      @board.row_six[move] = x_or_o
    elsif @board.row_five[move] == "."
      @board.row_five[move] = x_or_o
    elsif @board.row_four[move] == "."
      @board.row_four[move] = x_or_o
    elsif @board.row_three[move] == "."
      @board.row_three[move] = x_or_o
    elsif @board.row_two[move] == "."
      @board.row_two[move] = x_or_o
    elsif @board.row_one[move] == "."
      @board.row_one[move] = x_or_o
    else
      puts "Invalid move. Try again."
    end

    @move_counter += 1
    @board.see_board
  end

end
