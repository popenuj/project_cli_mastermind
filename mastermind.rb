# use <=> for perfect, color right, or wrong
class MasterMind
  # initialize game
  def initialize
    @board = Board.new
  end

  def set_players
    @player_one = HumanPlayer.new("codebreaker")
    if check_players == "h"
      @player_two = HumanPlayer.new("codesetter")
    else
      @player_two = ComputerPlayer.new("codesetter")
    end
  end

  def check_players
    puts "Would you like to play against the computer 'c' or another person 'h'?"
    response = gets.chomp.downcase
    check_players unless response == "c" || response == "h"
    reponse
  end
  # run game loop
  # check game over
  # check win
  # check loss
  # quit?
  # play again?
  # reverse player roles
  # quit
end

class Board
  # initialize board
  def initialize
    @pegs = {}
    PEG_COLOR = %w(1 2 3 4 5 6)
    @guesses = []
    @results = []
  # code is set
  # prompt guesser for move
  # checks guess
  # render board
  #
end

class HumanPlayer
  # player decides roles
  # sets code
  # make guess
end

class ComputerPlayer
  # determines code
  # sets code
  # algorithm
  # make guess
end
