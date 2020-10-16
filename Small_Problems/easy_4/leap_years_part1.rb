=begin
Problem
-Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year or false if
it is not a leap year.

end

  Input:
  -integer
  Output:
  -boolean value

  Rules:
  -Assume this rule is good for any year greater than year 0.
  -In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year
  is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly
  divisible by 400.

Examples/Test Cases
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

Data Structure
-integers and boolean values

Algorithm
-define the method leap_year? and it has one paramter, year
-if year is divisible by 4 evenly && if year is not divisible by 100 evenly then we have a leap year so we return true else false
-if the given year is divisible by 4 and by 100 and by 400 then it is a leap year then we return true else false

code

=end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0
    true
  else
    false
  end
end

#test Cases
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
