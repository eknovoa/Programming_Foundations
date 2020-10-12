=begin
Problem
-write amethod that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1.

  Input:
  -integer
  Output:
  -string

  Rules:
  -the method will take arguments of a positive integers
  -the returning string will always start with 1
  -the length of the string should match the given integer

Examples/Test cases
-puts stringy(6) == '101010'      => true
-puts stringy(9) == '101010101'   => true
-puts stringy(4) == '1010'        => true
-puts stringy(7) == '1010101'     => true

Data Structure
integers, strings, and arrays

Algorithm
-define the method stringy and it has one parameter, int
-the integer given will be the length of the string that is returned
-we need to alternate with 1s and 0s, starting with 1 so essentially 1s will be even and 0s will be odd, in terms of the index (position)
-initialize the variable array and assign it to an empty array
-initalize the variable index and assign it to 0
-let's call the while loop method and pass in this conditional statement as its argument, index <= int
  inside the loop method:
  -if index.even? then we will push the string '1' into the variable, array.
  -else we will push the string '0' into the variable, array
  -index += 1
-call the join method on our array variable and pass in "" as its argument

Code

=end

def stringy(int)
  array = []
  index = 0
  while index < int
    if index.even?
      array << '1'
    else
      array << '0'
    end
    index += 1
  end
  array.join("")
end

#test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
