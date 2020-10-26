=begin
Problem
-write a method that takes one argument, a string containing one or more words, and returns the given string with
words that contain five or more characters reversed.

  Input:
  -string
  Output:
  -return a modified string

  Rules:
  -the given string will contain one or more words
  -inside the string that is returned, the words that contain five or more characters will be reversed
  -each string will consist of only letters and spaces
  -spaces should be included only when more than one word is present

Examples/Test cases
-puts reverse_words('Professional')          # => lanoisseforP            more than 5 characters so it is reversed and it is case-sensitive
-puts reverse_words('Walk around the block') # => Walk dnuora the kcolb   Walk and the are less than 5 characters and remain the same // case-sensitive
-puts reverse_words('Launch School')         # => hcnuaL loohcS           both words are more than 5 characters and are reversed // case-sensitive

Data Structure
-strings and arrays

Algorithm
-define the method reverse_words and it will have one parameter, string
-initialize local variable str_split and assign it to the return value of calling the split method on the parameter, string
-now we will call the each method on the variable, str_split and pass in the do...end block as its argument and it will have one parameter, element
  -inside the method:
  -we want to check and see if each element has a length of 5 or more so we can do this by calling the size method on the element and we will make
  this a conditional statement... if element.size >= 5 then we will reverse this string.
  -if the element is less than 5 characters we will leave it unchanged
  -let's assume the length of the element is equal to or more than 5 characters, if so we will call the reverse! method on that specific element and this method is
  destructive and will permanently modify the string
-we will return the value of calling the join method on the str_split variable and passing in an empty space as its argument, " "

Code

=end

def reverse_words(str)
  str_split = str.split.each { |word| word.reverse! if word.size >= 5}
  str_split.join(" ")
end

#test cases
puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
