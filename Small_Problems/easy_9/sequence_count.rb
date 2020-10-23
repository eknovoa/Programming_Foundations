=begin
Problem
-create a method that takes two integers as arguments. THe first argument is a count, and the second is the first number of a sequence that
your method will create. The method should return an array that contains the same number of elements as the count argument, while the values
of each element will be multiples of the starting number.

  Input:
  -two integers
  Output:
  -an array of integers

  Rules:
  -you may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value.
  -if the count is 0, an empty list should be returned

Examples/Test Cases
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

Data Structure
-arrays and integers

Alogrithm
-define the method sequence and it has two parameters, count and num
-initalize the variable array and assign it to an empty array
-if count == 0 then return an empty array
-initalize the variable multiple and assign it to the same value stored in the variable, num
-until the array.size == count
  insde the method:
  -using the shovel operator, push the num into the array variable
  -reassign num to be num = num + num
-return the value stored in the variable array

Code

=end

def sequence(count,num)
  array = []
  return array if count == 0
  multiple = num
  until array.size == count
    array << num
    num += multiple
  end
  array
end

#test cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
