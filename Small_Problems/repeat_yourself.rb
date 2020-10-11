=begin
Problem
  -define a method called repeat and give it two parameters, a string and a positive integer
  -prints the string as many times as the integer indicates

    Input:
    -string and integer
    Output:
    -string

Examples/Test Cases
  - repeat('Hello', 3) =>  Hello   Hello    Hello
  - repeat('World', 1) => World
  - repeat('!', 0)

Data Structure
  -strings and integers

Algorithm
  - define the method repeat and give it two parameters, string and int
  - inside the method definition:
    -call the times method on the parameter, int, and pass in the do...end block as its argument and it has one parameter, string
    -inside the times method:
      -call the puts method and pass in the parameter, string as its argument

Code

=end

def repeat(string, int)
  int.times do 
    puts string
  end
end

#test cases
repeat('Hello', 3)
repeat('World', 1)
repeat('!', 0)
