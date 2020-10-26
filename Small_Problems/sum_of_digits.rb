=begin
Problem
-write a method that takes one argument, a positive integer, and returns the sum of its digits.

  Input:
  -integer
  Output:
  -integer

  Rules:
  -try constructing this problem without a while, until, loop, and each method
  -

Examples/Test cases
-puts sum(23) == 5              => true     2+3 = 5
-puts sum(496) == 19            => true     4+9+6 = 19
-puts sum(123_456_789) == 45    => true     1+2+3+4+5+6+7+8+9 = 45 // note, the underscores represent commas and show that this is a large integer

Data Structure
-integers, strings, and arrays

Algorithm
-define the method sum and it has one parameter, int
-I need to break this integer into single digits and then add them up without using the basic looping constructs mentioned in the rules above.
-first turn the int into a string and then call the chars method to split up the string element inside an array
-then call the map method to convert each element into an integer, #to_i
-then call the sum method on the new array

Code

=end

def sum(int)
  int.to_s.chars.map { |x| x.to_i }.sum
end

#test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
