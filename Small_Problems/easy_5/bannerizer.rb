=begin
Problem
-write a method that will take a short line of text and print it within a box.

  Input:
  -string
  Output:
  -string display

  Rules:
  -you may assume that the input will always fit in your terminal window

Examples/Test Cases
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |              => this box expands to the right based on the length of the string there is one extra '-' on each side so two of them
|                                            |                  total like with the standard box... so the extra '-' are equivalent to the length of the string
+--------------------------------------------+              => there will always be 3 '|' on each side of the string

print_in_box('')
+--+
|  |                => this is the standard box size when the string is empty... it has 3 rows of | and four + total with two '-' separating the '+'
|  |
|  |
+--+

Data Structure
-strings

Algorithm
-define the method print_in_box and it has one parameter, string
-initalize the variable str_size = string.size
-identify what the standard box would look like with an empty string and then make the changes that would occur based on the size of the string
-then display the box with the string
  standard box looks like this:
  puts "+--+"
  puts "|  |"
  puts "|  |"
  puts "|  |"
  puts "+--+"
-Now we need to identify how every line will change based on the size of our string.
  line 1: the "-" will change so we will always have two of them, one on each side of the string... so after "+-" is when we need the rest of the "-" to match 
  size of string and then finish line 1 with "-+"
  line 2: we start with "| " and then have empty spaces to match the size of string and then end with " |"
  line 3: we start with "| " and then have the string and then end with " |"
  line 4: we start with "| " and then have empty spaces to match the size of string and then end with " |"
  line 5: we start with "+-" and then have more "-" to equal size of string and then end with "-+"
-so now that we have identified what the format will be like, we need to start line by line to check the layout

Code

=end

def print_in_box(string)
  str_size = string.size
  puts "+-" + ("-" * str_size) + "-+"
  puts "| " + (" " * str_size) + " |"
  puts "| " + string + " |"
  puts "| " + (" " * str_size) + " |"
  puts "+-" + ("-" * str_size) + "-+"

end

#test cases
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
