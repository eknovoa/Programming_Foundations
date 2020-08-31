puts "Please enter an integer greater than 0:"
num = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp

if answer == 's'
  total_sum = (1..num).sum
  puts "The sum of the integers between 1 and #{num} is #{total_sum}."
end

if answer == 'p'
  product = (1..num).inject(:*)
  puts "The product of the integers between 1 and #{num} is #{product}."
end
