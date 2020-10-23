=begin
Problem
-write a method that takes an integer argument, and returns an array of all integers, in sequence, between 1 and the argument

  Input:
  -integer
  Output:
  -an array of integers

  Rules:
  -you may assume that the argument will always be a valid integer that is greater than 0

Examples/Test Cases
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

Data Structure
-integers, arrays

Algorithm
-define the method sequence and it has one parameter, int
-initalize the variable array and assign it to an empty array
-invoke the for loop, for i in (1..int) push in each number into the variable array
-return the value stored in the variable array
Code

=end

def sequence(int)
  array = []
  for i in (1..int)
    array << i 
  end
  array
end

#test cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
