=begin
Problem
-write a method that takes an arary as an argument, and reverses its elements in place; that is, mutate the array passed into this method.
The return value should be the same array object.

  Input:
  -array of strings
  Output:
  -array of strings

  Rules:
  -you may not use array#reverse or array#reverse!

Examples/Test cases
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

Data Structure
-arrays and strings

Algorithm
-the shovel operator and each and map method will not work in this example.
 -use the while loop method to keep looping through until the size of the array and reassign each element

-define the method reverse! and it has one parameter, list
-initalize the variable, left_index and assign it to 0
-initalize the variable, right_index and assign it to -1
-invoke the while loop method and we can say while the left_index is less than half of the size of the list
  -using reassignment list[left_index], list[right_index] = list[right_index], list[left_index]
  -increase the left_index variable by 1
  -decrease the right_index variable by -1
-return the value stored in the variable, list

Code

=end

def reverse!(list)
  left_index = 0
  right_index = -1

  while left_index < list.size / 2
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end
  list
end

#test cases
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []
