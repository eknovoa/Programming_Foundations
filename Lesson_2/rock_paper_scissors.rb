VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

choice = ' '
loop do
  prompt("Choose one: #{VALID_CHOICES}")
  choice = Kernel.gets().chomp()

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice.")
  end
=begin
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
=end
  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{VALID_CHOICES}; Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)
=begin
  choice_count = 0
  computer_count = 0
  loop do
    if display_results(VALID_CHOICES[choice], computer_choice) == "You won!"
      choice_count += 1
    elsif display_results(VALID_CHOICES[choice], computer_choice) == "Computer won!"
      computer_count += 1
    end
    break unless computer_count == 5 || choice_count == 5
  end
=end 
   #prompt("You are the grand winner!")
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end 

prompt("Thank you for playing. Good bye!")

=begin
to do "r" for rock , "p" for paper etc... i need to create a hash and then have a method that iterrates through
  each item in the hash and then print the value of the key out. 
=end
