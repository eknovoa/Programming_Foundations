require 'yaml'
MESSAGES = YAML.load_file('RPS_bonus.yml')

VALID_CHOICES_ABB = %w(r p s sp l)
WIN_OPTIONS = { 'r' => ['s', 'l'],
                'p' => ['r', 'sp'],
                's' => ['p', 'l'],
                'sp' => ['s', 'r'],
                'l' => ['sp', 'p'] }

PLAYER_WINS = []
COMPUTER_WINS = []
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

def player_display(display)
  if display == 'r'
    display_output = 'Rock'
  elsif display == 'p'
    display_output = 'Paper'
  elsif display == 's'
    display_output = 'Scissors'
  elsif display == 'sp'
    display_output = 'Spock'
  else
    display_output = 'Lizard'
  end
  display_output
end

def computer_display(display)
  if display == 'r'
    computer_display = 'Rock'
  elsif display == 'p'
    computer_display = 'Paper'
  elsif display == 's'
    computer_display = 'Scissors'
  elsif display == 'sp'
    computer_display = 'Spock'
  else
    computer_display = 'Lizard'
  end
  computer_display
end

def player_win?(player, computer)
  WIN_OPTIONS.key?(player) && WIN_OPTIONS[player].include?(computer)
end

def computer_win?(computer, player)
  WIN_OPTIONS.key?(computer) && WIN_OPTIONS[computer].include?(player)
end

def display_results(player, computer)
  if player_win?(player, computer)
    prompt("You won!")
    PLAYER_WINS << 1
  elsif computer_win?(computer, player)
    prompt("Computer won!")
    COMPUTER_WINS << 1
  else
    prompt("It's a tie!")
  end
end

def display_scoreboard
  prompt("Scoreboard:
   Player: #{PLAYER_WINS.sum}
   Computer: #{COMPUTER_WINS.sum}")
end

def display_grand_winner
  if PLAYER_WINS.sum == TOTAL_WINS
    prompt(MESSAGES['player_grand_winner'])
  elsif COMPUTER_WINS.sum == TOTAL_WINS
    prompt(MESSAGES['computer_grand_winner'])
  end
end

def clear_screen(answer)
  if answer.downcase == 'y'
    system('clear') || system('cls')
  end
  answer
end

def reset_scoreboard(answer)
  if (PLAYER_WINS.sum == TOTAL_WINS || COMPUTER_WINS.sum == TOTAL_WINS) &&
     answer == 'y'
    PLAYER_WINS.clear && COMPUTER_WINS.clear
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

puts " "
prompt(MESSAGES['play'])

loop do
  choice = ''
  loop do
    prompt("Choose one:
  '#{VALID_CHOICES_ABB[0]}'  - Rock
  '#{VALID_CHOICES_ABB[1]}'  - Paper
  '#{VALID_CHOICES_ABB[2]}'  - Scissors
  '#{VALID_CHOICES_ABB[3]}' - Spock
  '#{VALID_CHOICES_ABB[4]}'  - Lizard")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES_ABB.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES_ABB.sample
  display_computer = computer_display(computer_choice)
  display_choice = player_display(choice)
  prompt("You chose: #{display_choice}; Computer chose: #{display_computer}")

  display_results(choice, computer_choice)
  puts " "
  display_scoreboard
  puts " "
  display_grand_winner
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
  reset_scoreboard(answer)
end

prompt("Thank you for playing, #{name.capitalize}. Goodbye!")
