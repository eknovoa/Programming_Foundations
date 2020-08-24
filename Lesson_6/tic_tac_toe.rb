require 'yaml'
MESSAGES = YAML.load_file('tic_tac_toe.yml')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GOES_FIRST = 'choose'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_game_intro
  system 'clear'
  prompt(MESSAGES['welcome'])
  prompt(MESSAGES['game_rules'])
  prompt(MESSAGES['board_set_up'])
  puts ""
  puts "     |     |     "
  puts "  1  |  2  |  3  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  4  |  5  |  6  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  7  |  8  |  9  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' || system('cls')
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def joinor(arr, delimiter = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def who_goes_first?
  if GOES_FIRST == 'choose'
    loop do
      prompt(MESSAGES['goes_first'])
      prompt(MESSAGES['c_or_p'])
      answer = gets.chomp.downcase
      case answer
      when 'c' then return 'computer'
      when 'p' then return 'player'
      else
        prompt(MESSAGES['invalid_who_goes_first'])
      end
    end
  else
    GOES_FIRST
  end
end

def turn(brd, current_player)
  case current_player
  when 'computer' then computer_places_piece!(brd)
  when 'player' then player_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when 'computer' then 'player'
  when 'player' then 'computer'
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a position to place a piece: " \
           "(#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt(MESSAGES['invalid_choice'])
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  square = computer_offense!(brd, square)

  if !square
    square = computer_defense!(brd, square)
  end

  if !square
    square = if brd[5] == INITIAL_MARKER
               5
             else
               empty_squares(brd).sample
             end
  end
  brd[square] = COMPUTER_MARKER
end

def computer_offense!(brd, square)
  WINNING_LINES.each do |line|
    square = defend_the_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense!(brd, square)
  WINNING_LINES.each do |line|
    square = defend_the_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def defend_the_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def update_wins(brd, score)
  if detect_winner(brd) == 'Player'
    score['Player'] += 1
  elsif detect_winner(brd) == 'Computer'
    score['Computer'] += 1
  end
end

def display_scoreboard(score)
  prompt("Scoreboard:
   Player: #{score['Player']}
   Computer: #{score['Computer']}")
end

def display_grand_winner(score)
  if score['Player'] == WINS
    prompt(MESSAGES['you_winner'])
  elsif score['Computer'] == WINS
    prompt(MESSAGES['computer_winner'])
  end
end

def reset_scoreboard(answer, score)
  if (score['Player'] == WINS || score['Computer'] == WINS) &&
     play_again?(answer) == 'y'
    score['Player'] = 0 && score['Computer'] = 0
  end
end

def play_again?
  prompt(MESSAGES['play_again'])
  answer = gets.chomp
  if answer != 'y' && answer != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      answer = gets.chomp.downcase
      break if answer == 'y' || answer == 'n'
    end
    reset_scoreboard(answer, scoreboard)
  end
  answer
end

def display_goodbye
  prompt(MESSAGES['goodbye'])
end

display_game_intro
loop do
  scoreboard = { 'Player' => 0, 'Computer' => 0 }
  current_player = who_goes_first?
  loop do
    board = initialize_board
    loop do
      display_board(board)
      turn(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      update_wins(board, scoreboard)
      display_board(board)
      display_scoreboard(scoreboard)
      prompt "#{detect_winner(board)} won!"
      display_grand_winner(scoreboard)
    else
      display_scoreboard(scoreboard)
      prompt(MESSAGES['tie'])
    end

    break if play_again? == 'n'
  end
  break
end

display_goodbye
