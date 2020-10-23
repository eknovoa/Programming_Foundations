=begin
Problem
-write a method that takes a string as an argument and returns an array that contains every word from the string, to which you have appended a space
and the word length.

  Input:
  -string
  Output:
  -an array of strings

  Rules:
  -you may assume that words in the strings are separated by exactly one space, and that any substring of non-space characters is a word.

Examples/Test Cases
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

Data Structure
-strings and arrays

Algorithm
-define the method word_lengths and it has one parameter, str
-initalize the variable str_split and assign it to the value of calling the split method on the variable str
-initalize the variable array and assign it to an empty array
-call the map method on the variable str_split and pass in the do...end block as its argument and it has one parameter, word
  inside the method:
  -using the shovel operator push the word + " " + word.size.to_s into the variable array
-return the value stored in the variable array
Code

=end

def word_lengths(str)
  array = []
  str_split = str.split
  str_split.map do |word|
    array << word + " " + word.size.to_s
  end
  array
end

#test cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
