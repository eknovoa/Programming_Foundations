=begin
Problem
-write a method that takes two arrays as arguments, and returns an array that contains all of the values from the argument arrays

  Input:
  -two arrays
  Output:
  -one array

  Rules:
  -there should be no duplication of values in the returned array, even if there are duplicates in the original arrays

Examples/Test cases
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Data Structure
-arrays

Algorithm
-define the method merge and it has two parameters, array1 and array2
-call the concat method on the array1 and pass in array2 as its argument and then call the uniq! method to remove any duplicates

Code

=end

def merge(array1, array2)
  array1.concat(array2).uniq!
end

#test cases
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
