# Define

=begin
Tic tac toe is a 2 player game where two players take turns placing a mark (either an X or an O) 
inside of a square on a 3x3 grid square grid. 
The first player who manages to place three of their marks in a row in the grid first, wins.

Definition of Win:
Winning 3 in a row either diagonally or vertically

Tie:
If no player has managed to get 3 in a row and all squares have filled up, then the game is considered a tie
=end

=begin
1. Diplay 3x3 board
2. Determine which player is X's and which is O's
3. Ask a user to mark a square
4. Check if user has three in a row
5. Check if board is full
6. Computer marks a square
7. Check if user has three in a row
8. Check if board is full
9. If player has three in a row. End game and print "Player Wins!"
10. If computer has three in a row. End game and print "Computer Wins!"
11. If board is full. End game and print "Tie Game!"
12. Ask to restart? (Yes--> Restart/No--> Goodbye!)
=end
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=><= #{msg}"
end

def display_board(brd)
  system 'clear'
  puts ""
  puts"        |         |"
  puts"   #{brd[1]}    |    #{brd[2]}    |    #{brd[3]}    "
  puts"        |         |"
  puts"--------+---------+--------"
  puts"        |         |"
  puts"   #{brd[4]}    |    #{brd[5]}    |    #{brd[6]}    "
  puts"        |         |"
  puts"--------+---------+--------"
  puts"        |         |"
  puts"   #{brd[7]}    |    #{brd[8]}    |    #{brd[9]}    "   
  puts"        |         |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(',')})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square) 
      prompt "Sorry, that's not a valid choice" 
  end
    brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  # Iterate through all of the lines
  # If 1,2,3 == all X or all O
  winning_lines = [[1,2,3], [4,5,6], [7,8,9]] + 
                  [[1,4,7], [2,5,8], [3,6,9]] + 
                  [[1,5,9], [3,5,7]]

  winning_lines.each do |lines|
    if brd[lines[0]] == PLAYER_MARKER &&
       brd[lines[1]] == PLAYER_MARKER &&
       brd[lines[2]] == PLAYER_MARKER 
       return 'Player'
    elsif brd[lines[0]] == COMPUTER_MARKER &&
      brd[lines[1]] == COMPUTER_MARKER &&
      brd[lines[2]] == COMPUTER_MARKER 
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)


  if someone_won?(board)
    prompt "#{detect_winner(board)}"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt ("Thanks for playing!")







