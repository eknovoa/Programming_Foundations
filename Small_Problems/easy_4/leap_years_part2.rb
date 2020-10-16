=begin
Problem
-Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year or false if
it is not a leap year. Update method from leap years part 1 to determine leap years both before and after 1752.

end

  Input:
  -integer
  Output:
  -boolean value

  Rules:
  -Assume this rule is good for any year greater than year 0.
  -In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year
  is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly
  divisible by 400. The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar
  was used. Under the Julian Calendar, leap years occur in any year tha is evenly divisible by 4.

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
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

Data Structure
-integers and boolean values

Algorithm
-define the method leap_year? and it has one paramter, year
-so we have two sets of rules: before the Gregorian Calendar of 1752 (Julian Calendar) and then after the Gregorian Calendar
-we need a set of rules for the Julian Calendar before 1752
  -if year is divisible by 4 evenly, then it is a leap year and returns true else false
***this set of rules is from the Gregorian Calendar time stamp so in 1752
-if year is divisible by 4 evenly && if year is not divisible by 100 evenly then we have a leap year so we return true else false
-if the given year is divisible by 4 and by 100 and by 400 then it is a leap year then we return true else false

code

=end

def leap_year?(year)

  if year < 1752
    if year % 4 == 0
      true
    else
      false
    end
  elsif year >= 1752
    if year % 4 == 0 && year % 100 != 0
      true
    elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0
      true
    else
      false
    end
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
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
