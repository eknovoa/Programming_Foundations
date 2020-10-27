=begin
Problem
-Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of
every word are swapped.

  Input:
  -string
  Output:
  -string

  Rules:
  -you may assume that every word contains at least one letter, and that the string will always contain at least one word.
  -you may assume that each string contains nothing but words and spaces
  -not case-sensitive

Examples/Test cases
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'  
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Data Structure
-strings and array

Algorithm
-define the method swap and it has one paramter, words
-initalize the variable result and assign it to the value of calling the split method on the paramter, words and calling the each method and passing in the do...end
  block as its argument, and it has parameter, word
  inside the method:
  -we are going to exchange the values of the first and last letter of the word by reassigning them so that word[0] is now assigned to the value stored in word[-1] and word[-1]
  now is assigned to the value stored in word[0]
-return the value of calling the join method on the variable, result

Code

=end

def swap(str)
  result = str.split.each do |word|
    word[0],word[-1] = word[-1], word[0]
  end
  result.join(" ")
end


#test cases
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
