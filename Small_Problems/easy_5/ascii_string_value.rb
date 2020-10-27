=begin
Problem
-write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values
of every character in the string.

  Input:
  -string
  Output:
  -integer

  Rules:
  -you may use string#ord to determine the ASCII value of a character

Examples/Test cases
ascii_value('Four score') == 984         => 102+111+117+114+115+99+111+114+101 = 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97                   => 'a'.ord = 97
ascii_value('') == 0                     => ''.ord returns an error so we need this to return a 0 and ' '.ord returns 32

Data Structure
-strings and integers

Algorithm
-define the method ascii_value and it has one paramter, str
-initalize the variable, sum and assign it to 0
-call the chars method to split the string apart and into an array and then call the each method to iterate through the array and pass in the do...end block as its 
  argument and it has one paramter, char
  inside the method:
  -reassign the variable sum to be sum = sum + char.ord
return the value stored in the variable, sum

Code

=end

def ascii_value(str)
  sum = 0
  str.chars.each { |char| sum += char.ord }
  sum
end

#test cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
