=begin
Problem
-write a method that takes a positive integer as an argument and returns that number with its digits reversed.

  Input:
  -integer
  Output:
  -same integer but reversed

  Rules:
  -don't worry about arguments with leading zeros

Examples/Test Cases
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!      
reversed_number(12003) == 30021
reversed_number(1) == 1

Data Structure
-integers, strings, and arrays

Algorithm
-define the method reversed_number and it has one parameter, int
-initalize the variable array and assign it to the return value of calling the .to_s .chars method on the parameter int
-initalize the variable new_array and assign it to an empty array
-call the map method on the variable array and pass in the do...end block as its argument and it has one parameter, num_str
  inside the method:
  -call the unshift method on the variable new_array and pass in the variable, num_str as its argument
-call the join method on the variable array and then call the .to_i to convert it into an integer and then return that value

Code


=end

def reversed_number(int)
  new_array = []
  array = int.to_s.chars
  array.map do |num_str|
    new_array.unshift(num_str)
  end
  new_array.join.to_i   
end

#test cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
