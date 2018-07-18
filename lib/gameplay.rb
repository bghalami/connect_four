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

  def horizontal_checker(row)
    if row > 0
      check = @game_board.board[row].join
      if check.include?("XXXX")
        "X's Win!!!"
      elsif
        check.include?("OOOO")
          "O's Win!!!"
      else
        horizontal_checker(row - 1)
      end
    end
  end

  def vertical_checker(column)
    if column < 7
      column_array = @game_board.board.map do |row|
        row[column]
      end
      check = column_array.join
      if check.include?("XXXX")
        "X's Win!!!"
      elsif
      check.include?("OOOO")
        "O's Win!!!"
      else
        vertical_checker(column + 1)
      end
    end
  end

  def diagonal_checker(row, column)


  end

  def bl_tr_checker(row,column)
    if column < 4
      array = []
      array << @game_board.board[row][column]
      array << @game_board.board[row - 1][column + 1]
      array << @game_board.board[row - 2][column + 2]
      array << @game_board.board[row - 3][column + 3]
      check = array.join
      if check.include?("XXXX")
        "X's Win!!!"
      elsif
        check.include?("OOOO")
        "O's Win!!!"
      else
        bl_tr_checker(row,column + 1)
      end
    end
  end

  def ultra_checker(row,column)
    if row > 0
      sin = bl_tr_checker(row,column)
      if sin == "X's Win!!!" || sin == "O's Win!!!"
        "Now we will kill the weak"
      else
        ultra_checker(row - 1, column)
      end
    end
  end


end

gp = GamePlay.new

gp.game_board.board[5][1] = "O"
gp.game_board.board[4][2] = "O"
gp.game_board.board[3][3] = "O"
gp.game_board.board[2][4] = "O"

binding.pry
