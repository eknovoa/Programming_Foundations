=begin
Problem
-write a method that takes a string argument and returns true if all of the alphabetic characters inside the string are uppercase, false
otherwise.

  Input:
  -string
  Output:
  -boolean value

  Rules:
  -characters that are not alphabetic should be ignored: digits, whitespace, punctuation

Examples/Test Cases
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

Data Structure
-string, boolean value

Algorithm
-define the method uppercase? and it has one parameter, str
-initalize the variable str_split and assign it to the value of calling the chars method on the variable str
-initalize the variable results and assign it to an empty array
-call the select method on the variable str_split and pass in the do...end block as its argument and it has one parameter, char
  if char.count("a-z") > 0 push the boolean value false into results
  else push the boolean value true into results
-if results.all? then return true
else return false

Code

=end

def uppercase?(str)
  results = []
  str_split = str.chars
  str_split.select do |char|
    if char.count("a-z") > 0
      results << false
    else
      results << true
    end
  end
  if results.all?
    return true
  else
    return false
  end
end

#test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
