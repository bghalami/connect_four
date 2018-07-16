require "pry"
require "./lib/board"
require "./lib/computer"


class GamePlay
  attr_accessor :game_board, :move_counter
  def initialize
    @move_counter = 0
    @game_board = Board.new
    @computer = Computer.new
  end

  def get_move
    if @move_counter.even?
      puts "Enter a letter(A-G) to place piece!"
      move = gets.chomp.upcase
      move_value(move)
    else
      @computer.make_move
    end
  end

  def move_value(move)
    value = @game_board.a_to_num[move]
  end

  def x_or_o
    if @move_counter.even?
      "X"
    else
      "O"
    end
  end

  def round_n_round(number,drop_move)
    if @game_board.board[number][drop_move] == "."
      @game_board.board[number][drop_move] = x_or_o
    else
      round_n_round(number - 1,drop_move)
    end
  end

  def drop_piece
    move = get_move
    round_n_round(6, move)
    @move_counter += 1
    @game_board.see_board
  end

end
