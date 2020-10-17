=begin
Problem
-write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

  Input:
  -string
  Output:
  -hash

  Rules:
  -words consist of any string of characters that do not include a space
  -empty string results in an empty hash

Examples/Test cases
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

Data Structure
-strings, arrays, hashes

Algorithm
-define the method, word_sizes and it has one parameter, string
-initalize the variable count and assign it to an empty hash
-initalize the variable array and assign it to an empty array
-call the split method on the parameter, string and assign to a variable text_split
-call the each method on the variable text_split and pass in the do...end block as its argument, and it has one parameter, str
  inside the method:
  -push the size of the string into the variable, array
-call the each method on the variable array and pass in the do...end block as its argument and it has one parameter, element
  inside the method:
  we need to add entries into the hash based on the frequency of the string size
  count[element] = array.count(element)
-return count

Code

=end

def word_sizes(string)
  count = {}
  array = []
  text_split = string.split
  text_split.each do |str|
    array << str.size
  end

  array.each do |element|
    count[element] = array.count(element)
  end

  count
end

#test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
