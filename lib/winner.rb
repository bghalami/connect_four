require "pry"
require "./lib/gameplay"

class Winner
  attr_accessor :game_board, :clear_winner
  def initialize(game_board)
    @game_board = game_board
    @clear_winner = false
  end

  def horizontal_checker(row)
    if row > 0
      check = @game_board.board[row].join
      if check.include?("XXXX")
        puts "X's Win!!!"
        @clear_winner = true
      elsif check.include?("OOOO")
        puts "O's Win!!!"
        @clear_winner = true
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
        puts "X's Win!!!"
        @clear_winner = true
      elsif check.include?("OOOO")
        puts "O's Win!!!"
        @clear_winner = true
      else
        vertical_checker(column + 1)
      end
    end
  end

  def top_left_to_bottom_right_column(row, column)
    if column < 4
      array = []
      array << @game_board.board[row][column]
      array << @game_board.board[row + 1][column + 1]
      array << @game_board.board[row + 2][column + 2]
      array << @game_board.board[row + 3][column + 3]
      check = array.join
      if check.include?("XXXX")
        puts "X's Win!!!"
        @clear_winner = true
      elsif check.include?("OOOO")
        puts "O's Win!!!"
        @clear_winner = true
      else
        top_left_to_bottom_right_column(row,column + 1)
      end
    end
  end

  def top_left_to_bottom_right_complete(row,column)
    #row = 1, column = 0
    if row < 4
      sin = top_left_to_bottom_right_column(row,column)
      if sin == "X's Win!!!" || sin == "O's Win!!!"
        @clear_winner = true
      else
        top_left_to_bottom_right_complete(row + 1,column)
      end
    end
  end

  def bottom_left_to_top_right_column(row,column)
    if column < 4
      array = []
      array << @game_board.board[row][column]
      array << @game_board.board[row - 1][column + 1]
      array << @game_board.board[row - 2][column + 2]
      array << @game_board.board[row - 3][column + 3]
      check = array.join
      if check.include?("XXXX")
        puts "X's Win!!!"
        @clear_winner = true
      elsif check.include?("OOOO")
        puts "O's Win!!!"
        @clear_winner = true
      else
        bottom_left_to_top_right_column(row,column + 1)
      end
    end
  end

  def bottom_left_to_top_right_complete(row,column)
    #row = 6, column = 0
    if row > 0
      sin = bottom_left_to_top_right_column(row,column)
      if sin == "X's Win!!!" || sin == "O's Win!!!"
        @clear_winner = true
      else
        bottom_left_to_top_right_complete(row - 1,column)
      end
    end
  end

  def draw
    if @game_board.board[1].include?(".")
      @clear_winner
    else
      puts "It's a draw!!! WAOW!"
      @clear_winner = true
    end
  end

end
