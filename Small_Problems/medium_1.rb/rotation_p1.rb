=begin
Problem
-write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

  Input:
  -array
  Output:
  -array with its first element now at the end of the array

  Rules:
  -do not use the method array#rotate or array#rotate! for your implementation

Examples/Test Cases
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Data Structure
-arrays, strings and integers

Algorithm
-objective is to take the first element of the array and push it at the end of the array
-define the method rotate_array and it has one parameter, arr
-initalize the variable first_element and assign it to the value of calling the first method on the parameter, arr to find the first element of the array
-then call the shift method on the variable, arr to remove the first element out of the array
-use the shovel operator to push in the first_element into the variable arr
-return the value stored in the variable, arr

Code

=end

def rotate_array(arr)
  first_element = arr.first
  arr.shift 
  arr << first_element
  arr
end

#test cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
