=begin
Problem
-write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
If the boolean is true, the bonush should be half the salary. If the boolean is false, then the bonus should be 0.

  Input:
  -integer and a boolean value
  Output:
  -integer

  Rules:
  -if boolean is true, bonus is half the salary
  -if boolean is false, bonus is 0

Examples/Test cases
-puts calculate_bonus(2800, true) == 1400       => true
-puts calculate_bonus(1000, false) == 0         => true
-puts calculate_bonus(50000, true) == 25000     => true

Data Structure
-integers and boolean values

Algorithm
-define the method calculate_bonus and it has two parameters, salary and bool
-we will use a conditional if/else statement:
  -if bool is true then return salary / 2
  -else return 0
-refactor into one line

Code

=end

def calculate_bonus(salary, bool)
  bool ? salary/2 : 0
end

#test cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
