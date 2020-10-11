=begin
Problem
-write a method that takes one argument, a string, and returns a new string with the words in reverse order

  Input:
  -string
  Output:
  -new string in reverse order

  Rules:
  -do not use the reverse function for more of a challenge

Examples/Test cases
-puts reverse_sentence('') == ''      => true
-puts reverse_sentence('Hello World') == 'World Hello'     => true
-puts reverse_sentence('Reverse these words') == 'words these Reverse'    => true


Data Structure
-strings and arrays

Algorithm
-Objective: so we basically want to take off the last word of the given string and push it into a new array and join the elemnts of the array
and return it as a new string that is reversed
-define the method reverse_sentence and it has one parameter, string
-initalize variable str_split and assign it the value of calling the split method on the parameter, string
-initalize variable array and assign it to an empty array
-call the map method on the variable str_split and pass in the do...end block as its argument and it has one parameter, str
  -inside the method:
  -call the prepend method on the variable array and pass in the current iteration of the parameter, str as its argument
-return the value of calling the join method on the array variable and pass in (" ") as its argument

end

Code

=end

def reverse_sentence(string)
  str_split = string.split()
  array = []
  str_split.map do |str|
    array.prepend(str)
  end
  array.join(" ")
end

#test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
