require "pry"
require "./lib/board"
require "./lib/computer"
require "./lib/winner"


class GamePlay

  attr_accessor :game_board, :move_counter, :winner

  def initialize
    @move_counter = 0
    @game_board = Board.new
    @computer = Computer.new
    @winner = Winner.new(@game_board)
  end

  def check_move(move)
    value = move_value(move)
    if (0..6).include?(value)
      value
    else
      puts "That's HECKA...invalid."
      get_move
    end
  end

  def get_move
      puts "Enter a letter(A-G) to place piece!"
      move = gets.chomp.upcase
      check_move(move)
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
    if number > 0
      if @game_board.board[number][drop_move] == "."
        @game_board.board[number][drop_move] = x_or_o
      else
        round_n_round(number - 1,drop_move)
      end
    else
      puts "Invalid Move. Try again."
      "Invalid"
    end
  end

  def computer_turn
    move = @computer.make_move
    round_n_round(6, move)
    @move_counter += 1
    @game_board.see_board
  end

  def drop_piece
    move = get_move
    if round_n_round(6, move) == "Invalid"
      drop_piece
    else
      @move_counter += 1
    end
    @game_board.see_board
  end

  def anyone_win_yet
    @winner.horizontal_checker(6)
    @winner.vertical_checker(0)
    @winner.tl_br_ultra_checker(1,0)
    @winner.bl_tr_ultra_checker(6,0)
    @winner.draw
  end
end
