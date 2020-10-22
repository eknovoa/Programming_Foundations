=begin
Problem
-create a simple mad-lib program that prompts for a noun, an adverb, and an adjective and injects those into a story
that you create

-madlibs are a simple game where you create a story template with blanks for words. You, or another player,
then construct a list of words and place them into the story, creating an often silly or funny story as a result.

  Input:
  -user inputs (4 strings)
  Output:
  -display user input in a string

Examples/Test Cases
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

Data Structure
-user input (strings)

Algorithm
-call the puts method four times to pass in the following strings:
  -enter a noun, enter a verb, enter an adjective, enter an adverb
-call the puts method and use string interpolation to merge the string display with the user input

Code

=end

puts "Enter a noun:"
noun = gets.chomp
puts "Enter a verb:"
verb = gets.chomp
puts "Enter an adjective:"
adj = gets.chomp
puts "Enter an adverb:"
adv = gets.chomp

puts "Do you walk your #{adj} #{noun} #{adv}? That's hilarious!"
