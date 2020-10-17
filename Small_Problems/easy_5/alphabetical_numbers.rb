=begin
Problem
-write a method that takes an array of integers between 0 and 19 and returns an array of those integers sorted based on the
english words for each number: 

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

  Input:
  -array of integers
  Output:
  -array of integers

  Rules:
  -

Examples/Test Cases
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]

Data Structure
-integers, arrays

Algorithm
-define the method alphabetic_number_sort and it has one parameter, array
-initalize constant variable, WORD_NUMBERS and assign it to a hash with numbers and their associated english words
-I think we need to create a new array with english words that are associated with the numbers given in the array. Then sort that array and then turn
that array back into the appropriate integers associated with the english words.

-initalize variable, english_words and assign it an empty array.
-call the each method on the parameter, array and pass in the do...end block as its argument, and it will have one parameter, num
  inside the method:
  -use the shovel operator (<<) to push the appropriate value from the hash based on the key into the variable english_words
-call the sort! method on the english_words variable to sort the words
-call the each method on the variable english_words and pass in the do...end block as its argument with one parameter, word
  inside the method:
  -use the shovel operator (<<) to push the appropriate keys based on the current value stored in the parameter, word, and push into the array,
  sorted_numbers
-return sorted_numbers

Code

=end

WORD_NUMBERS = { 0 =>"zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight",
               9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
               17 => "seventeen", 18 => "eighteen", 19 => "nineteen" }

def alphabetic_number_sort(array)
  english_words = []
  sorted_numbers = []
  array.each do |num|
    english_words << WORD_NUMBERS[num]
  end 
  english_words.sort!

  english_words.each do |word|
    sorted_numbers << WORD_NUMBERS.key(word)
  end

  sorted_numbers
end

#test cases
p alphabetic_number_sort((0..19).to_a) ==
 [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]
