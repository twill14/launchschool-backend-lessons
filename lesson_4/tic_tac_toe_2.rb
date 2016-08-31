INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def prompt(msg)
  puts "><><#{msg}><><"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts"        |         |"
  puts"   #{brd[1]}    |    #{brd[2]}    |    #{brd[3]}"
  puts"        |         |"
  puts"--------+---------+--------"
  puts"        |         |"
  puts"   #{brd[4]}    |    #{brd[5]}    |    #{brd[6]}"
  puts"        |         |"
  puts"--------+---------+--------"
  puts"        |         |"
  puts"   #{brd[7]}    |    #{brd[8]}    |    #{brd[9]}"
  puts"        |         |"
  puts ""
end

# rubocop: enable Metrics/AbcSize

def create_new_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def check_empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARKER }
end

def player_turn(brd)
  mark = ''
  loop do
    prompt "Enter a number (#{check_empty_squares(brd).join(',')})"
    mark = gets.chomp.to_i
    break if check_empty_squares(brd).include?(mark)
    prompt "Space not available"
  end
  brd[mark] = PLAYER_MARKER
end

def computer_turn(brd)
  mark = check_empty_squares(brd).sample
  brd[mark] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!determine_winner(brd)
end

def board_full?(brd)
  check_empty_squares(brd).empty?
end

def determine_winner(brd)
  WINNING_LINES.each do |combo|
    if brd.values_at(*combo).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*combo).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  board = create_new_board
  display_board(board)

  loop do
    player_turn(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_turn(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt " The Winner is #{determine_winner(board)}!"
  else
    prompt "It's a tie"
  end

  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing!"
