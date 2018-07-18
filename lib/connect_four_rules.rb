require "pry"
require "./lib/gameplay"

class ConnectFourRules

  def initialize
    @game = GamePlay.new
  end

  def intro
    puts "Hello! Welcome to the wild world of Connect 4!!!"
  end

  def choices
    puts "Would you like to (p)lay,"
    puts "read the (i)nstructions,"
    puts "or (e)xit the game?"
    response = menu_navigation
    menu(response)
  end

  def menu_navigation
    gets.chomp.upcase
  end

  def menu(choice)
    if choice == "P" || choice == "PLAY"
      play
    elsif choice == "I" || choice == "INSTRUCTIONS"
      puts "The goal of the game is connect 4 matching pieces."
      puts "You will take turns against a computer."
      puts "One by one you'll place pieces until a champion emerges."
      puts "Enter P to play or E to exit"
      response = menu_navigation
      menu(response)
    elsif choice == "E" || choice == "EXIT"
      puts "Goodbye!"
    else
      puts "That's hecka invalid. Try again"
      choices
    end
  end

  def play
    puts "Good Luck!"
    until @game.winner.clear_winner == true
      @game.game_board.see_board
      @game.drop_piece
      @game.computer_turn
      @game.anyone_win_yet
    end
    puts "Thanks for playing!!!"
  end

  def new_game
    intro
    choices
  end

end
