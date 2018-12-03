require "./lib/gameplay"

class ConnectFourRules
###All user input should go in seperate file
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
      puts "Would you like to play with the"
      puts "(c)omputer or a (f)riend?"
      computer_or_friend
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

  def computer_or_friend
    response = gets.chomp.upcase
    if response == "C" || response == "COMPUTER"
      puts "Good luck!"
      play_with_comp
    elsif response == "F" || response == "FRIEND"
      puts "Time to ruin friendships!!!"
      play_with_friend
    else
      puts "C or F...Not that hard..."
      computer_or_friend
    end
  end

  def play_with_comp
    until @game.winner.clear_winner == true
      @game.game_board.see_board
      @game.drop_piece
      @game.anyone_win_yet
      if @game.winner.clear_winner == true
        next
      else
        @game.computer_turn
        @game.anyone_win_yet
      end
    end
    puts "Would you like to play again? (Y/N)"
    play_again
  end

  def play_with_friend
    until @game.winner.clear_winner == true
      @game.game_board.see_board
      @game.drop_piece
      @game.anyone_win_yet
    end
    puts "Would you like to play again? (Y/N)"
    play_again
  end

  def play_again
    response = gets.chomp.upcase
    if response == "Y"
      new_game
    elsif response == "N"
      puts "Thanks for playing!"
    else
      puts "I'll take that as a no..."
    end
  end

  def new_game
    @game.game_board.reset_board
    @game.winner.clear_winner = false
    intro
    choices
  end

end
