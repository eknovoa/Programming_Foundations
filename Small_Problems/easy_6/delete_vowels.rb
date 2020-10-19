=begin
Problem
-write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a,e,i,o,u) removed

  Input:
  -string
  Output:
  -an array of strings

  Rules:
  -vowels need to be removed from the string

Examples/Test Cases
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data Structure
-strings and arrays

Algorithm
-define the method remove_vowels and it has one parameter, array
-initalize the variable new_array and assign it to an empty array
-call the map method on the variable array and pass in the do...end block as its argument and it has one parameter, element
  inside the method:
  -if element includes a vowel then we delete the vowels from the current element and assign it to updated_element variable
  -then push the variable, updated_element into the new_array
  -else we will just push the element into the new_array
-return the new_array

Code

=end

def remove_vowels(array)
  new_array = []
  array.map do |element|
    if element.count('aeiouAEIOU') > 0
      updated_element = element.delete('aeiouAEIOU')
      new_array << updated_element
    else 
      new_array << element
    end
  end
  new_array
end

#test cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
