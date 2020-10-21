=begin
Problem
-write a method that takes a string as an argument and returns a new string that contains the original value 
using a staggered capitalization scheme in which every other character is capitalized, and the remaning characters are
lowercase.

  Input:
  -string
  Output:
  -new string

  Rules:
  -characters that are not letters should not be changed, but count as characters when switching between
  upper and lowercase.
  -the new string will always start with an uppercase (index 0 will always be uppercase)

Examples/Test Cases
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'    => new string always starts with an uppercase

Data Structure
-strings and arrays

Algorithm
-define the method staggered_case and it has one parameter, string
-initalize the variable str_split and assign it to the value of calling the chars method on the parameter, string
-initalize the variable new_string and assign it to an empty array
-initalize the variable index and assign it to 0
-invoke the while loop method and pass in this conditional statement as its argument, index < str_split.size
  inside the method:
  -if str_split at current indexed position is even and is a letter then we uppercase it and return it to the new_string
  -if str_split at current indexed position is odd and is a letter then we lowercase it and reutrn it to the new_string
  -else pass in str_split at current indexed position into the new_string as is
  -reassign index to be index = index + 1
-call the join method on the variable new_string and return this value
Code

=end

def staggered_case(string)
  str_split = string.chars
  new_string = []
  index = 0
  while index < str_split.size
    if index.even? && str_split[index].count('a-zA-Z') > 0
      new_string << str_split[index].upcase
    elsif index.odd? && str_split[index].count('a-zA-Z') > 0
      new_string << str_split[index].downcase
    else
      new_string << str_split[index]
    end
    index += 1
  end
  new_string.join()
end

#test cases
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
