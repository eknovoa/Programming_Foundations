require 'yaml'
MESSAGES = YAML.load_file('twenty_one.yml')

SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display_intro
  system 'clear' || system('cls')
  prompt(MESSAGES['greeting'])
  puts " "
  prompt("Rules:")
  puts "---------------------------"
  prompt(MESSAGES['rules'])
  prompt("Have fun! Good Luck!")
  puts "---------------------------"
  puts " "
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def player_turn
  answer = nil
  loop do
    sleep(2)
    puts " "
    prompt(MESSAGES['hit_stay'])
    answer = gets.chomp
    if answer != 'h' && answer != 's'
      prompt(MESSAGES['invalid_action'])
    else
      break
    end
  end
  answer
end

def dealer_turn(dealer_total, dealer_cards, deck)
  display_hit('Dealer')
  draw_card(dealer_cards, deck, dealer_total)
  display_updated_cards(dealer_cards)
  display_total(dealer_total)
  sleep(2)
end

def draw_card(cards, deck, total)
  cards << deck.pop
  new_card = cards.last
  suit_card = new_card[1]
  value_card = new_card[1].to_i

  update_total(total, suit_card, value_card)
  cards
end

def drawing_ace(total)
  if total['Total:'] <= 10
    value = 11
  elsif total['Total:'] >= 11
    value = 1
  end
  value
end

def check_card_value(card_deck, total)
  card_one = card_deck[0]
  card_two = card_deck[1]
  value_one = card_one[1].to_i
  value_two = card_two[1].to_i

  check_card_one(card_one, value_one, total)
  check_card_two(card_two, value_two, total)
end

def check_card_one(card_one, value_one, total)
  if card_one.include?('A')
    value = drawing_ace(total)
    total['Total:'] += value
  elsif card_one.include?('J') || card_one.include?('Q') ||
        card_one.include?('K')
    total['Total:'] += 10
  else
    total['Total:'] += value_one
  end
  total
end

def check_card_two(card_two, value_two, total)
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

def finish_round(dealer_cards, player_cards, dealer_total, player_total, score)
  display_grand_output(dealer_cards, player_cards, dealer_total, player_total)
  update_score(dealer_total, player_total, score)
  display_score(score)
  display_grand_winner(score)
end

def update_total(total, suit_card, value_card)
  if suit_card.include?('A')
    ace_value = drawing_ace(total)
    total['Total:'] += ace_value
  elsif suit_card.include?('J') || suit_card.include?('K') ||
        suit_card.include?('Q')
    total['Total:'] += 10
  elsif value_card.between?(2, 10)
    total['Total:'] += value_card
  end
end

def update_score(dealer_total, player_total, score)
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

def display_initial_hand(p_cards, d_cards, total)
  prompt("Dealer has #{d_cards[0]} and ?")
  sleep(2)
  prompt("You have: #{p_cards[0]} and #{p_cards[1]}")
  sleep(2)
  prompt("Your Total: #{total['Total:']}")
end

def display_hit(name)
  prompt("#{name} chose to hit!")
  sleep(2)
end

def display_updated_cards(cards)
  prompt("Cards are now: #{cards}.")
end

def display_total(total)
  sleep(2)
  prompt "Total is now: #{total['Total:']}"
end

def display_comparing_cards
  puts " "
  prompt("Comparing card values...")
  puts " "
  sleep(2)
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  sleep(2)
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
  sleep(2)
end

def display_grand_output(dealer_cards, player_cards, dealer_total, player_total)
  sleep(2)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total['Total:']}"
  prompt "Player has #{player_cards}, for a total of: #{player_total['Total:']}"
  puts "=============="
end

def display_score(score)
  sleep(2)
  prompt("Score:
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

def play_again?
  puts " "
  prompt(MESSAGES['play_again'])
  response = gets.chomp
  if response != 'y' && response != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      response = gets.chomp.downcase
      break if response == 'y' || response == 'n'
    end
  end
  response == 'y'
end

def reset_score(score)
  if score['Player'] == WINS || score['Dealer'] == WINS
    score['Player'] = 0 && score['Dealer'] = 0
  end
end

def display_goodbye
  prompt(MESSAGES['goodbye'])
end

display_intro
score = { 'Player' => 0, 'Dealer' => 0 }
loop do
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

  loop do
    answer = player_turn
    system 'clear' || system('cls')
    if answer == 'h'
      display_hit('You')
      draw_card(player_cards, deck, player_total)
      display_updated_cards(player_cards)
      display_total(player_total)
    end
    break if answer == 's' || busted?(player_total)
  end

  if busted?(player_total)
    prompt(MESSAGES['player_busted'])
    finish_round(dealer_cards, player_cards, dealer_total, player_total, score)
    system 'clear' || system('cls')
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total['Total:']}"
  end

  system 'clear' || system('cls')
  prompt("Dealer's turn next....")
  loop do
    break if dealer_total['Total:'] >= 17
    dealer_turn(dealer_total, dealer_cards, deck)
    break if busted?(dealer_total)
  end

  if dealer_total['Total:'] >= 17
    prompt("Dealer stays at #{dealer_total['Total:']}")
  end

  display_result(dealer_total, player_total)
  display_comparing_cards
  finish_round(dealer_cards, player_cards, dealer_total, player_total, score)
  break unless play_again?
  system 'clear' || system('cls')
  player_cards.clear
  dealer_cards.clear
  reset_score(score)
end

display_goodbye
