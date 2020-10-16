=begin
Problem
-write a method that takes a string of digits, and returns the appropraite number as an integer. you may not use the methods mentioned in the rules.

  Input:
  -string
  Output:
  -integer

  Rules:
  -cannot use string#to_i, Integer(), etc. your method should do this the old-fashioned way and calculate the result by analyzing the characteres in the string.
  -Do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

Examples/Test Cases
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data Structure
-strings, integers, array, and a hash

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
-then we return the variable, value

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
  value
end

#test cases
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
