=begin
Problem
-write a method that takes a string of digits, and returns the appropriate number as an integer.

  Input:
  -string
  Output:
  -integer

  Rules:
  -the string may have a leading + or - sign, if the character is a +, your method should return a positive number; if it is a -, your method should return a negative
  number. If no sign is given, you should return a positive number.
  -you may assume the string will always contain a valid number
  -you may not use any of the standard conversion methods available in Ruby, such as string#to_i, integer(), etc. 
  -you may use the string_to_integer method from the previous lesson.

Examples/Test Cases
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Data Structure
-strings, integers, arrays, and hash

Algorithm
-initalize the constant variable, DIGITS, and assign it to the hash with the following key/value pairs:
'1' = 1, '2' = 2, '3' = 3, '4' = 4, '5' = 5, '6' = 6, '7' = 7, '8' = 8, '9' = 9
-define the method, string_to_integer and it has one parameter, string
-initalize the variable str_split and assign it to the value of calling the chars method on the parameter, string
-initalize variable digits and assign it to the value of calling the map method on str_split and passing in the do...end block as its argument
  and it has one parameter, char.
  inside the map method:
  -we want to access the hash, DIGITS to find the value of the key at the current element, char
-initalize variable value and assign it to 0
-call the each method on the variable, digits and pass in the do...end block as its argument with the parameter, digit
  inside the each method:
  -reassign the variable, value to be eaqual to 10 * value + digit
-then we need to check to see whether the first character of the string included a + or - sign. We can do this using if/else conditional statements.
  if string[0] is equal to the character, "+" then we will return our value as a positive number
  if string[0] is equal to the character, "-" then we will return our value as a negative number
  else we will return our value as a positive number if the string does not include a "+" or "-" character.

Code

=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  str_split = string.chars
  digits = str_split.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  
  if string[0] == "+"
    +value
  elsif string[0] == '-'
    -value
  else 
    +value
  end
end

#test cases
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
