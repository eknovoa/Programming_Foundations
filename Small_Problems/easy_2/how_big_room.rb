=begin
Problem
-build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both
square meters and square feet

  Output:
  -strings

  Rules:
  -1 square meter == 10.7639 square feet
  -do not worry about validating the input at this time

Examples/Test Cases

  Example Run:
  Enter the length of the room in meters:
  10
  Enter the width of the room in meters:
  7
  The area of the room is 70.0 square meters (753.47 square feet).

Data Structure
-strings and integers

Algorithm
-call the puts method and pass in the string "Enter the length of the room in meters:" as its argument
-initalize the variable length and assign it to gets.chomp.to_i
-call the puts method and pass in the string "Enter the width of the room in meters:" as its argument
-initalize the variable width and assign it to gets.chomp.to_i
-initalize the variable area_meters and assign it to the value of multiplying the variables length and width together.
-initalize the variable area_feet and assign it to the value of multiplying the variable area_meters times 10.7639 and call the round method of this value
and pass in 2 as its argument
-call the puts method and pass in the string "The area of the room is #{area_meters.to_f} square meters (#{area_feet} square feet)." as its argument

Code

=end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i
area_meters = length * width
area_feet = (area_meters * 10.7639).round(2)
puts "The area of the room is #{area_meters.to_f} square meters (#{area_feet} square feet)."
