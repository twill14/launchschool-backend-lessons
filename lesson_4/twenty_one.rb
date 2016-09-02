def prompt(msg)
  puts "=> #{msg} "
end

def init_deck()
  deck = [['Two of Spades', '2'], ['Two of Hearts', '2'], ['Two of Clubs', '2'], ['Two of Diamonds', '2']] +
         [['Three of Spades', '3'], ['Three of Hearts', '3'], ['Three of Clubs', '3'], ['Three of Diamonds', '3']] +
         [['Four of Spades', '4'], ['Four of Hearts', '4'], ['Four of Clubs', '4'], ['Four of Diamonds', '4']] +
         [['Five of Spades', '5'], ['Five of Hearts', '5'], ['Five of Clubs', '5'], ['Five of Diamonds', '5']] +
         [['Six of Spades', '6'], ['Six of Hearts', '6'], ['Six of Clubs', '6'], ['Six of Diamonds', '6']] +
         [['Seven of Spades', '7'], ['Seven of Hearts', '7'], ['Seven of Clubs', '7'], ['Seven of Diamonds', '7']] +
         [['Eight of Spades', '8'], ['Eight of Hearts', '8'], ['Eight of Clubs', '8'], ['Eight of Diamonds', '8']] +
         [['Nine of Spades', '9'], ['Nine of Hearts', '9'], ['Nine of Clubs', '9'], ['Nine of Diamonds', '9']] +
         [['Ten of Spades', '10'], ['Ten of Hearts', '10'], ['Ten of Clubs', '10'], ['Ten of Diamonds', '10']] +
         [['Jack of Spades', '10'], ['Jack of Hearts', '10'], ['Jack of Clubs', '10'], ['Jack of Diamonds', '10']] +
         [['Queen of Spades', '10'], ['Queen of Hearts', '10'], ['Queen of Clubs', '10'], ['Queen of Diamonds', '10']] +
         [['King of Spades', '10'], ['King of Hearts', '10'], ['King of Clubs', '10'], ['King of Diamonds', '10']] +
         [['Ace of Spades', '11'], ['Ace of Hearts', '11'], ['Ace of Clubs', '11'], ['Ace of Diamonds', '11']]
end

def init_deal(dk, plrcards, dlrcards)
  # Will return four random card selections from the init deck and add two of each to each player's decks
  card_one_face = dk.pop
  card_one_value = card_one_face[1]
  calculate_score(plrcards)

  card_two_face = dk.pop
  if card_two_face.include? '11'
    if 11 + calculate_score(plrcards) > 21
      card_two_face[1] = '1'
    end
  end
  card_two_value = card_two_face[1]

  plrcards[1] = card_one_value
  plrcards[2] = card_two_value

  card_three_face = dk.pop
  card_three_value = card_three_face[1]
  calculate_score(dlrcards)

  card_four_face = dk.pop
  if card_four_face.include? '11'
    if 11 + calculate_score(dlrcards) > 21
      card_four_face[1] = '1'
    end
  end
  card_four_value = card_four_face[1]

  dlrcards[1] = card_three_value
  dlrcards[2] = card_four_value
end

def deck_hit(dk, cards, name)
  # When this is called, a random card from the init deck array will be selected randomly and added to the player or dealer's cards
  new_card_face = dk.sample
  if new_card_face.include? '11'
    if 11 + calculate_score(cards) > 21
      new_card_face[1] = '1'
    end
  end
  new_card_value = new_card_face[1]
  dk.delete(new_card_face)

  last_key = cards.keys.last

  cards[last_key + 1] = new_card_value

  prompt "#{name} drew #{new_card_face[0]}"
end

def calculate_score(cards)
  score = 0
  cards.each do |_, val|
    score += val.to_i
  end
  return score
end

def player_turn(dk, plrcards)
  loop do
    prompt "Hit (1) or Stay (2)?"
    answer = gets.chomp.to_i
    if answer == 1
      deck_hit(dk, plrcards, "Player")
      prompt "Your current score is #{calculate_score(plrcards)}"
    elsif answer == 2
      prompt "Player chose to stay"
      break
    else
      prompt "Answer not acceptable"
    end
    if check_bust(calculate_score(plrcards))
      break
    end
  end
end

def dealer_turn(dk, dlrcards)
  # Will return dealer's score
  loop do
    if calculate_score(dlrcards) >= 17
      prompt "Dealer chose to stay"
      break
    else
      deck_hit(dk, dlrcards, "Dealer")
    end
    if check_bust(calculate_score(dlrcards))
      break
    end
  end
end

def check_bust(score)
  if score > 21
    return true
  end
end

def card_compare(plrscore, delrscore)
  # Compare scores and return Player or Computer (depending on who has the highest score)
  if plrscore > delrscore
    return "Player"
  elsif plrscore < delrscore
    return "Dealer"
  else
    return "Tie"
  end
end

def declare_winner(cardcmpare)
  # If returned Player then display message "Player Wins!" else Computer Wins!
  if cardcmpare == "Player"
    prompt "Player Wins!"
  elsif cardcmpare == "Dealer"
    prompt "Dealer Wins!"
  else
    prompt "It's a Tie!"
  end
end

def end_game
end

# Initial Game
loop do
  loop do
    system 'clear'
    deck = init_deck
       p deck.count
    player_cards = {}
    dealer_cards = {}

    prompt "Dealer is shuffling deck"
    deck.shuffle!
    prompt "-----"
    prompt "Dealer will now pick four random cards."
    prompt "-----"

    init_deal(deck, player_cards, dealer_cards)

    prompt "Player has #{player_cards[1]} and #{player_cards[2]}, dealer has #{dealer_cards[1]} and an unknown card"
    prompt "-----"

    calculate_score(player_cards)
    player_turn(deck, player_cards)
  
    if check_bust(calculate_score(player_cards))
      prompt "================="
      prompt "Player busted..."
      prompt "Dealer Wins!"
      break
    end

    calculate_score(dealer_cards)
    dealer_turn(deck, dealer_cards)


    if check_bust(calculate_score(dealer_cards)
      prompt "================="
      prompt "Dealer busted..."
      prompt "Player Wins!!!"
      break
    end

    compare = card_compare(calculate_score(player_cards), calculate_score(dealer_cards))
    prompt ""
    prompt "Dealer's score is #{dealer_score} while Player's score is #{player_score}"
    prompt ""
    declare_winner(compare)
    break
  end
  prompt "Would you like to play again? (1 Yes / 2 No)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('1')
end

prompt "The Game is Over, thanks for playing!"
