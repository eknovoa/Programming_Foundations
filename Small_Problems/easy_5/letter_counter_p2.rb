=begin
Problem
-modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

  Input:
  -string
  Output:
  -hash

  Rules:
  -exclude non-letters from the word size

Examples/Test cases
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

Data Structure
-string, arrays, and hashes

Algorithm
-define the method word_sizes and it has one parameter, string
-initalize the variable count and assign it to an empty hash
-initalize the variable array and assign it to an empty array
-initalize the constant variable, CHARACTERS and assign it to the string "!@#$%^&*()_-+=~`:;''/?,.<>"
-call the split method on the parameter, string and assign to a variable text_split
-call the each method on the variable text_split and pass in the do...end block as its argument, and it has one parameter, str
  inside the method:
  -initalize variable num and assign it to str.count(CHARACTERS)
  -push the size of the string - num into the variable, array
-call the each method on the variable array and pass in the do...end block as its argument and it has one parameter, element
  inside the method:
  we need to add entries into the hash based on the frequency of the string size
  count[element] = array.count(element)
-return count

Code

=end

CHARACTERS = "!@#$%^&*()_=+~`:-;''/?,.<>"

def word_sizes(string)
  count = {}
  array = []
  text_split = string.split
  text_split.each do |str|
    num = str.count(CHARACTERS)
    array << str.size - num
  end

  array.each do |element|
    count[element] = array.count(element)
  end

  count
end

#test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
