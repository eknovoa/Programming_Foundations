=begin
Problem
-write a method that takes a first name, a space, and a last name passed as a single string argument, and returns a
string that contains the last name, a comma, a space, and the first name.

  Input:
  Output:

  Rules:

Examples/Test Cases
swap_name('Joe Roberts') == 'Roberts, Joe'

Data Structure
-strings

Algorithm
-define the method swap_name and it has one parameter, str
-initalize the variable name and assign it to the value of calling the split method on the parameter, str
-initalize variable first_name and assign it to name[0]
-initalize variable last_name and assign it to name[1]
-return the string "#{last_name}, #{first_name}"

Code

=end

def swap_name(str)
  name = str.split
  first_name = name[0]
  last_name = name[1]
  return "#{last_name}, #{first_name}"
end

#test cases
p swap_name('Joe Roberts') == 'Roberts, Joe'
