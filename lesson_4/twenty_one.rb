require 'pry'
SPADES_TWO = ['Two of Spades', '2']
HEARTS_TWO = ['Two of Hearts', '2']
CLUBS_TWO = ['Two of Clubs', '2']
DIAMONDS_TWO = ['Two of Diamonds', '2']
SPADES_THREE = ['Three of Spades', '3']
HEARTS_THREE = ['Three of Hearts', '3']
CLUBS_THREE = ['Three of Clubs', '3']
DIAMONDS_THREE = ['Three of Diamonds', '3']
SPADES_FOUR = ['Four of Spades', '4']
HEARTS_FOUR = ['Four of Hearts', '4']
CLUBS_FOUR = ['Four of Clubs', '4']
DIAMONDS_FOUR = ['Four of Diamonds', '4']
SPADES_FIVE = ['Five of Spades', '5']
HEARTS_FIVE = ['Five of Hearts', '5']
CLUBS_FIVE = ['Five of Clubs', '5']
DIAMONDS_FIVE = ['Five of Diamonds', '5']
SPADES_SIX = ['Six of Spades', '6']
HEARTS_SIX = ['Six of Hearts', '6']
CLUBS_SIX = ['Six of Clubs', '6']
DIAMONDS_SIX = ['Six of Diamonds', '6']
SPADES_SEVEN = ['Seven of Spades', '7']
HEARTS_SEVEN = ['Seven of Hearts', '7']
CLUBS_SEVEN = ['Seven of Clubs', '7']
DIAMONDS_SEVEN = ['Seven of Diamonds', '7']
SPADES_EIGHT = ['Eight of Spades', '8']
HEARTS_EIGHT = ['Eight of Hearts', '8']
CLUBS_EIGHT = ['Eight of Clubs', '8']
DIAMONDS_EIGHT = ['Eight of Diamonds', '8']
SPADES_NINE = ['Nine of Spades', '9']
HEARTS_NINE = ['Nine of Hearts', '9']
CLUBS_NINE = ['Nine of Clubs', '9']
DIAMONDS_NINE = ['Nine of Diamonds', '9']
SPADES_TEN = ['Ten of Spades', '10']
HEARTS_TEN = ['Ten of Hearts', '10']
CLUBS_TEN = ['Ten of Clubs', '10']
DIAMONDS_TEN = ['Ten of Diamonds', '10']
SPADES_JACK = ['Jack of Spades', '10']
HEARTS_JACK = ['Jack of Hearts', '10']
CLUBS_JACK = ['Jack of Clubs', '10']
DIAMONDS_JACK = ['Jack of Diamonds', '10']
SPADES_QUEEN = ['Queen of Spades', '10']
HEARTS_QUEEN = ['Queen of Hearts', '10']
CLUBS_QUEEN = ['Queen of Clubs', '10']
DIAMONDS_QUEEN = ['Queen of Diamonds', '10']
SPADES_KING = ['King of Spades', '10']
HEARTS_KING = ['King of Hearts', '10']
CLUBS_KING = ['King of Clubs', '10']
DIAMONDS_KING = ['King of Diamonds', '10']
ace_of_spades = ['Ace of Spades', '11']
ace_of_hearts = ['Ace of Hearts', '11']
ace_of_clubs = ['Ace of Clubs', '11']
ace_of_diamonds = ['Ace of Diamonds', '11']


def prompt(msg)
  puts "---- #{msg} ----"
end

def init_deal(dk, plrcards, dlrcards)
  # Will return four random card selections from the init deck and add two of each to each player's decks
  card_one_face = dk.sample
  card_one_value = card_one_face[1]
  dk.delete(card_one_face)
  calculate_score(plrcards)

  card_two_face = dk.sample
  if card_two_face.include? '11'
    if 11 + calculate_score(plrcards) > 21
      card_two_face[1] = '1'
    end
  end
  card_two_value = card_two_face[1]
  dk.delete(card_two_face)

  plrcards[1] = card_one_value
  plrcards[2] = card_two_value

  card_three_face = dk.sample
  card_three_value = card_three_face[1]
  dk.delete(card_three_face)
  calculate_score(dlrcards)

  card_four_face = dk.sample
  if card_four_face.include? '11'
    if 11 + calculate_score(dlrcards) > 21
      card_four_face[1] = '1'
    end
  end
  card_four_value = card_four_face[1]
  dk.delete(card_four_face)

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
  cards.each do |key, val|
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
    if calculate_score(dlrcards)  >=  17
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

def init_deck(as, ah, ac, ad)
  deck = [SPADES_TWO, HEARTS_TWO, CLUBS_TWO, DIAMONDS_TWO] +
         [SPADES_THREE, HEARTS_THREE, CLUBS_THREE, DIAMONDS_THREE] +
         [SPADES_FOUR, HEARTS_FOUR, CLUBS_FOUR, DIAMONDS_FOUR] +
         [SPADES_FIVE, HEARTS_FIVE, CLUBS_FIVE, DIAMONDS_FIVE] +
         [SPADES_SIX, HEARTS_SIX, CLUBS_SIX, DIAMONDS_SIX] +
         [SPADES_SEVEN, HEARTS_SEVEN, CLUBS_SEVEN, DIAMONDS_SEVEN] +
         [SPADES_EIGHT, HEARTS_EIGHT, CLUBS_EIGHT, DIAMONDS_EIGHT] +
         [SPADES_NINE, HEARTS_NINE, CLUBS_NINE, DIAMONDS_NINE] +
         [SPADES_TEN, HEARTS_TEN, CLUBS_TEN, DIAMONDS_TEN] +
         [SPADES_JACK, HEARTS_JACK, CLUBS_JACK, DIAMONDS_JACK] +
         [SPADES_QUEEN, HEARTS_QUEEN, CLUBS_QUEEN, DIAMONDS_QUEEN] +
         [SPADES_KING, HEARTS_KING, CLUBS_KING, DIAMONDS_KING] +
         [as, ah, ac, ad]
  return deck
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

def assign_ace_value(ace, cards)
  # Will iterate through the player or dealer's cards to check for existincg aces. If an ace if found, will return 1 for new ace. 
  # If no aces are found, will return the value of 11 for the one ace.
end

def declare_winner(cardcmpare)
  #If returned Player then display message "Player Wins!" else Computer Wins!
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

#Initial Game
loop do
  loop do
    system 'clear'
    deck = init_deck(ace_of_spades, ace_of_hearts, ace_of_clubs, ace_of_diamonds)
    player_cards = {}
    dealer_cards = {}

    player_score = 0 
    dealer_score = 0

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
    player_score = calculate_score(player_cards)

    if check_bust(player_score)
      prompt ""
      prompt "Player busted..."
      prompt "Dealer Wins!"
      break
    end

      calculate_score(dealer_cards)
      dealer_turn(deck, dealer_cards)
      dealer_score = calculate_score(dealer_cards)
    
    if check_bust(dealer_score)
       prompt ""
       prompt "Dealer busted..."
       prompt "Player Wins!!!"
       break
    end

      compare = card_compare(player_score, dealer_score)
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

