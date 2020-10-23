=begin
Problem
-create a method that takes 2 arguments, an array and a hash. THe array will contain 2 or more elements that when combined with adjoining
spaces will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should
return a greeting that uses the person's full name, and mentions the person's title and occupation.

  Input:
  -an array and a hash
  Output:
  -string greeting
  
  Rules:

Examples/Test Cases
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

Data Structure
-strings, hash, and array

Algorithm
-define the method greetings and it has two parameters, arr and hsh
-call the puts method and pass in the following string as its argument (also we will use string interpolation to incorprate the values of the keys in the given hash)
  puts "Hello, #{arr.join(" ")}! Nice to have a hsh[:title] hsh[:occupation] around."

Code

=end

def greetings(arr,hsh)
  return "Hello, #{arr.join(" ")}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

#test cases
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."
