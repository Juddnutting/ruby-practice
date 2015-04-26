class MasterMind
  attr_accessor :grid
  attr_accessor :answer
  #$colors = {1=> "R", 2=> "B", 3=> "G", 4=> "P", 5=> "Y", 6=> "O"}
  
  
  def initialize
    @grid = []
    @answer = Array.new(4,0)
    gen_answer
    @turns_remain = 12
    
  end
  
  def gen_answer
    answer.each_with_index do |val, index|
      @answer[index] = 1+rand(6)
    end
  end
  
  def print_answer
    p answer
  end
   
  def print_board
    grid.each do |row|
      p row
    end
  end
  
  def guess(guess)
    @grid << guess
  end
  
  def prompt_user
    puts "Please enter a 4 digit number with digits between 1 and 6 for your guess"
    guess = gets.chomp
    puts
    guess = guess.split("").map {|num| num.to_i}
    guess = validates(guess)
    
  end
  
  def validates(guess)
    if guess.length != 4
      puts "Guess was not 4 digits. Guess again"
      guess = prompt_user
    end
    
    unless guess.all? {|num| num.between?(1,6)}
      puts "Digits must be between 1 and 6. Guess again"
      guess = prompt_user
    end
    guess
  end
  
  def check_answer?(guess)
    guess == @answer
  end
  
  def print_text
    puts ""
  end
  
  def print_results(guess)
    black_peg = 0
    white_peg = 0
    guess_copy = []
    answer_copy = []
    guess.each {|num| guess_copy.push(num)}
    @answer.each {|num| answer_copy.push(num)}
    
    guess.each_with_index do |num, index|
      if num == @answer[index]
        black_peg +=1
        guess_copy[index] = 10
        answer_copy[index] = 11
      end
    end
    
    answer_copy.each_with_index do |ans,index|
      flag = true
      (0..3).each do |j|
        if guess_copy[j] == ans && flag == true
          white_peg += 1
          answer_copy[index] = 13
          guess_copy[j] = 14
          flag == false
        end
      end
    end
    
    puts "#{black_peg} black pegs and #{white_peg} white pegs" 
  end
   
  #def start_game
   # catch (:done) do
    #  while @turns_remain > 0 
        
        
        
    
    
    
  
  
end # end Board




b=MasterMind.new
b.print_board
b.print_answer
#p b.prompt_user
b.print_results(b.prompt_user)
