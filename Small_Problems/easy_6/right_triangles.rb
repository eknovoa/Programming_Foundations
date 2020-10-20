=begin
Problem
-write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

  Input:
  -integer
  Output:
  -string design display

  Rules:

Examples/Test cases
triangle(5)

    *            => so there are 5 * in the far right column and then decreases by one * from right to left
   **
  ***
 ****
*****

triangle(9)

        *        => so there are 9 * in the far right column and then decreases by one * from right to left
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Data Structure
-integers, strings

Algorithm
-define the method triangle and it has one parameter, integer
-we know we need to print out a set of "*" 9 times and each row needs to increase with one "*" each time but adds on to the left of the initial "*"
-initalize the variable count and assign it to 1
-initalize the variable number_of_spaces = integer - 1
-invoke the while loop method and pass in this conditional statement as its argument, count <= integer
  inside the method:
  -initalize variable spaces and assign it to the string " " times number_of_spaces
  -call the puts method and pass in spaces + ("*" * count) as its argument
  -reassign count to be count += 1 
  -reassign number_of_spaces to be number_of_spaces -= 1

Code

=end

def triangle(integer)
  count = 1
  number_of_spaces = integer - 1
  while count <= integer
    spaces = " " * number_of_spaces
    puts spaces + ("*" * count)
    count += 1
    number_of_spaces -= 1
  end
end

#test cases
triangle(5)
triangle(9)
