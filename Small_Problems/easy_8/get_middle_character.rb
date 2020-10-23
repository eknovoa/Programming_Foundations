=begin
Problem
-write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should
return exactly two characters.

  Input:
  -string
  Output:
  -new string (middle character or characters of the argument)

  Rules:
  -if length is odd return one character
  -if length is even return two characters
  -return the middle character(s) of argument
  -account for spaces in the given string

Examples/Test Cases
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

Data structure
-strings and arrays

Algorithm
-define the method center_of and it has one parameter, string
  -if the string size is odd then call the is_odd method and pass in the variable string as its argument
  -if the string size is even then call the is_even method and pass in the variable string as its argument
-define the method is_odd and it has one parameter, str_odd
  -initialize the variable midpoint = str_odd.size / 2
  -return str_odd[midpoint]
-define the method is_even and it has one parameter, str_even
  -initalize the variable midpoint and assign it to str_even.size / 2
  -return str_odd[midpoint-1] + str_odd[midpoint]


Code

=end

def center_of(string)
  return is_odd(string) if string.size.odd?
  return is_even(string) if string.size.even?
end

def is_odd(str_odd)
  midpoint = (str_odd.size) / 2
  return str_odd[midpoint]
end

def is_even(str_even)
  midpoint = (str_even.size) / 2
  return str_even[midpoint - 1] + str_even[midpoint]
end

#test cases
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
