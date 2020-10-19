=begin
Problem
-write a method named include? that takes an array and a search value as arguments. This method should return true if the search value is
in the array, false if it is not.

  Input:
  -array, and nil, or integer 
  Output
  -boolean value

  Rules:
  -you may not use the array#include? method in your solution

Examples/Test Cases
include?([1,2,3,4,5], 3) == true      => 3 occurs in array so true
include?([1,2,3,4,5], 6) == false     => 6 does not occur in array so false
include?([], 3) == false              => 3 does not occur in array so false
include?([nil], nil) == true          => nil does occur in array so true
include?([], nil) == false            => nil does not occur in array so false

Data Structure
-arrays and integers and boolean values

Algorithm
-define the method include? and it has two parameters, array and search_val
-call the count method on the array parameter and pass in the search_val as its argument... if the count is great than 0 then the method will return true
else it will return false

Code

=end

def include?(array, search_val)
  array.count(search_val) > 0
end

#test cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
