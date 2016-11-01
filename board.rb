class Board
  PEG_COLOR = [1, 2, 3, 4, 5, 6]

  attr_writer :solution
  def initialize
    @solution = [1,2,3,4]
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
    print feedback   
  end 

end

a = Board.new
a.board_move([4,3,2,1])