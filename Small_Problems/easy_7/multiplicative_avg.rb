=begin
Problem
-write a method that takes an array of integers as input, multiplies all the numbers together, divides the result by 
the number of entries in the array, and then prints the result rounded to 3 decimal places

  Input:
  -array of integers
  Output:
  -float number

  Rules:
  -assume the array is non-empty
  -be sure to round to 3 decimal places

Examples/Test Cases
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

Data Structure
-arrays and integers, and floats

Algorithm
-define the method show_multiplicative_average and it has one parameter, numbers
-initalize the variable product and assign it to the value of calling .to_f method on 1
-call the each method on the parameter numbers and pass in the do...end block as its argument and it has one parameter, number
  inside the method:
  -reassign product to be product = product * number
-initalize the variable average and assign it to the value of dividing the product by the size of the numbers in the array given
-call the puts method to display the string, "The result is _."
-round the result to 3 decimal places using the format method

Code

=end

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

#test cases
show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
