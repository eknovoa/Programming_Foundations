=begin
Problem
-write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd.

  Input:
  -integer
  Output:
  -boolean value

  Rules:
  -you may assume that the argument is a valid integer value
  -one integer argument, can be positive, negative, or zero
  -number's absolute value has to be odd to return true
  -not allowed to use #odd? or #even? in your solution

Examples/Test Cases
-puts is_odd?(2)    => false
-puts is_odd?(5)    => true
-puts is_odd?(-17)  => true
-puts is_odd?(-8)   => false
-puts is_odd?(0)    => false
-puts is_odd?(7)    => true

Data Structure
-integers and boolean values

Algorithm
-define the method is_odd? and it has one parameter, int
-inside the method:
  -first we need to call the abs() method on the parameter, int and assign it to the variable, num
  -then call the modulo operator on the variable, num and pass in the integer, 2 as its argument  and we will compare whether that expression is equal to 0

Code

=end

def is_odd?(int)
  num = int.abs()
  num % 2 != 0
end

#test cases
puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)
