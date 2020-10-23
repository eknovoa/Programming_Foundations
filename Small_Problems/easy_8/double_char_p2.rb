=begin
Problem
-write a method that takes a string, and returns a new string in which every consonant character is doubled.

  Input:
  -string
  Output:
  -new string where all the alphabetical characters are doubled

  Rules:
  -vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled
  -not case sensitive

Examples/Test Cases
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

Data Structure
-strings, arrays, and integers

Algorithm
-define the method double_consonants and it has one parameter, str
-initalize the variable str_split and assign it the value of calling the chars method on the variable str
-initalize the variable new_str and assign it to an empty array
-call the map method on the variable str_split and pass in the do...end block as its argument and it has one parameter, char
  inside the method:
  -if char is a letter but is not a vowel then we want to multiply it times 2 and push it into the new string
  -if char is a punctuation, digit, vowel, or whitespace then we just push it into the new_string as one character
-return the value of calling the join method on the variable str_split

Code

=end

def double_consonants(str)
  new_str = []
  str_split = str.chars
  str_split.map do |char|
    if char.count('a-zA-Z') > 0 && char.count('aeiouAEIOU') == 0
      new_str << char * 2
    elsif char.count('0-9aeiouAEIOU') > 0 || char.count(' !-@#$%^&*_()+=[]{}|<\>?/;:"') > 0
      new_str << char
    end
  end
  new_str.join
end

#test cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
