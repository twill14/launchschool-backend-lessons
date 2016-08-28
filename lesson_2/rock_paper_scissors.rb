VALID_CHOICES = %w(rock paper scissors spock lizard)

player_score = 0

computer_score = 0

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Game was a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

def convert_choice(input)
  if input.casecmp('r')
    'rock'
  elsif input.casecmp('l')
    'lizard'
  elsif input.casecmp('s')
    'scissors'
  elsif input.casecmp('p')
    'paper'
  elsif input.casecmp('sp')
    'sp'
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(' ')}")
    choice = gets.chomp

    choice = convert_choice(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt display_results(choice, computer_choice)

  prompt"You chose: #{choice}, the computer chose: #{computer_choice}"

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  if player_score < 5
    prompt "Player #{player_score}, Compter #{computer_score}: Best of 5"
  end

  if player_score == 5
    prompt "Player Wins The Game!"
  elsif computer_score == 5
    prompt "Computer Wins The Game!"
  end

  prompt "Do you want to play next round? ('y' to continue)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing!"
