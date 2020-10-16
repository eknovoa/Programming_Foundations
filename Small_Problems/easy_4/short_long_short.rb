=begin
Problem
-write a method that takes two strings as arguments, determines the longest of the two strings, and
then returns the result of concatenating the shorter string, the longer string, and the shorter string once again.

  Input:
  -two strings
  Output:
  -one string

  Rules:
  -you may assume that the strings are of different lengths
  -the return string format will be shorter, longer, shorter (sLs)
  -ignore the empty string if it is an argument

Example/Test Cases
-short_long_short('abc', 'defgh') == "abcdefghabc"      the string, abc is shorter and the longer one is defgh =>   sLs
-short_long_short('abcde', 'fgh') == "fghabcdefgh"      the string, fgh is shorter and the longer one is abcde =>   sLs
-short_long_short('', 'xyz') == "xyz"                   since one of the arguments is an empty string we just leave it alone and the output is the other string argument

Data Structure
-strings and array

Algorithm
-define the method, short_long_short and it has two parameters, str1 and str2
-so we want to see if str1.size < str2.size and if this is true then str1 is shorter and str2 is longer
  -at that point, we will assign str1 to the variable, shorter and str2 to the variable longer
else:
  -we will assign str1 to the variable, longer and str2 to the variable shorter
-so in our if/else conditional statements is where we will initalize the variables shorter and longer
-initalize variable final_str and assign it to the value of using string concataneation, shorter + longer + shorter
-return the variable final_Str

Code

=end

def short_long_short(str1,str2)
  if str1.size < str2.size
    shorter = str1
    longer = str2
  else
    shorter = str2
    longer = str1
  end

  final_str = shorter + longer + shorter
  final_str
end

#test cases
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
