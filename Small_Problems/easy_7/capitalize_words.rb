=begin
Problem
-write a method that takes a single string argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other 
letters lowercase.

  Input:
  -string
  -Output:
  -modified string

  Rules:
  -you may assume that words are any sequence of non-blank characters
  -if a word in the string is in double quotes then it does not need to be capitalized
  -if we are given a string with a capitalized letter in the middle of the word we need to make sure it is returned as lowercase

Examples/Test Cases
word_cap('four score and seven') == 'Four Score And Seven'          => given all lowercase return first letter of each word capitalized
word_cap('the javaScript language') == 'The Javascript Language'    => given one uppercase letter in middle of word return all lowercase letters except the first letter of each word
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'    => given all lowercase letters return first letter of each word capitalized except for the word in quotes ""

Data Structure
-strings

Algorithm
-define the method word_cap and it has one parameter, string
-initialize the variable word_split and assign it the value of calling the split method on the parameter, string
-initalize the variable new_string and assign it to an empty array
-call the map method on the variable word_split and pass in the do...end block as its argument and it has one parameter, word
  inside the method:
  -if word[0] and word[-1] are == " then push in the word as it is into new_string and then call next
  -new_string << word.downcase.capitalize
-return the value of calling the join method on the new_string
Code

=end

def word_cap(string)
  new_string = []
  word_split = string.split()
  word_split.map do |word|
    if word[0] == '"' && word[-1] == '"'
      new_string << word
      next
    end
    new_string << word.downcase.capitalize
  end
  new_string.join(" ")
end

#test cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
