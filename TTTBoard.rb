

EMPTY = 1
PLAYERX = 2
PLAYERO = 3
DRAW = 4
IN_PLAY = 5

STR ={EMPTY => " ", PLAYERX => 'X', PLAYERO => 'O'}



class TTTBoard
  attr_accessor :grid
   
  def initialize
    @grid = Array.new(3){Array.new(3,1)}  
  end
  
  def print_board
    puts
    print "   0   1   2 \n"
    grid.each_with_index do |row, index|
      print "#{index} | #{STR[row[0]]} | #{STR[row[1]]} | #{STR[row[2]]} \n"
    end
  end

def get_empty_squares
    empties = []
    grid.each_with_index do |row, i|
      row.each_with_index do |square, j| 
        if square == EMPTY
          empties.push([i,j])
        end
      end
    end
    empties
  end
  
  def move(row, col, player)
    if @grid[row][col] == EMPTY
    @grid[row][col] = player
    end
  end

  def square(row, col)
    @grid[row][col]
  end

def check_win
  all_lines = []
  #get rows and add to all lines
  grid.each do |line|
    all_lines << line.join.to_s
  end
  #get columns and add to all lines
  (0..2).each do |col|
    line = square(0,col).to_s + square(1,col).to_s + square(2,col).to_s
    all_lines << line
  end
  #get diagonals
  all_lines << square(0,0).to_s + square(1,1).to_s + square(2,2).to_s
  all_lines << square(2,0).to_s + square(1,1).to_s + square(0,2).to_s
  #see if any string in all lines matches a win
  all_lines.each do |group|
    if group == "222"
      return PLAYERX
    elsif group == "333"
      return PLAYERO
    end
  end
  if get_empty_squares.count == 0
      return DRAW
    else
      return IN_PLAY
  end
end

end #class end

def switch_player(player)
  player == PLAYERX ? player = PLAYERO : player = PLAYERX
end

def play
  board = TTTBoard.new
  player = PLAYERX
  puts "Welcome to TicTacToe."
 
  while board.check_win == IN_PLAY
    board.print_board
    puts "It is player #{STR[player]}'s turn"
      while true
        puts "pick a row between 0 and 2"
        row = gets.chomp.to_i
        puts "pick a col between 0 and 2"
        col = gets.chomp.to_i
        if row.between?(0,2) && col.between?(0,2) && board.square(row,col) == EMPTY
          break
        end
        if row.between?(0,2) == false || col.between?(0,2) == false
          puts "Invalid input. Choose row and col in range"
        else
          puts "Square is already chosen. Choose Again"
        end
      end
    board.move(row,col,player)
    player = switch_player(player)
  end

  board.print_board
  winner = board.check_win
  if winner == PLAYERX
    puts "Player X wins!"
  elsif winner == PLAYERO
    puts "Player O wins!"
  else
    puts "It's a Draw"
  end
end
  
play
=begin
player = "X"
board = TTTBoard.new
board.grid[0][0] = 'X'
board.grid[1][2] = "X"
board.print_board
board.move(0,1,player)
board.move(0,2,player)
player = switch_player(player)
board.move(1,1,player)
board.print_board
puts board.square(1,1)

p board.get_empty_squares
p board.check_win
=end