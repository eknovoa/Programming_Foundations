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
  -convert the integer into a string using the .to_s method and then call the chars method to split the string into an array
  -now we need to iterate through the array to turn each element into an integer. The best way to do this is by calling the map method right after calling the chars method
    and pass in the do...end block as its argument and give it one parameter, element
  -inside the method:
      -we need to convert the element into an integer by calling the #to_i method on the element
  -since we called the map method, we know that it will return a new array with the return values from the block

Code

=end

def digit_list(int)
  int.to_s.chars.map { |element| element.to_i }
end

#test cases
p digit_list(12345) == [1, 2, 3, 4, 5]
p digit_list(7) == [7]
p digit_list(375290) == [3, 7, 5, 2, 9, 0]
p digit_list(444) == [4, 4, 4]   
