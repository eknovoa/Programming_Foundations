=begin
Problem
-write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number
is 0 or negative, return the original number.

  Input:
  -integer
  Output:
  -integer

  Rules:

Examples/Test Cases
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Data Structure
-integers

Algorithm
-define the method negative and it has one parameter, int
-return -int if int > 0
-return int if int < 0

Code

=end

def negative(int)
  return -int if int > 0
  return int if int < 0
  return 0 if int == 0
end

#test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
