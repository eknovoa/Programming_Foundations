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
-define the method stringy and it has one parameter, length
-the integer given will be the length of the string that is returned
-we need to alternate with 1s and 0s, starting with 1 so essentially 1s will be even and 0s will be odd, in terms of the index (position)
-initialize the variable result and assign it to an empty string
-initalize the variable index and assign it to 0
-until the size of the variable result is equal to length
  inside the loop method:
  -if index.even? then we will push the string '1' into the result.
  -else we will push the string '0' into the result
  -index += 1
-return the value stored in the variable, result

Code

=end

def stringy(length)
  result = ""
  index = 0
  until result.size == length
    result << '1' if index.even?
    result << '0' if index.odd?
    index += 1
  end
  result
end

#test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
