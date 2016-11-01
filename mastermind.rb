# use <=> for perfect, color right, or wrong
class MasterMind
  # initialize game
  def initialize
    @board = Board.new
  end

  def check_players
    puts "Would you like to play against the computer 'c' or another person 'h'?"
    response = gets.chomp.downcase
    check_players unless response == "c" || response == "h"
    set_players(response)
  end

  def set_players(response)
    role1 = player_role

    if role1 == 'set'
      role2 = 'break'
    else
      role2 = 'set'
    end

    @player_one = HumanPlayer.new(role1, "Player 1")
    if response == "h"
      @player_two = HumanPlayer.new(role2, "Player 2")
    else
      @player_two = ComputerPlayer.new(role2, "SirBeepington")
    end
  end

  def player_role
    puts "Would you like to set the code (type 'set')"
    puts "or break the code (type 'break')?"
    valid = false
    while valid == false
      role = gets.chomp.downcase
      if role == "set" || role == "break"
        valid = true
      else
        puts "that was not a valid code, try again"
      end
    end
    role
  end

  def choose_solution
    #this needs refactoring to work
    solution1 = @player_one.set_solution
    solution2 = @player_two.set_solution
    solution = solution1 || solution2
    valid = false
    while valid == false
      if @player_one.valid_input(solution) == true
        valid = true
      else
        puts "that was not a valid code, try again"
      end
    end
    @board.solution = solution
  end

  def game_logic
    check_players
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
      game_win?
    end
    game_lose
  end

  def game_win?
    if @board.results[-1][0] == 4
      puts "Congratulations! You have won the game!"
      play_again?
    end
  end

  def game_lose
    puts "I'm sorry, you ran out of guesses!"
    puts "The correct solution was #{@board.solution}."
    play_again?
  end

  def play_again?
    puts "Would you like to play again? 'y' for yes anything else to quit"
    response = gets.chomp.downcase
    if response == "y"
      a = MasterMind.new
      a.game_logic
    else
      puts "Thank you for bearing with us!"
      exit
    end
  end
  # quit
end

class Board
  PEG_COLOR = [1, 2, 3, 4, 5, 6]

  attr_accessor :solution
  def initialize
    @solution = nil
    @guesses = []
    @results = []
  end

  def results
    @results
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
    return feedback
  end

end

class Player

  def valid_input(combination)
    valid = true
    combination.each do |number|
      if number.to_i > 6 || number.to_i < 1
        valid = false
      end
    end
    valid
  end

end

class HumanPlayer < Player

  def initialize(role,name)
    @role = role
    @name = name
  end

  def set_solution
    if @role == "set"
      puts "You get to set the code, #{@name}"
      puts "Pick four numbers between 1 and 6 inclusive"
      puts "In the following format '1 2 3 4' "
      solution = gets.chomp.split(" ")
    else
      solution = nil
    end
    solution
  end

  def guess
    puts "Pick four numbers between 1 and 6 inclusive"
    puts "In the following format '1 2 3 4' "
    player_guess = gets.chomp.split(' ')
    if valid_input(player_guess)
      player_guess
    else guess
    end  
  end
  # make guess
end

class ComputerPlayer < Player
  def initialize(role,name)
    @role = role
    @name = name
  end
  def guess

  end
  # determines code
  # sets code
  # algorithm
  # make guess
end


a = MasterMind.new
a.game_logic