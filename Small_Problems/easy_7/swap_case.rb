=begin
Problem
-write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase
letter by its uppercase version.

  Input:
  -string
  Output:
  -new string

  Rules:
  -all other characters besides the lowercase and uppercase ones, should be unchanged
  -you may not use string#swapcase; write your own version of this method

Examples/Test Cases
swapcase('CamelCase') == 'cAMELcASE'                  => uppercase and lowercase letters switched
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'  => the "-" is left alone

Data Structure
-strings and arrays

Algorithm
-define the method swapcase and it has one parameter, string
-initalize the variable str_split and assign it to the value of calling the chars method on the parameter, string
-initalize the variable new_string and assign it to an empty array
-call the map method on the variable str_split and pass in the do...end block as its argument and it has one parameter, char
  inside the method:
  -if char is uppercase then make it lowercase and push it into the variable new_string
  -if char is lowercase then make it uppercase and push it into the variable new_string
  -if char is neither uppercase or lowercase then leave it as is and push it into the variable new_string
-return the value of calling join() method on the variable new_string

Code

=end

def swapcase(string)
  new_string = []
  str_split = string.chars
  str_split.map do |char|
    new_string << char.downcase if char.count('A-Z') > 0
    new_string << char.upcase if char.count('a-z') > 0
    new_string << char if char.count('a-zA-Z') == 0
  end
  new_string.join()
end

#test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
