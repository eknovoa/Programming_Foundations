=begin
Problem
-write a method that takes an integer, and converts it to a string representation. Extend the method by adding the ability to represent negative numbers as well.

  Input:
  -integer
  Output:
  -string

  Rules:
  -you may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
  -your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.
  -you may, however, use integer_to_string from the previous exercise

Examples/Test Cases
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Data Structure
-strings, integers

Algorithm
-initalize the constant variable DIGITS and assign it to hash with the following key/pair entries:
"0" - 0, "1" - 1, "2" - 2, "3" - 3, "4" - 4, "5" - 5, "6" - 6, "7" - 7, "8" - 8, "9" - 9
-define the method signed_integer_to_string and it has one parameter, integer
-initalize the variable array and assign it to an empty array
-initalize the variable int and assign it to the value of calling another method, positive_or_negative and passing in num as its argument
    -define the method positive_or_negative and it has one parameter, num
      inside this method:
      -we use if/else conditional statements.
        -if the parameter num is positive then we initalize variable int and assign it to the value stored in num
        -else we initalize variable int and assign it to the value stored in num except it is negated
        -then we return the value stored in int
-we want to basically reverse our last method problem... we need to locate the remainder using the modulus operator % (int % 10) to locate its key/value pair in the hash
    we will want to keep doing this until int / 10 == 0
    we will assign the int % 10 value into the variable called value
    to avoid having an infinite loop, we need to reassign the variable int to be int = int / 10
    then we need to add the value from the hash into the array as the last element by calling the unshift method
-we need to call the unshift method on the array one more time to add in the final string character to the front of the array (DIGITS[int])
-next we will call on another method called add_sign and pass in 3 arguments, array, num, and int
-define the method add_sign and it has 3 parameters, array, num, and int
    -inside this method we want to add the appropriate sign to the string, + or -
    -if num is equal to 0 then we don't need to add a sign, we can just call the join method on the array
    -elsif num is greater than 0 then we need to add the + sign to the front of the array and then join the array into one string
    -else we need to add the - sign to the front of the array and then join the array into one string

Code

=end

DIGITS = {
  0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def positive_or_negative(num)
  if num.positive?()
    int = num
  else
    int = -num
  end
  int
end

def signed_integer_to_string(num)
  array = []
  int = positive_or_negative(num)

  until int / 10 == 0
    value = int % 10
    int = int / 10
    array.unshift(DIGITS[value])
  end

  array.unshift(DIGITS[int])
  add_sign(array,num,int)

end

def add_sign(array,num,int)
  if num == 0
    array.join("")
  elsif num > 0 
    array.unshift("+").join("")
  else 
    array.unshift("-").join("")
  end
end

#test cases
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
