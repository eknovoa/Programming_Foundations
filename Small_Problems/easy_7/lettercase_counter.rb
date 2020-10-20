=begin
Problem
-write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are 
lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

  Input:
  -string
  Output:
  -hash

  Rules:
  -"neither" can account for integers and spaces and non-alphanumeric cases
  -"uppercase" can cacount for all uppercase letters
  -"lowercase" can account for all lowercase letters

Examples/Test Cases
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }   => lc: 5  uc: 1  neither: 4 (we can take into account integers and spaces)
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }     => lc: 3  uc: 3  neither: 2 (one character, +, and a space)
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }          => lc: 0  uc: 0  neither: 3 (all integers)
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }             => lc: 0  uc: 0  neither: 0 (an empty string)

Data Structure
-strings, arrays, integers

Algorithm
-define the method letter_case_count and it has one parameter, string
-objective: to iterate through each character of the string to idetify what is lowercase, uppercase, or neither and then use a hash to store in the frequencies of each
-initalize the variable str_split and assign it to the return value of calling the chars method on the parameter, string
-initalize the variable frequency_count and assign it to this hash, {:lowercase => 0, :uppercase => 0, :neither => 0}
-call the each method on the variable str_split and pass in the do...end block as its argument and it has one parameter, char
  inside the method:
  -if char.count('A-Z') > 0 then add an entry to the hash, frequency_count[:uppercase] = 1
  -if char.count('a-z') > 0 then add an entry to the hash, frequency_count[:lowercase] = 1
  -if char.count('a-zA-Z') == 0 then add an entry to the hash, frequency_count[:neither] = 1
-return the variable, frequency_count
Code

=end

def letter_case_count(string)
  str_split = string.chars
  frequency_count = {:lowercase => 0, :uppercase => 0, :neither => 0}
  str_split.each do |char|
    frequency_count[:uppercase] += 1 if char.count('A-Z') > 0
    frequency_count[:lowercase] += 1 if char.count('a-z') > 0
    frequency_count[:neither] += 1 if char.count('a-zA-Z') == 0
  end
  frequency_count
end

#test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
