=begin
Problem
-write a method that takes one argument, an array containing integers, and returns the average
of all numbers in the array.

  Input:
  -array of integers
  Output:
  -integer

  Rules:
  -the array will never be empty
  -the numbers will always be positive integers
  -your result should also be an integer

Examples/Test cases
-puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3     => true
-puts average([1, 5, 87, 45, 8, 8]) == 25                           => true
-puts average([9, 47, 23, 95, 16, 52]) == 40                        => true

Data Structure
-arrays and integers

Algorithm
-define the method average and it has one parameter, array
-call the sum method on the parameter, array and divide that by calling the size method on the parameter, array

Code

=end

def average(array)
  array.sum/array.size
end

#test cases
p average([1, 6]) == 3
p average([1, 5, 87, 45, 8, 8]) == 25
p average([9, 47, 23, 95, 16, 52]) == 40
