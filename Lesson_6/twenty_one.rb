require 'yaml'
MESSAGES = YAML.load_file('twenty_one.yml')

SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength
def display_intro
  system 'clear' || system('cls')
  prompt(MESSAGES['greeting'])
  puts " "
  rules = <<-MSG
  Rules of the game:
  1. You and the dealer will both be dealt two cards. 
  2. Both of your cards will be visible to you. You will 
     only to be able to see one of the dealer's cards. 
  3. You can choose to hit or stay. 
  4. If you hit, another card will be drawn and added to your hand. 
  5. If the total sum of the value of your cards exceeds 21, then you bust and the dealer wins.
  6. If you choose to stay, then the dealer will start their turn 
     and keep hitting until they reach at least 17. 
  7. Then your cards will be compared to see who has the highest value
     but less than 21.
  8. If the dealer exceeds 21 then they busted and you won!
  9. To be the grand winner of the game, you have to win 5 rounds!
  
  Have fun! Goodluck!
  MSG
  prompt(rules)
  puts " "
end
# rubocop:enable Metrics/MethodLength

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def display_initial_hand(p_cards, d_cards, total)
  prompt("Dealer has #{d_cards[0]} and ?")
  sleep(2)
  prompt("You have: #{p_cards[0]} and #{p_cards[1]}
   Your Total: #{total['Total:']}")
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def draw_card(name, cards, deck, total)
  cards << deck.pop
  new_card = cards.last
  suit_card = new_card[1]
  value_card = new_card[1].to_i

  prompt("#{name} chose to hit!")
  sleep(2)
  prompt("Cards are now: #{cards}.")

  if suit_card.include?('A')
    ace_value = drawing_ace(total)
    total['Total:'] += ace_value
  elsif suit_card.include?('J') || suit_card.include?('K') ||
        suit_card.include?('Q')
    total['Total:'] += 10
  elsif value_card.between?(2, 10)
    total['Total:'] += value_card
  end
  prompt "Total is now: #{total['Total:']}"
  total
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def drawing_ace(total)
  if total['Total:'] <= 10
    value = 11
  elsif total['Total:'] >= 11
    value = 1
  end
  value
end

def display_comparing_cards
  puts " "
  prompt("Comparing card values...")
  puts " "
end

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
def check_card_value(card_deck, total)
  card_one = card_deck[0]
  card_two = card_deck[1]
  value_one = card_one[1].to_i
  value_two = card_two[1].to_i

  if card_one.include?('A')
    value = drawing_ace(total)
    total['Total:'] += value
  elsif card_one.include?('J') || card_one.include?('Q') ||
        card_one.include?('K')
    total['Total:'] += 10
  else
    total['Total:'] += value_one
  end

  if card_two.include?('A')
    value = drawing_ace(total)
    total['Total:'] += value
  elsif card_two.include?('J') || card_two.include?('Q') ||
        card_two.include?('K')
    total['Total:'] += 10
  else
    total['Total:'] += value_two
  end
  total
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

def busted?(total)
  total['Total:'] > 21
end

def detect_result(dealer_total, player_total)
  if player_total['Total:'] > 21
    :player_busted
  elsif dealer_total['Total:'] > 21
    :dealer_busted
  elsif dealer_total['Total:'] < player_total['Total:']
    :player
  elsif dealer_total['Total:'] > player_total['Total:']
    :dealer
  else
    :tie
  end
end

def update_scoreboard(dealer_total, player_total, score)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    score['Dealer'] += 1
  when :dealer_busted
    score['Player'] += 1
  when :player
    score['Player'] += 1
  when :dealer
    score['Dealer'] += 1
  when :tie
    score['Player'] += 0
    score['Dealer'] += 0
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt(MESSAGES['player_busted'])
  when :dealer_busted
    prompt(MESSAGES['dealer_busted'])
  when :player
    prompt(MESSAGES['player_win'])
  when :dealer
    prompt(MESSAGES['dealer_win'])
  when :tie
    prompt(MESSAGES['tie'])
  end
end

def display_grand_output(dealer_cards, player_cards, dealer_total, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total['Total:']}"
  prompt "Player has #{player_cards}, for a total of: #{player_total['Total:']}"
  puts "=============="
end

def play_again?
  prompt(MESSAGES['play_again'])
  response = gets.chomp
  if response != 'y' && response != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      response = gets.chomp.downcase
      break if response == 'y' || response == 'n'
    end
  end
  response
end

def display_scoreboard(score)
  prompt("Scoreboard:
   Player: #{score['Player']}
   Dealer: #{score['Dealer']}")
end

def display_grand_winner(score)
  if score['Player'] == WINS
    puts "============================="
    prompt(MESSAGES['player_winner'])
    puts "============================="
  elsif score['Dealer'] == WINS
    puts "============================="
    prompt(MESSAGES['dealer_winner'])
    puts "============================="
  end
end

def reset_scoreboard(answer, score)
  if (score['Player'] == WINS || score['Dealer'] == WINS) &&
     play_again?(answer) == 'y'
    score['Player'] = 0 && score['Dealer'] = 0
  end
end

def display_goodbye
  prompt(MESSAGES['goodbye'])
end

scoreboard = { 'Player' => 0, 'Dealer' => 0 }
loop do
  display_intro
  player_total = { 'Total:' => 0 }
  dealer_total = { 'Total:' => 0 }
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  check_card_value(player_cards, player_total)
  check_card_value(dealer_cards, dealer_total)

  display_initial_hand(player_cards, dealer_cards, player_total)
  sleep(2)
  # player turn
  loop do
    answer = nil
    loop do
      prompt(MESSAGES['hit_stay'])
      answer = gets.chomp
      if answer != 'h' && answer != 's'
        prompt(MESSAGES['invalid_action'])
      else
        break
      end
    end

    if answer == 'h'
      draw_card('You', player_cards, deck, player_total)
    end
    break if answer == 's' || busted?(player_total)
  end
  sleep(2)
  if busted?(player_total)
    prompt(MESSAGES['player_busted'])
    display_grand_output(dealer_cards, player_cards, dealer_total, player_total)
    update_scoreboard(dealer_total, player_total, scoreboard)
    display_scoreboard(scoreboard)
    display_grand_winner(scoreboard)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total['Total:']}"
  end

  # dealer's turn
  prompt("Dealer's turn next....")
  sleep(2)
  loop do
    break if dealer_total['Total:'] >= 17
    draw_card('Dealer', dealer_cards, deck, dealer_total)
    sleep(2)
    if busted?(dealer_total)
      display_result(dealer_total, player_total)
      break
    else
      prompt "Dealer stays at #{dealer_total['Total:']}"
    end
  end

  display_comparing_cards
  sleep(2)
  display_grand_output(dealer_cards, player_cards, dealer_total, player_total)
  sleep(2)
  display_result(dealer_total, player_total)
  sleep(2)
  update_scoreboard(dealer_total, player_total, scoreboard)
  display_scoreboard(scoreboard)
  display_grand_winner(scoreboard)

  response = play_again?
  break if response == 'n'
  reset_scoreboard(response, scoreboard)
end

display_goodbye
