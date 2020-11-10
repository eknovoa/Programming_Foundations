=begin
problem
-write a method that takes an array, and returns a new array with the elements of the original list in reverse order.

  Input:
  -
  Output:
  -

  Rules:
  -do not modify the original list
  -you cannot use the array#reverse or array#reverse! methods
  -you cannot use the method you wrote in the pervious exercise

Examples/Test Cases
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

Data Structure
-arrays that contain integers and strings

Algorithm
-define the method reverse and pass in a parameter, array
-initalize variable reversed_array and assign it to an empty array
-call the each method on the variable array and pass in the do...end block as its argument and it has one
  parameter element
  inside the method:
  -call the unshift method reversed_array and pass in the element as its argument
-return the value stored in the variable reversed_array

Code

=end

def reverse(array)
  reversed_array = []
  array.each { |element| reversed_array.unshift(element) }
  reversed_array
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 3, 2]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]
