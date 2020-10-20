=begin
Problem
-write a method that combines two arrays passed in as arguments, and returns a new array that contains all elements from both Array arguments, with the
elements taken in alteration

  Input:
  -two ararys
  Output:
  -one array

  Rules:
  -you may assume that both input arrays are non-empty, and that they have the same number of elements

Examples/Test Cases
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Data Structure
-arrays, integers

Algorithm
-define the method interleave and it has two parameters, array1 and array2
-initalize variable new_array and assign it to an empty array
-initalize variable index and assign it to 0
-invoke the while loop method and pass in this conditional statement as its argument, index <= array1.size
  inside the method:
  -use the shovel operator to push in the value at the current index position of array1
  -use the shovel operator to push in the value at the current index position of array2
  -reassign index to be index+= 1 to avoid an infinite loop
-return the new_array  
Code

=end

def interleave(array1,array2)
  new_array = []
  index = 0
  while index < array1.size
    new_array << array1[index]
    new_array << array2[index]
    index += 1
  end
  new_array
end

#test cases
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
