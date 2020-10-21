=begin
Problem
-write a method that takes two array arguments in which each array contains a list of numbers, and returns a
new array that contains the product of every pair of numbers that can be performed between the elements of the two
arrays.

  Input:
  -two arrays of integers
  Output:
  -one array of integers

  Rules:
  -the results should be sorted by increasing value
  -you may assume that neighter argument is an empty array

Examples/Test Cases
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Data Structure
-arrays and integers

Algorithm
-define the method multiply_all_pairs and it has two parameters, array1, array2
-initalize the variable new_array and assign it to an empty array
-call the map method on the array1 and pass in the do...end block as its argument and it has one paramenter, num
  inside the method:
  -call the map method again on array2 and pass in the do...end block as its argument and it has one parameter, num2
    inside the method:
    new_array << num * num2
-return the value of calling the sort method on the variable new_array
Code

=end

def multiply_all_pairs(array1,array2)
  new_array = []
  array1.map do |num|
    array2.map do |num2|
      new_array << num * num2
    end
  end
  new_array.sort
end

#test cases
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
