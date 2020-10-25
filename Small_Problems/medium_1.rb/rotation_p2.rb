=begin
Problem
-write a method that can rotate the last n digits of a number

  Input:
  Output:

  Rules:
  -you may use the same method from the previous exercise if you want
  -you may assume that n is always a positive integer
  -note that rotating just 1 digit results in the original number being returned

Examples/Test Cases
rotate_rightmost_digits(735291, 1) == 735291        if 1 is the second argument then return original number
rotate_rightmost_digits(735291, 2) == 735219        if 2 is the second argument then the 2nd from last number is removed and put on the end
rotate_rightmost_digits(735291, 3) == 735912        if 3 is the second argument then the 3rd from last number is removed and put on the end
rotate_rightmost_digits(735291, 4) == 732915        if 4 is the second argument then the 4th from last number is removed and put on the end
rotate_rightmost_digits(735291, 5) == 752913        if 5 is the second argument then the 5th from last number is removed and put on the end
rotate_rightmost_digits(735291, 6) == 352917        if 6 is the second argument then the 6th from last number is removed and put on the end

Data Structure
-integers, strings, arrays

Algorithm
-we will be working from the last index to the first index and removing the element specified and putting it on the end of the number
in order to do this we need to be working with an array and the last position is normally at index -1  so we should add on a negative sign
to the argument
-define the method rotate_rightmost_digits and it has two parameters, number and rotate_digit
-initalize the variable number_split and assign it to the value of converting the given number into a string and calling the chars method on the parameter number
-initalize the variable element_rotated and assign it to the indexed position in number_split, the index will be based on the parameter, rotate_digit (negated)
-call the method delete on the variable number_split and pass in element_rotated as its argument
-then use the shovel operator to push in the variable element_rotated into the end of the array, number_split
-then join the array back together and conver it back to an integer

Code

=end

def rotate_rightmost_digits(number,rotate_digit)
  number_split = number.to_s.chars
  element_rotated = number_split[-rotate_digit]
  number_split.delete(element_rotated)
  number_split << element_rotated
  number_split.join.to_i
end

#test cases
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
