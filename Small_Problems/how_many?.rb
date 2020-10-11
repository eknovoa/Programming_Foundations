=begin
Problem
-write a method that counts the number of occurrences of each element in a given array.

  Input:
  -array of strings
  Output:
  -string

  Rules:
  -The words in the array are case-sensitive: 'suv' != 'SUV'
  -once counted, print each element alongside the number of occurrences

Examples/Test Cases
  vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

  count_occurrences(vehicles)

  Expected Output:
  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2


Data Structure
-strings, integeres, and arrays

Algorithm
-define the method, count_occurrences and it has one parameter, rides
-initalize the variable occurrences and assign it to an empty hash
-our first goal is to turn each element in the given array into all lowercase characters. we can do this by calling the each method on the
parameter rides without modifying the original array. we will pass in the do...end block as its argument and it has one parameter, ride
  -inside the method:
  -call the gsub! method on the parameter, ride and pass in the value of calling the downcase! method on the parameter, ride
-now we need to chan the #uniq and #each methods together and call them on the parameter, rides and pass in the do...end block as its argument, with a
parameter, ride
  -inside the method:
  -we create a new entry in the hash, occurrences by passing in the parameter, ride as its key and its value will be the value of calling the count method
   on the parameter, rides, and passing, in the other parameter, ride as its argument
now to display the information, we can call the each method on the variable, occurrences and pass in the do...end block as its argument and it has two parameters,
ride and count
  -inside the method:
  -call the puts method and pass in the string "#{ride} => #{count}" as its argument - also call the capitalize method on the parameter, ride


Code

=end


def count_occurrences(rides)
  occurrences = {}

  rides.each do |ride|
    ride.gsub!(ride.downcase!)
  end

  rides.each do |ride|
    occurrences[ride] = rides.count(ride)
  end

  occurrences.each do |ride, count|
    puts "#{ride.capitalize} => #{count}"
  end
end

vehicles = [ 'car', 'car', 'TRUCK', 'car', 'SuV', 'TRuck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
