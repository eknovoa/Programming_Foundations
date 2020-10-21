=begin
Problem
-write a method that returns the next to last word in the string passed to it as an argument.

  Input:
  -string
  Output:
  -string

  Rules:
  -words are any sequences of non-blank characters
  -you may assume that the input string will always contain at least two words

Examples/Test Cases
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

Data Structure
-strings and arrays

Algorithm
-define the method penultimate and it has one parameter, string
-initalize the variable string_split and assign it to the value of calling the split method on the parameter, string
-return the second to last element in string_split

Code

=end

def penultimate(string)
  string_split = string.split()
  string_split[-2]
end

#test cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
