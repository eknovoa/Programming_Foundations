=begin
Problem
-build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number
between 20 and 200

  Output:
  -string

Examples/Test Cases
-Example Output:
  Teddy is 69 years old!

Data Structure
-integer and string

Algorithm
-initalize local variable age and assign it to rand(20..200)
-call the puts method and pass in the string "Teddy is #{age} years old!"

Code

=end

age = rand(2..200)
puts "Teddy is #{age} years old!"
