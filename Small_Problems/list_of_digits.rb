=begin
Problem
-Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

  Input:
  -integer
  Output:
  -array of integers

Eaxmples/Test Cases
-puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
-puts digit_list(7) == [7]                     # => true
-puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
-puts digit_list(444) == [4, 4, 4]             # => true

Data Structure
-integers and arrays and strings

Algorithm
-define the method digit_list and it has one parameter, int
-inside the method definition:
  -initalize the variable new_array and assign it to an empty array
  -initalize the variable int_to_str and assign it to the value of calling the to_s method to convert the parameter, int into a string so we can break apart the number into strings in an array
  -then initalize the variable int_split and assign it to the value of calling the chars method on the variable, int_to_str
  -now we need to iterate through the array to turn each element into an integer. The best way to do this is by calling the map method on the variable, int_to_str
    and pass in the do...end block as its argument and give it one parameter, element
  -inside the method:
      -we need to convert the element into an integer by calling the #to_i method on the element and pushing the value into the new_array variable by calling the shovel operator (<<)

Code

=end

def digit_list(int)
  new_array = []
  int_to_str = int.to_s
  int_split = int_to_str.chars
  int_split.map do |element|
    new_array << element.to_i
  end
  new_array
end

#test cases
p digit_list(12345) == [1, 2, 3, 4, 5]
p digit_list(7) == [7]
p digit_list(375290) == [3, 7, 5, 2, 9, 0]
p digit_list(444) == [4, 4, 4]   