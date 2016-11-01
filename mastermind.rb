# use <=> for perfect, color right, or wrong
class MasterMind
  # initialize game
  def initialize
    @board = Board.new
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
  def choose_solution
    valid = false
    while valid = false
      solution = @player_two.set_solution
      if @player_two.valid_input(solution)
        valid = true
      else
        puts "that was not a valid code, try again"
      end
    end
    @board.solution = solution
  end

  def game_logic
    choose_solution
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


end

class Board
  PEG_COLOR = [1, 2, 3, 4, 5, 6]

  attr_writer :solution
  def initialize
    @solution = nil
    @guesses = []
    @results = []
  end

  def render
    @guesses.zip(@results).each do |guess, result|
      print "\n"
      print "#{guess}    #{result}"
    end
    print "[# fully right, # right number, # wrong] \n"
    puts "You are on guess #{@guesses.length}"
  end


  def board_move(guess)
    @guesses << guess
    @results << guess_feedback(guess)
  end

  def guess_feedback(guess)
    feedback = [0,0,0]
    guess.each_with_index do |number, index|
      if number == @solution[index]
        feedback[0] += 1 
      end
    end
        
    guess.each do |number|
      unless @solution.include?(number)
        feedback[2] += 1 
      end
    end 

    feedback[1] = 4 - feedback.inject(0){|sum,x| sum + x}    
  end 

end

class Player

  def valid_input(combination)
    valid = true
    combination.each.to_i do |number|
      if number > 6 || number < 1
        valid = false
      end
    end
    valid
  end

end

class HumanPlayer < Player

  def initialize(role = "codesetter")
    @role = role
    @name = name
  end

  def set_solution
    if role = "codesetter"
      puts "You get to set the code, #{@name}"
      puts "Pick four numbers between 1 and 6 inclusive"
      puts "In the following format '1 2 3 4' "
      solution = gets.chomp.split("")
    else
      solution = nil
    end
    solution
  end

  def guess
    puts "Pick four numbers between 1 and 6 inclusive"
    puts "In the following format '1 2 3 4' "
    player_guess = gets.chomp.split('')
    if valid_input(player_guess)
      player_guess
    else guess
  end
  # make guess
end

class ComputerPlayer < Player
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
