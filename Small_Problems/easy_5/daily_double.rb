=begin
Problem
-write a method that takes a string argument and returns a new string that contains the value of the original string with all 
consecutive duplicate characters collapsed into a single character.

  Input:
  -string
  Output:
  -string

  Rules:
  -you may not use string#squeeze or string#squeeze!

Examples/Test Cases
crunch('ddaaiillyy ddoouubbllee') == 'daily double'         all test cases perform as suspected
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

Data Structure
strings, arrays

Algorithm
-define the method crunch and it has one parameter, string
-initalize variable str_split and assign it to the value of calling the chars method on string
-initalize variable new_string and assign it to an empty array
-initalize variable index and assign it to 0
-invoke the while loop method and  while index is less than the size of the array in str_split
  inside the method:
  -push in the element at the current index of str_split into the variable, new_string unless the current element is equal
  to the next element
  -index += 1 so that we don't have an infinite loop
-join the variable, new_string, and return the value

Code
=end

def crunch(string)
  str_split = string.chars
  new_string = []
  index = 0
  while index < (str_split.size)
    new_string << str_split[index] unless str_split[index] == str_split[index+1]
    index += 1
  end
  p new_string.join
end

#test cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
