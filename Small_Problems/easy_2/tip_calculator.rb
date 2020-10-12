=begin
Problem
-create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute
the tip and then display both the tip and the total amount of the bill.

  Input:
  -user input (two integers)
  Output:
  -strings

  Rules:
  -need to enter integers (for user input)
  -on the output both numbers will be rounded to one decinmal place

Examples/Test Cases

  Example Output:
  What is the bill? 200
  What is the tip percentage? 15

  The tip is $30.0
  The total is $230.0

Data Structure
-integers and strings

Algorithm
-call the puts method and pass in the string "What is the bill?" as its argument
-initalize variable bill and assign it to gets.chomp.to_f
-call the puts method and pass in the string "What is the tip percentage?" as its argument
-initalize variable tip and assign it to gets.chomp.to_f
-initalize variable tip_amount and assign it to the value of multiplying bill times (tip_amount/100) call the round method and pass in 1 as its argument
-initalize variable total_bill and assign it the value of adding bill + tip_amount
-call the puts method and pass in the string "The tip is $#{tip_amount}" as its argument
-call the puts method and pass in the string "THe total is $#{total_bill}" as its argument

Code

=end

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip = gets.chomp.to_f
tip_amount = (bill * (tip/100)).round(1)
total_bill = bill + tip_amount
puts "The tip is $#{tip_amount}"
puts "The total is $#{total_bill}"
