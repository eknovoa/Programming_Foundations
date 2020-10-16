=begin
Problem
-write a method that takes a positive integer or zero, and converts it to a string representation

  Input:
  -integer
  Output:
  -string

  Rules:
  -you may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
  -your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples/Test Cases
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

Data Structure
-strings, integers

Algorithm
-initalize the constant variable DIGITS and assign it to hash with the following key/pair entries:
"0" - 0, "1" - 1, "2" - 2, "3" - 3, "4" - 4, "5" - 5, "6" - 6, "7" - 7, "8" - 8, "9" - 9
-define the method integer_to_string and it has one parameter, integer
-initalize the variable array and assign it to an empty array
-initalize the variable int and assign it to the value stored in parameter, integer
-we want to basically reverse our last method problem... we need to locate the remainder using the modulus operator % (int % 10) to locate its key/value pair in the hash
    we will want to keep doing this until int % 10 == 0
    we will assign the int % 10 value into the variable called value
    to avoid having an infinite loop, we need to reassign the variable int to be int = int / 10
    then we need to add the key into the array as the last element by calling the prepend method
-we need to call the prepend method on the array one more time to add in the final string character to the front of the array (DIGITS[int])
-then we call the join method on the array and return that value

Code

=end

DIGITS = {
  0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def integer_to_string(integer)
  array = []
  int = integer
  until int / 10 == 0
    value = int % 10
    int = int / 10
    array.prepend(DIGITS[value])
  end
  array.prepend(DIGITS[int])
  array.join("")
end


#test cases
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
