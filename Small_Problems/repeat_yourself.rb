=begin
Problem
  -define a method called repeat and give it two parameters, a string and a positive integer
  -prints the string as many times as the integer indicates
Examples/Test Cases
  - repeat('Hello', 3)
  - repeat('World', 1)
  - repeat('!', 0)
Data Structure
  -Inputs: string and integer
  -Outputs: new string multiple times (amount of integer)
Algorithm
  - define the method repeat and give it two parameters, str and int
  - inside the method call the times method on the parameter int and pass in the do...end block as its argument.
    inside the do...end block call the puts method and pass in the parameter str as its argument
    end the block
    end the method definition
  - use the test cases to check out problem works
Code
  -seen below
=end


def repeat(str, int)
  int.times do
    puts str
  end
end

#test cases:
repeat('Hello', 3)
repeat('World', 1)
repeat('!', 0)
