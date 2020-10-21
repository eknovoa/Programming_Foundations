=begin
Problem
-write a method that takes two array arguments in which each array contains a list of numbers, and returns a new
array that contains the product of each pair of numbers from the arguments that have the same index.

  Input:
  -2 array of integers
  -one new array

  Rules:
  -you may assume that the arguments contain the same number of elements

Examples/Test Cases
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Data Structure
-arrays and integers

Algorithm
-define the method multiply_list and it will have two parameters, array1 and array2
-initialize the variable new_array and assign it to an empty array
-initalize the variable index and assign it to 0
-invoke the while loop method and pass in this conditional statement as its argument, index < array1.size
  inside the method:
  -new_array << array1[index] times array2[index]
  -reassign index to be index += 1 to avoid an infinite loop
-return the new_array
Code

=end

def multiply_list(array1,array2)
  new_array = []
  index = 0
  while index < array1.size
    new_array << array1[index] * array2[index]
    index += 1
  end
  new_array
end

#test cases
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
