class Board
  # initialize board
  PEG_COLOR = [1, 2, 3, 4, 5, 6]
  def initialize
    @pegs = {}
    @guesses = [[1,2,3,4],[1,2,1,4],[1,2,2,4],[1,2,4,4]]
    @results = [[1,2,2],[1,2,5],[1,2,0],[0,2,1]]
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
    guess_check(guess)
  end

  def guess_check

  end
  # prompt guesser for move
  # checks guess
  # render board
  #
end

a = Board.new
a.render 