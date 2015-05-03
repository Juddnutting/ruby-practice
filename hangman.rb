require 'yaml'
class Hangman
  
  attr_accessor :display, :tries, :guesses, :word
  
  def initialize
    @word = ""
    @tries = 3
    @display = "_" * @word.length
    @guesses = []
    @store_info = {}
  end
  
  def save_game
    @store_info = {:word => @word, tries: @tries, display: @display, guesses: @guesses}
    yaml = @store_info.to_yaml
    
    puts yaml
    saved_game = File.new("saved_game.yaml", 'w')
    saved_game.write(yaml)
    saved_game.close
    puts 'Game Saved'
    
  end
  
  def load_game
    saved_game = File.new("saved_game.yaml",'r')
    yaml = saved_game.read
    info = YAML::load(yaml)
    @word = info[:word]
    @display = info[:display]
    @tries = info[:tries]
    @guesses = info[:guesses]
    saved_game.close
    puts "Game Loaded"
    play
  end
    
  
  def get_new_word
    lines = File.readlines "5desk.txt"
    word = lines.select {|word| word.length.between?(5,12)}.sample
    return word.chomp
  end

  def start_game
    @word=  get_new_word
    @display= "_" * word.length
    @tries = 3
    @guesses = []
    input = menu
    if input == "1"
      load_game
    else
      play
    end
  end
  
  def word=(new_val)
    @word = new_val
  end
  
  def menu
    puts "welcome to hangman"
    puts "press 1 to load a game"
    puts "press enter to start new game"
    input = gets.chomp  
  end
  
  def insert_letter(char)
     flag = false
     for i in (0..word.length-1)
       if char == word[i]
         display[i] = char
         flag = true
       end
     end
    @tries -= 1 unless flag
  end
  
  def display_word
    puts display.split("").join(" ")
  end
  
  def game_won?
    if display == word
      return true
    end
  end
  
  def game_lost?
    if tries <= 0
      return true
    end
  end
    
  def menu_small
  puts "1-Load; 2-Save; or any letter to guess"
  gets.chomp.downcase
  end
  
  def play   
    #puts word #for troubleshooting
    while true
      display_word
      input = menu_small
      if input == "1"
        load_game
      elsif input == "2"
        save_game
      elsif input.length != 1
        puts "not a valid selection try again"
      elsif guesses.include?(input)
        puts "already guessed that try again"
      elsif input =~ /[[:alpha:]]/ 
        guess = input
        guesses << guess
        insert_letter(guess)
      else
        puts "not a valid selection try again" 
      end
      
      puts ""
      puts "Guesses left #{tries}"
      if game_won?
        display_word
        puts "You won!"
        puts ""
        start_game
      end
      if game_lost?
        puts "You lost! :("
        puts "The word was '#{word}'"
        puts ""
        start_game
      end
    end
  end   
end #end class
  
go = Hangman.new
go.start_game

  