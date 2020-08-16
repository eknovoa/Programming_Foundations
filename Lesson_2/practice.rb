=begin
require "pry" # add this to use Pry

counter = 0

loop do
  counter += 1
  binding.pry
  break if counter == 5
end
=end

name = "Lisa"

def name
  "George"
end

loop do
  puts name
  break
end