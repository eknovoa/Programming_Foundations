=begin
Problem
-given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string
with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space
in the result.

  Input:
  -string
  Output:
  -string

  Rules:
  -the result should never have consecutive spaces

Examples/Test Cases
cleanup("---what's my +*& line?") == ' what s my line '

Data Structure
-string

Algorithm
-first I want to focus on removing all of the non-alphabetic characters out of the string
-second, we want to make sure there are not consecutive spaces

Part I:
-initalize the constant variable, CHARACTERS = "!@#$%^&*()_-+=~`:;''/?,.<>"
-define the method, cleanup and it has one parameter, string
-initalize the variable str_split and assign it to the value of calling the chars method on the parameter, string
-call the map method on the variable str_split and pass the do...end block in as its argument and it has one parameter, char
  inside the method:
  -if the current element stored in char is in the constant variable, CHARACTERS then we need to replace char in the variable string with a space by calling the
  gsub! method

Part II:
-define method remove_extra_spaces and it has one parameter called string
-initalize variable index and assign it to 0
-call the while loop method and pass in the conditional statement as its argument, index <= string.size
  inside the while loop:
  -if the current index position of the string and the next position to the right of it are both spaces, then  we need to delete the space at the current index position

Code

=end

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else 
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
    clean_chars.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
