def average(array)
  sum = 0
  array.each do |element|
    sum = sum + element
  end
  avg = sum.to_f / (array.size).to_f
  avg
end

# test cases
puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])


# also could have used Enumerable#reduce (#inject) // array.reduce(:+)