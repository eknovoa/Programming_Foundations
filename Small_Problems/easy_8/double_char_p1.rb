=begin
Problem
-write a method that takes a string, and returns a new string in which every character is doubled.

  Input:
  -string
  Output:
  -new string

  Rules:
  -in the new string every character is doubled
  -it's not case-sensitive
  -characters also include non-alphanumeric and spaces are doubled

Examples/Test Cases
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

Data Structure
-strings, arrays, and integers

Algorithm
-define the method repeater and it has one paramter, string
-initalize the variable str_split and assign it to the value of calling the chars method on the parameter, string
-initalize the variable array and assign it to an empty array
-call the map method on the variable str_split and pass in the do...end block as its argument it will have one parameter, letter
  inside the method:
  -use the shovel operator to push (letter * 2) into the variable array
-call the join method on the variable array

Code

=end

def repeater(string)
  array = []
  str_split = string.chars
  str_split.map do |letter|
    array << letter * 2
  end
  array.join
end

#test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
