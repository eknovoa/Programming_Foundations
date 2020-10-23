=begin
Problem
-write a method that determines the mean(average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	     'A'
80 <= score < 90	       'B'
70 <= score < 80	       'C'
60 <= score < 70	       'D'
0 <= score < 60	         'F'

  Input:
  -three integers
  Output:
  -string containing one character, representing a grade

  Rules:
  -tested values are all between 0 and 100
  -there is no need to check for negative values or values greater than 100

Examples/Test Cases
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

Data Structure
-integers and strings

Algorithm
-define the method get_grade and it has three parameters, score1, score2, score3
-we need to write up a set of conditional statements to determine grades based on score averages
-initialize variable average and assign it to the value of adding score1 + score2 + score3 and dividing that sum by 3
-if the score average is equal to 90 or 100 and between 90 and 100 then you receive an A
-if the score average is equal to 80 and less than 90 then you receive a B
-if the score average is equal to 70 and less than 80 then you receive a C
-if the score average is equal to 60 and less than 70 then you receive a D
-if the score average is equal to 0 and less than 60 then you receive an F
Code

=end

def get_grade(score1,score2,score3)
  average = (score1 + score2 + score3) / 3

  if average >= 90 && average <= 100
    return "A"
  elsif average >= 80 && average < 90
    return "B"
  elsif average >= 70 && average < 80
    return "C"
  elsif average >= 60 && average < 70
    return "D"
  else
    return "F"
  end
end

#test cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
