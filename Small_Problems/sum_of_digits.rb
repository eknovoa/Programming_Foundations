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
-we can use the reduce method to sum the digits .reduce(:+)
-we need to chain the following methods together and call them on the variable int... (.to_s.chars.map(&:to_i).reduce(:+)) so what this chain of methods is doing
is changing the given integer into a string and then separating out the digits into an array and iterating through the array using the map method and changing each element
into an integer and then we use the reduce method (:+) with this syntax to sum up the digits.

Code

=end

def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

#test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
