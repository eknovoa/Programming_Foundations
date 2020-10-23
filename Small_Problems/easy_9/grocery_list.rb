=begin
Problem
-write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit

  Input:
  -a nested array
  Output:
  -one array

  Rules:


Examples/Test Cases
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data Structure
-nested arrays, one dimensional arrays, strings, integers

Algorithm
-define the method buy_fruit and it has one parameter, list
-initalize the variable grocery_list and assign it to an empty array
-call the each method on the variable list and pass in the do...end block as its argument and it has one parameter, item
  inside the method:
  -call the times method on the second indexed position in the variable, item that is an integer and pass in the do...end block as its argument
    inside the method:
    -using the shovel operator push in the food (item[0]) into the grocery_list
-return the grocery_list

Code

=end

def buy_fruit(list)
  grocery_list = []
  list.each do |item|
    item[1].times do
      grocery_list << item[0]
    end
  end
  grocery_list
end

#test cases
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
