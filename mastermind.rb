# use <=> for perfect, color right, or wrong
class MasterMind
  # initialize game
  def initialize
    @board = Board.new
    @code = []
  end

  def set_players
    @player_one = HumanPlayer.new("codebreaker", "Player 1")
    if check_players == "h"
      @player_two = HumanPlayer.new("codesetter", "Player 2")
    else
      @player_two = ComputerPlayer.new("codesetter", "SirBeepington")
    end
  end

  def check_players
    puts "Would you like to play against the computer 'c' or another person 'h'?"
    response = gets.chomp.downcase
    check_players unless response == "c" || response == "h"
    reponse
  end
  # run game loop
  def choose_code
    valid = false
    while valid = false
      @code = @player_two.set_code
      if @code.code_valid?
        valid = true
      else
        puts "that was not a valid code, try again"
      end
    end
  end

  def game_logic
    choose_code
    game_loop
    play_again?
  end

  def game_loop
    @tries = 0
    @tries.upto(12) do
      @board.render
      guess = @player_one.guess
      @board.board_move(guess)
      game_over?
    end
  end
  def game_over?

  end
  def play_again?

  end
  # check game over
  # check win
  # check loss
  # quit?
  # play again?
  # reverse player roles
  # quit

  def code_valid?(code)
    valid = true
    code.each.to_i do |number|
      if number > 6 || number < 1
        valid = false
      end
    end
    valid
  end
end

class Board
  # initialize board
  def initialize
    @pegs = {}
    PEG_COLOR = %w(1 2 3 4 5 6)
    @guesses = []
    @results = []
  end
  def render
    
  end
  def board_move(guess)
    guess_check(guess)
  end
  def guess_check

  end
  # prompt guesser for move
  # checks guess
  # render board
  #
end

class HumanPlayer
  def initialize(role = "codesetter")
    @role = role
    @name = name
  end
  def set_code
    if role = "codesetter"
      puts "You get to set the code, #{@name}"
      puts "Pick four numbers between 1 and 6 inclusive"
      puts "In the following format '1 2 3 4' "
      code = gets.chomp.split("")
    else
      code = nil
    end
    code
  end
  def guess

  end
  # make guess
end

class ComputerPlayer
  def initialize(role = "codesetter")
    @role = role
  end
  def guess

  end
  # determines code
  # sets code
  # algorithm
  # make guess
end
