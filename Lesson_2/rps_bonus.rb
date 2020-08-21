require 'yaml'
MESSAGES = YAML.load_file('RPS_bonus.yml')

VALID_CHOICES_ABB = %w(r p s sp l)

VALID_CHOICES = { 'r' => 'Rock',
                  'p' => 'Paper',
                  's' => 'Scissors',
                  'sp' => 'Spock',
                  'l' => 'Lizard' }

WIN_OPTIONS = { 'r' => ['s', 'l'],
                'p' => ['r', 'sp'],
                's' => ['p', 'l'],
                'sp' => ['s', 'r'],
                'l' => ['sp', 'p'] }

TOTAL_WINS = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_name?(n)
  char_num = "0-9!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
  loop do
    if n.count('a-zA-z') > 0 && n.count(char_num) == 0
      break
    elsif n.count(char_num) > 0 || n.empty?() || n.count("a-zA-Z") > 0
      prompt(MESSAGES['invalid_name'])
      n = Kernel.gets().chomp()
    end
  end
  n
end

def display_choices
  prompt("Choose one: #{VALID_CHOICES}")
end

def get_full_choice_name(choice)
  case choice
  when "r" then "Rock"
  when "p" then "Paper"
  when "s" then "Scissors"
  when "sp" then "Spock"
  when "l" then "Lizard"
  end
end

def who_won?(user_one, user_two)
  WIN_OPTIONS.key?(user_one) && WIN_OPTIONS[user_one].include?(user_two)
end

def display_results(player, computer)
  if who_won?(player, computer)
    prompt("You won!")
  elsif who_won?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def update_wins(player, computer, score)
  if who_won?(player, computer)
    score['player'] += 1
  elsif who_won?(computer, player)
    score['computer'] += 1
  end
end

def display_scoreboard(score)
  prompt("Scoreboard:
   Player: #{score['player']}
   Computer: #{score['computer']}")
end

def display_grand_winner(score)
  if score['player'] == TOTAL_WINS
    prompt(MESSAGES['player_grand_winner'])
  elsif score['computer'] == TOTAL_WINS
    prompt(MESSAGES['computer_grand_winner'])
  end
end

def clear_screen(answer)
  if answer.downcase == 'y'
    system('clear') || system('cls')
  end
  answer
end

def reset_scoreboard(answer, score)
  if (score['player'] == TOTAL_WINS || score['computer'] == TOTAL_WINS) &&
     answer == 'y'
    score['player'] = 0 && score['computer'] = 0
  end
end

puts(MESSAGES['lines'])
puts(MESSAGES['welcome'])
puts(MESSAGES['lines'])

prompt(MESSAGES['name'])
name = Kernel.gets().chomp()
name = valid_name?(name)
prompt("Hi, #{name.capitalize}!")

prompt(MESSAGES['rules'])
rules = Kernel.gets().chomp()
if rules != 'y' && rules != 'n'
  loop do
    prompt(MESSAGES['invalid_response'])
    rules = Kernel.gets().chomp().downcase()
    break if rules.start_with?('y') && rules.size == 1
    break if rules.start_with?('n') && rules.size == 1
  end
  if rules.start_with?('y') || (rules.start_with?('n') && rules.size > 1)
    loop do
      if rules.start_with?('y') && rules.size == 1
        rules_game = <<-MSG
        The Rules are:
        ----------------------------
        Scissors cuts Paper
        Paper covers Rock
        Rock crushes Lizard
        Lizard poisons Spock
        Spock smashes Scissors
        Scissors decapitates Lizard
        Lizard eats Paper
        Paper disproves Spock
        Spock vaporizes Rock
        Rock crushes Scissors
        MSG
        prompt(rules_game)
        break
      end
      prompt(MESSAGES['invalid_response'])
      rules = Kernel.gets().chomp().downcase()
      break if rules.start_with?('n') && rules.size == 1
    end
  end
end

puts " "
prompt(MESSAGES['game_info'])
prompt(MESSAGES['play'])

scoreboard = { 'player' => 0, 'computer' => 0 }
loop do
  choice = ''
  loop do
    display_choices
    choice = Kernel.gets().chomp()
    if VALID_CHOICES_ABB.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES_ABB.sample
  display_computer = get_full_choice_name(computer_choice)
  display_choice = get_full_choice_name(choice)
  prompt("You chose: #{display_choice}; Computer chose: #{display_computer}")

  display_results(choice, computer_choice)
  update_wins(choice, computer_choice, scoreboard)
  puts " "
  display_scoreboard(scoreboard)
  puts " "
  display_grand_winner(scoreboard)
  puts " "

  prompt(MESSAGES['play_again'])
  answer = Kernel.gets().chomp()
  if answer != 'y' && answer != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      answer = Kernel.gets().chomp().downcase()
      break if answer.start_with?('y') && answer.size == 1
      break if answer.start_with?('n') && answer.size == 1
    end
  end
  break unless answer.start_with?('y') && answer.size == 1
  clear_screen(answer)
  reset_scoreboard(answer, scoreboard)
end

prompt("Thank you for playing, #{name.capitalize}. Goodbye!")
