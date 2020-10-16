=begin
Problem
-write a method that takes an array of numbers, and returns an array with the same number of elements, and each element has the running total from the 
original array.

  Input:
  -array of integers
  Output:
  -array of integers

  Rules:

Examples/Test Cases
running_total([2, 5, 13]) == [2, 7, 20]                         => [2+0, 5+2 = 7, 7+13 = 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]      => [14+0, 14+11=25, 25+7=32, 32+15=47, 47+20=67]
running_total([3]) == [3]                                       => [3+0] so returns original integer if there is only one
running_total([]) == []                                         => [] = [] a given empty array returns an empty array

Data Structure
-integers, arrays

Algorithm
-define the method running_total and it has one parameter, array
-initalize the variable new_array and assign it to an empty array
-if array.empty? then we will return new_array as an empty array
-initalize the variable sum and assign it to 0
-then we will call the map method on the paramter, array and pass in the do...end block at its argument and it has one parameter, element
  inside the map method:
  -reassign the variable sum to sum = sum + element
  -then we will push that value stored in the variable, sum, into the new_array variable by using the shovel operator (<<)
-then we will return the variable, new_array 

Code

=end

def running_total(array)
  new_array = []
  sum = 0

  if array.empty?
    return new_array
  end

  array.map do |element|
    sum += element
    new_array << sum
  end
  new_array
end

#test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []