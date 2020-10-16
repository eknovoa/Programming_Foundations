=begin
Problem
-write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be 98 (3+5+6+9+10+12+15+18+20). If the number is a multiple of both 3 and 5, only count it once.

  Input:
  -integer
  Output:
  -integer

  Rules:
  -you may assume that the number passed in is an integer greater than 1.

Examples/test cases
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

Data Structure
-integers and arrays

Algorithm
-define the method multisum and it has one parameter, int
-initalize variable, array and assign it to an empty array
-initalize variable, multiple_three and assign it to 3
-initalize variable, multiple_five and assign it to 5
-invoke the while loop method and pass in the following conditional statement as its argument, while multiple_three is between 1 and int:
  -inside the method:
  -we will reassign multiple_three to be multiple_three = multiple_three + 3, so we want to increment this variable by 3 everytime we execute the code in the block of the loop
  -we will then push in the variable, multiple_three into the array by using the shovel operator (<<)
-invoke the while loop method and pass in the following conditional statement as its argument, while multiple_three is between 1 and int:
  -inside the method:
  -we will reassign multiple_five to be multiple_five = multiple_five + 5, so we want to increment this variable by 5 everytime we execute the code in the block of the loop
  -we will then push in the variable, multiple_five into the array by using the shovel operator (<<)
-the last thing we will do is call the uniq method and the sum method on the variable, array and return this value 

Code

=end

def multisum(int)
  array = []
  multiple_three = 3
  multiple_five = 5

  while (1..int).include?(multiple_three)
    array << multiple_three
    multiple_three += 3
  end

  while (1..int).include?(multiple_five)
    array << multiple_five
    multiple_five += 5
  end
  array.uniq.sum
end

#test cases
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168


