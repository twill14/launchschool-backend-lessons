require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
CHOOSE = "Choose".freeze

ps = 0
cs = 0

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
    prompt "Enter a number (#{joinor(check_empty_squares(brd), ', ')})"
    mark = gets.chomp.to_i
    break if check_empty_squares(brd).include?(mark)
    prompt "Space not available"
  end
  brd[mark] = PLAYER_MARKER
end

def computer_turn(brd)
  square = nil
  WINNING_LINES.each do |lines|
    square = find_optimal_squares(lines, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |lines|
      square = find_at_risk_squares(lines, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
    brd[square] = COMPUTER_MARKER
  end

  if !square
    square = check_empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!determine_winner(brd)
end

def board_full?(brd)
  check_empty_squares(brd).empty?
end

def joinor(arr, spt, fnl = " or")
  new_array = arr.map { |x| x.to_s }
  new_array = new_array.map.with_index do |x, i|
    if i == (new_array.count - 2)
      x + fnl
    elsif i == (new_array.count - 1)
      x
    else
      x + spt
    end
  end
  new_array.join(' ')
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

def find_at_risk_squares(lines, brd, marker)
  if brd.values_at(*lines).count(marker) == 2
    brd.select { |k, v| lines.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def find_optimal_squares(lines, brd, marker)
  if brd.values_at(*lines).count(marker) == 2
    brd.select { |k, v| lines.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def choose_first
  if CHOOSE == "Choose"
    loop do
      prompt "Who will go first? (1 Player, 2 Computer)"
      choice = gets.chomp.to_i
      if choice == 1
        return 'Player'
      elsif choice == 2
        return "Computer"
      else
        prompt "Please use 1 or 2"
      end
    end
  elsif CHOOSE == "Player"
    return "Player"
  else
    return "Computer"
  end
end

def place_piece!(brd, currntplyer)
  if currntplyer == "Player"
    return player_turn(brd)
  else
    return computer_turn(brd)
  end
end

def alternate_player(currntplyer)
  if currntplyer == "Player"
    return "Computer"
  else
    return "Player"
  end
end

loop do
  board = create_new_board
  display_board(board)

  case choose_first
  when "Player"
    current_player = "Player"
    loop do
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
    end
  when "Computer"
    current_player = "Computer"
    loop do
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
    end
  end

  if someone_won?(board)
    prompt "The Winner is #{determine_winner(board)}!"
  else
    prompt "It's a tie"
  end

  if determine_winner(board) == 'Player'
    ps += 1
  elsif determine_winner(board) == 'Computer'
    cs += 1
  end

  if ps == 5
    prompt "Player Wins The Game!"
  elsif cs == 5
    prompt "Computer Wins The Game!"
  else
    prompt "Player #{ps}, Computer #{cs}: First to 5 Wins"
  end

  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing!"
